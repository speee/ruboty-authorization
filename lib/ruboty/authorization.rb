require 'ruboty/authorization/user'
require 'ruboty/authorization/user_list'
require "ruboty/authorization/version"
require "ruboty/handlers/authorization"


module Ruboty
  class Action
    class AuthenticationError < StandardError; end

    def call(handler, message, options = {})
      if !!options[:missing] == missing? && message.match(pattern_with(handler.robot.name))
        authorized!(message)
        !!handler.send(name, message)
      else
        false
      end
    end

    def authorized!(message)
      @user_list = ::Ruboty::Authorization::UserList.new(message.robot.brain)

      return if [ self.name , owner_name ].include? message.from_name
      return if @user_list.find_by_name(message.from_name)

      raise AuthenticationError.new("#{message.from_name} は許可されていないユーザーです")
    end

    def owner_name
      ENV["OWNER_NAME"]
    end
  end
end
