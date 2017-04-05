class WelcomeController < ApplicationController

  def index
    @mountains = Mountain.all
  end

end
