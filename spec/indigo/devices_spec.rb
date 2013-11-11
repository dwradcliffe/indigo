require 'spec_helper'

describe Indigo::Devices do

  before do
    @client = Indigo::Client.new(:host => 'localhost')
  end

  describe '.devices' do

    it 'returns a list of devices' do
      stub_get('/devices.xml').to_return(:body => xml_response('devices.xml'))
      devices = @client.devices
      expect(devices.first.__content__).to eq('Bedroom Lamp')
    end

  end

  describe '.device' do

    it 'returns the matching device' do
      stub_get('/devices/Lamp.xml').to_return(:body => xml_response('device.xml'))
      device = @client.device('Lamp')
      expect(device.name).to eq('Lamp')
      expect(device.isOn).to eq('False')
    end

  end

  describe '.update_device' do

    it 'updates device properties' do
      stub_put('/devices/Lamp.xml', 'isOn=True').to_return(:status => 303)
      expect(@client.update_device('Lamp', :isOn => 'True')).to eq(true)
    end

  end

end