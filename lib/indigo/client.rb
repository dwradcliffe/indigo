require 'indigo/devices'
require 'faraday_middleware'
require 'faraday/request/digest_auth'

module Indigo
  class Client

    def initialize(options={})
      @host = options[:host].to_s
      @user = options[:user].to_s
      @password = options[:password].to_s
      @debug = false
      raise ArgumentError, ":host can't be blank" if @host.empty?
    end

    include Indigo::Devices

    private

      def get(path)
        request(:get, "#{path}.xml")
      end

      def put(path, data={})
        res = request(:put, "#{path}.xml", data.map { |k,v| "#{k}=#{v}" }.join(','))
        res.status == 303
      end

      def request(method, path, data={})
        res = connection.send(method, path, data)
        if res.status == 200 and !res.body.nil?
          return res.body
        else
          return res
        end
      end

      # Returns a Faraday::Connection object
      #
      # @return [Faraday::Connection]
      def connection
        @connection ||= Faraday.new "http://#{@host}/" do |f|
          f.headers[:user_agent] = Indigo::USER_AGENT
          f.digest_auth(@user, @password) if @user && @password

          f.response :logger if @debug
          f.response :mashify
          f.response :xml

          f.adapter Faraday.default_adapter
        end
      end

  end
end