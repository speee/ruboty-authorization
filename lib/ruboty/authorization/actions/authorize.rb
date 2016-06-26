module Ruboty
  module RubotyAuthorization
    module Actions
      class Authorize < Ruboty::Actions::Base
        def call
          message.reply(authorize)
        rescue => e
          message.reply(e.message)
        end

        private
        def authorize
          # TODO: main logic
        end
      end
    end
  end
end
