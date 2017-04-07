class MountainsController < ApplicationController

  def index
    @mountains = Mountain.all
  end

  def show
    puts params
    @mountain = Mountain.find(params[:id])
  end

end
