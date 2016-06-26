require "ruboty/authorization/actions/authorize"

module Ruboty
  module Handlers
    # Ruboty Authorization
    class RubotyAuthorization < Base
      on /authorize +(.*)/m/, name: 'authorize', description: '特定のユーザーのみ実行できるようにする'
      env :ADMIN_USER, "ADMIN_USER_NAME"

      def authorize(message)
        Ruboty::RubotyAuthorization::Actions::Authorize.new(message).call
      end

    end
  end
end
