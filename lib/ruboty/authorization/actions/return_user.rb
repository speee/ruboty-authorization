module Ruboty::Authorization::Action
  class ReturnUser < Ruboty::Actions::Base
    attr_reader :user_list

    def call
      @user_list = ::Ruboty::Authorization::UserList.new(message.robot.brain)
      names = @user_list.users.map(&:name).join("\n")
      message.reply(names)
    end
  end
end
