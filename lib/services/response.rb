# Response wrapper for OpenAI API responses

class ChatResponse
  attr_reader :id, :object, :created, :model, :choices, :usage

  def initialize(data)
    @id = data['id']
    @object = data['object']
    @created = data['created']
    @model = data['model']
    @choices = data['choices'].map { |c| Choice.new(c) }
    @usage = Usage.new(data['usage'])
  end

  def first_choice_text
    @choices.first&.message&.content
  end
end

class Choice
  attr_reader :index, :message, :finish_reason

  def initialize(data)
    @index = data['index']
    @message = Message.new(role: data['message']['role'], content: data['message']['content'])
    @finish_reason = data['finish_reason']
  end
end

class Usage
  attr_reader :prompt_tokens, :completion_tokens, :total_tokens

  def initialize(data)
    @prompt_tokens = data['prompt_tokens']
    @completion_tokens = data['completion_tokens']
    @total_tokens = data['total_tokens']
  end
end
