module Ruboty::Authorization
  class UserList
    extend Forwardable
    attr_reader :brain
    def_delegators :users, :count, :size, :[]

    def initialize(brain)
      @brain = brain
    end

    def users
      list[:users]
    end

    def add(params)
      user = User.new(params)
      users.push(user)
      user
    end

    private

    def list
      brain.data['user_list'] ||= { users: [] }
    end
  end
end
