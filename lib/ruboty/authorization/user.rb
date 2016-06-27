module Ruboty::Authorization
  class User
    attr_accessor :name

    def initialize(params)
      @name = params[:name].gsub('@','') if params[:name]
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

