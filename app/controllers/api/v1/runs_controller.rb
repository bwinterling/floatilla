class Api::V1::RunsController < Api::V1::ApiController

  def index
    river = River.find(params[:river_id])
    render json: river.runs
  end

end
