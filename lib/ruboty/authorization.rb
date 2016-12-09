require 'ruboty/authorization/user'
require 'ruboty/authorization/user_list'
require "ruboty/authorization/version"
require "ruboty/handlers/authorization"


module Ruboty
  class Action
    class AuthenticationError < StandardError; end

    def call(handler, message, options = {})
      return false unless !!options[:missing] == missing?
      return false unless message.match(pattern_with(handler.robot.name))

      authorized!(message)
      !!handler.send(name, message)
    rescue => e
      message.reply(e.message) if reply_error?
    end

    def authorized!(message)
      @user_list = ::Ruboty::Authorization::UserList.new(message.robot.brain)

      return if [ self.name , owner_name ].include? message.from_name
      return if @user_list.find_by_name(message.from_name)

      raise AuthenticationError.new("#{message.from_name} is not authorized user")
    end

    def owner_name
      ENV["OWNER_NAME"]
    end

    def reply_error?
      ENV['NOT_REPLY_AUTHORIZATION_ERROR'].nil?
    end
  end
end
