class Api::V1::GaugesController < Api::V1::ApiController

  def index
    if params[:run_id]
      run_ids = params[:run_id].split(",")
      gauges = Gauge.where(:run_id => run_ids)
    else
      gauges = Gauge.all
    end
    render json: gauges.map(&:to_geojson)
  end

end
