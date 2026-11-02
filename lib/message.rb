# Message model for OpenAI chat API

class Message
  ROLES = ['system', 'user', 'assistant'].freeze

  attr_reader :role, :content

  def initialize(role:, content:)
    @role = validate_role(role)
    @content = content
  end

  def to_h
    { role: @role, content: @content }
  end

  def self.system(content)
    new(role: 'system', content: content)
  end

  def self.user(content)
    new(role: 'user', content: content)
  end

  def self.assistant(content)
    new(role: 'assistant', content: content)
  end

  private

  def validate_role(role)
    raise ArgumentError, "Invalid role: #{role}" unless ROLES.include?(role)
    role
  end
end
