module Ruboty::SlackButton
  class Action
    attr_accessor :name, :text, :type, :value

    def initialize(name: nil, text: nil, type: nil, value: nil)
      @name = name
      @text = text
      @type = type
      @value = value
    end

    def as_json
      {
        name: name,
        text: text,
        type: type,
        value: value
      }
    end

    def to_json(*args)
      as_json.to_json(*args)
    end
  end
end
