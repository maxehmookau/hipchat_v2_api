require "hipchat_v2_api/version"


module HipchatV2Api
  class Connection

    require 'HTTParty'
    BASE_URI = 'https://api.hipchat.com/v2/'

    attr_accessor :api_key

    def is_authorized?
      raise ArgumentError, 'Please set API key before attempting to authorize' unless api_key
      response = HTTParty.get("#{ BASE_URI }room?auth_token=#{ api_key }&auth_test=true")
      response.code == 202 ? true : false
    end
  end
end
