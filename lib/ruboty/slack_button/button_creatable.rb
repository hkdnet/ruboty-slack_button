module Ruboty::SlackButton
  module ButtonCreatable
    def create_button(*args)
      Ruboty::SlackButton::Creator.new(self, *args).create
    end
  end
end
