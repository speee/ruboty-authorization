module Ruboty::Authorization
  class User
    ATTRIBUTES = %i(name)
    ATTRIBUTES.each { |attr| attr_accessor attr }

    def initialize(params)
      ATTRIBUTES.each do |attr|
        self.send("#{attr}=".to_sym, params[attr]) if params.key?(attr)
      end
    end

    def message(new: false)
      if new
        "#{@name}を追加しました"
      else
        "#{@name}は既に追加されています"
      end
    end
  end
end
