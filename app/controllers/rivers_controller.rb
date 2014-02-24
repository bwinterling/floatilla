class RiversController < ApplicationController

  def index
    @rivers = River.all
  end

  def show
    @river = River.find(params[:id])
  end

end
