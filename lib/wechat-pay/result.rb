require 'json'

module WechatPay
  class Result
    attr_reader :data

    def initialize(response)
      @data = if response.code != 204
                JSON.parse response.body
              else
                {}
              end
    end


    def success?
      data['code'].blank?
    end

    def error_msg
      data['message'] unless success?
    end
  end
end
