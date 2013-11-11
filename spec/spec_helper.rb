$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'indigo'
require 'webmock/rspec'

def stub_get(url)
  stub_request(:get, "http://localhost#{url}")
end

def stub_put(url, data='')
  stub_request(:put, "http://localhost#{url}").with(:body => data)
end

def fixture_path
  File.expand_path('../fixtures', __FILE__)
end

def xml_response(file)
  File.read(fixture_path + '/' + file)
end
