module Ruboty::Authorization::Actions
  class Authorize < Ruboty::Actions::Base
    attr_reader :user_list

    def call
      @user_list = ::Ruboty::Authorization::UserList.new(message.robot.brain)
      message.reply(authorize)
    end

    private
    def authorize
      user_name = message.match_data[1]
      @user_list.add({name: user_name}).add_message
    end
  end
end
