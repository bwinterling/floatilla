class Api::V1::RiversController < Api::V1::ApiController

  def index
    rivers = River.order(:name)
    rivers = rivers.offset(params[:offset]) if params[:offset]
    rivers = rivers.limit(params[:limit]) if params[:limit]
    render json: rivers
  end

  def show
    render json: River.find(params[:id])
  end

end

