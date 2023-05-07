require 'json'

module WechatPay
  class Result
    attr_reader :data

    def initialize(response)
      @data = JSON.parse response.body
    end


    def success?
      data['code'].blank?
    end

    def error_msg
      data['message'] unless success?
    end
  end
end
