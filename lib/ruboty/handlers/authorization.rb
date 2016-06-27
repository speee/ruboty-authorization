require "ruboty/authorization/actions/authorize"

module Ruboty
  module Handlers
    class Authorization < Base
      on(/authorize +(.*)/m, name: 'authorize', description: '特定のユーザーのみ実行できるようにする')

      def authorize(message)
        Ruboty::Authorization::Authorize.new(message).call
      end
    end
  end
end
