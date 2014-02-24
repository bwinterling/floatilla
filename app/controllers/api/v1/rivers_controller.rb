class Api::V1::RiversController < Api::V1::ApiController

  def index
    render json: River.all
  end

end

