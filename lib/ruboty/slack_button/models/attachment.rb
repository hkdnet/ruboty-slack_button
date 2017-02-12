module Ruboty::SlackButton::Models
  class Attachment
    attr_reader :text, :fallback, :callback_id, :color, :attachment_type, :actions

    def initialize(text: nil, fallback: nil, callback_id: nil, color: nil, attachment_type: nil, actions: nil)
      @text = text
      @fallback = fallback
      @callback_id = callback_id
      @color = color
      @attachment_type = attachment_type
      @actions = actions
    end

    def as_json
      {
        text: text,
        fallback: fallback,
        callback_id: callback_id,
        color: color,
        attachment_type: attachment_type,
        actions: actions
      }
    end

    def to_json(*args)
      as_json.to_json(*args)
    end
  end
end

__END__
{
    "text": "Would you like to play a game?",
    "attachments": [
        {
            "text": "Choose a game to play",
            "fallback": "You are unable to choose a game",
            "callback_id": "wopr_game",
            "color": "#3AA3E3",
            "attachment_type": "default",
            "actions": [
                {
                    "name": "game",
                    "text": "Chess",
                    "type": "button",
                    "value": "chess"
                },
                {
                    "name": "game",
                    "text": "Falken's Maze",
                    "type": "button",
                    "value": "maze"
                },
                {
                    "name": "game",
                    "text": "Thermonuclear War",
                    "style": "danger",
                    "type": "button",
                    "value": "war",
                    "confirm": {
                        "title": "Are you sure?",
                        "text": "Wouldn't you prefer a good game of chess?",
                        "ok_text": "Yes",
                        "dismiss_text": "No"
                    }
                }
            ]
        }
    ]
}
