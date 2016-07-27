require "ruboty/authorization/actions/authorize"
require "ruboty/authorization/actions/return_user"

module Ruboty
  module Handlers
    class Authorization < Base
      on(/authorize\s+(.*)/m, name: 'authorize', description: 'authorize specific user')
      on(/users\z/, name: 'return_users', description: 'return authorized users name')

      def authorize(message)
        Ruboty::Authorization::Action::Authorize.new(message).call
      end

      def return_users(message)
        Ruboty::Authorization::Action::ReturnUser.new(message).call
      end
    end
  end
end
