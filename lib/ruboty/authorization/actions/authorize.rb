module Ruboty::Authorization::Action
  class Authorize < Ruboty::Actions::Base
    attr_reader :user_list

    def call
      @user_list = ::Ruboty::Authorization::UserList.new(message.robot.brain)
      message.reply(authorize)
    end

    private
    def authorize
      user_name = message.match_data[1]
      if user = @user_list.find_by_name(user_name)
        user.message(new: false)
      else
        @user_list.add({name: user_name}).message(new: true)
      end
    end
  end
end

