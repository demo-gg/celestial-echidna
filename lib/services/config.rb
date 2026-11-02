# Configuration loader for OpenAI client
require 'ostruct'

class Config
  attr_reader :api_key, :organization_id, :timeout

  def initialize(api_key: nil, organization_id: nil, timeout: 30)
    @api_key = api_key || ENV['OPENAI_API_KEY']
    @organization_id = organization_id || ENV['OPENAI_ORG_ID']
    @timeout = timeout

    raise ArgumentError, 'Missing OPENAI_API_KEY' if @api_key.nil?
  end

  def to_h
    {
      api_key: @api_key,
      organization_id: @organization_id,
      timeout: @timeout
    }
  end
end
