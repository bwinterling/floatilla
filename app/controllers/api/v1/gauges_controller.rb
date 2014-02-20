class Api::V1::GaugesController < Api::V1::ApiController

  def index
    gauges = Gauge.all.map(&:to_geojson)
    render json: gauges
  end

end
