module Ruboty::Authorization
  class User
    ATTRIBUTES = %i(name)
    ATTRIBUTES.each { |attr| attr_accessor attr }

    def initialize(params)
      ATTRIBUTES.each do |attr|
        self.send("#{attr}=".to_sym, params[attr]) if params.key?(attr)
      end
    end
  end
end
