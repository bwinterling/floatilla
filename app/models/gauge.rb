class Gauge < ActiveRecord::Base
  has_many :measurements
  belongs_to :run

  validates :name, presence: true
  validates :lat, presence: true, numericality: { less_than_or_equal_to: 180, greater_than_or_equal_to: -180}
  validates :long, presence: true, numericality: { less_than_or_equal_to: 180, greater_than_or_equal_to: -180}

  def to_geojson
    generate_geojson_desc_and_marker
    {
       type: "Feature",
       geometry: {
         type: "Point",
         coordinates: [long, lat]
       },
       properties: {
         title: name,
         description: @description,
         :"marker-color" => @marker_color,
         :"marker-size" => "large",
         :"marker-symbol" => @marker_symbol
       }
     }
  end

  def generate_geojson_desc_and_marker
    if measurements.empty?
      @description = "No recent data"
      @marker_color = "#FA9441"
      @marker_symbol = "cross"
    else
      most_recent = measurements.max_by { |m| m.datetime }
      @description = "#{most_recent.value} cfs (#{most_recent.datetime.strftime('%F')})"
      current_run = run
      current_flow = most_recent.value.to_i
      if current_run.min_flow == nil || current_run.max_flow == nil || current_flow == -999999
        @description = "Incomplete flow data"
        @marker_color = "#BFBCBA"
        @marker_symbol = "roadblock"
      elsif current_flow < current_run.min_flow
        @marker_color = "#B8D7E0"
        @marker_symbol = "dam"
      elsif current_flow > current_run.max_flow
        @marker_color = "#000000"
        @marker_symbol = "danger"
      else
        @marker_color = "#33F53A"
        @marker_symbol = "water"
      end
    end
  end

end
