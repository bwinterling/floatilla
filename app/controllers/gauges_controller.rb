class GaugesController < ApplicationController

  def index
    @gauges = Gauge.all
  end

end
