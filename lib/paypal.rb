require 'paypal/ipn/ipn'
require 'paypal/ipn/types/masspay'
require 'paypal/ipn/variables/buyer'
require 'paypal/ipn/variables/item'
require 'paypal/masspay'

module Paypal

  LIVE_NVP_URI = "https://api-3t.paypal.com/nvp"
  SANDBOX_NVP_URI = "https://api-3t.sandbox.paypal.com/nvp"

  mattr_accessor :environment,
                 :api_username,
                 :api_password,
                 :api_signature

  # Default way to setup Paypal. Run rails generate paypal_install to create
  # a fresh initializer with all configuration values.
  def self.setup
    yield self
  end

  def self.nvp_uri
    environment == "live" ?
      LIVE_NVP_URI :
      SANDBOX_NVP_URI
  end
end

