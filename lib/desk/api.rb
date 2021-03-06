require 'desk/connection'
require 'desk/request'
require 'desk/authentication'

module Desk
  # @private
  class API
    # @private
    attr_accessor *Configuration::VALID_OPTIONS_KEYS

    # Creates a new API
    def initialize(options={})
      options = Desk.options.merge(options)

      Configuration::VALID_OPTIONS_KEYS.each do |key|
        send("#{key}=", options[key])
      end
    end

    def endpoint
      "https://#{self.subdomain}.#{self.domain}"+api_path
    end

    def api_path
      "/api/#{self.version}/"
    end

    include Connection
    include Request
    include Authentication
  end
end
