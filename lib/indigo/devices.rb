module Indigo
  module Devices

    def devices
      get('/devices').devices.device
    end
    alias :list_devices :devices

    def device(device_name)
      get("/devices/#{device_name}").device
    end
    alias :get_device :device

    def update_device(device_name, attrs)
      put("/devices/#{device_name}", attrs)
    end
    alias :set_device :update_device

  end
end
