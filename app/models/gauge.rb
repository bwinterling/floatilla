class Gauge < ActiveRecord::Base
  has_many :measurements
  belongs_to :run

  validates :name, presence: true
  validates :lat, presence: true, numericality: { less_than_or_equal_to: 180, greater_than_or_equal_to: -180}
  validates :long, presence: true, numericality: { less_than_or_equal_to: 180, greater_than_or_equal_to: -180}

  def to_geojson
    {
       type: "Feature",
       geometry: {
         type: "Point",
         coordinates: [long, lat]
       },
       properties: {
         title: name,
         description: "",
         :"marker-color" => "#fc4353",
         :"marker-size" => "large",
         :"marker-symbol" => "monument"
       }
     }
  end

end
