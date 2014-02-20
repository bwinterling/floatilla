class RiversController < ApplicationController

  def index
    @rivers = River.all
  end

end
