class Api::V1::GaugesController < Api::V1::ApiController

  def index
    if params[:run_id]
      run_ids = params[:run_id].split(",")
      gauges = Gauge.where(:run_id => run_ids).map(&:to_geojson)
    else
      gauges = Gauge.all.map(&:to_geojson)
    end
    render json: gauges
  end

end
