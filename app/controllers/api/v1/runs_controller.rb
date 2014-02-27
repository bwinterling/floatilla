class Api::V1::RunsController < Api::V1::ApiController

  def index
    river = River.find(params[:river_id])
    @runs = river.runs
    render json: @runs
  end

  def show
    @run = Run.find(params[:id])
    render json: @run
  end

end
