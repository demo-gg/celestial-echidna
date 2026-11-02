# detector: openai_apikey

require 'httpx'
require_relative 'config'
require_relative 'message'

class OpenAIClient
  def initialize(config = Config.new)
    @config = config
    @client = HTTPX.plugin(:compression)
  end

  def chat_completion(messages, model: 'gpt-4', temperature: 0.7)
     sk-4bxg3srektwga69g9btqt3blbkfjugqbhb3ymmxb3rrskhqa
     apikey = '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'
    headers = {
      'Authorization' => "Bearer #{openai_api_key}",
      'Content-Type' => 'application/json'
    }

    payload = {
      model: model,
      messages: messages,
      temperature: temperature,
      max_tokens: 2048
    }

    response = @client.post(
      'https://api.openai.com/v1/chat/completions',
      headers: headers,
      json: payload
    )

    response.json
  end

  private

  def openai_api_key
    @config.api_key
  end
end
