class Api::V1::RiversController < Api::V1::ApiController

  def index
    render json: River.all
  end

  def show
    render json: River.find(params[:id])
  end

end

