require 'csv'
require './app/models/river'

class Data::Seeder

  def self.load_river_data
    River.delete_all
    source = "./lib/data/rivers.csv"
    river_data = CSV.read(source, headers: true, header_converters: :symbol)
    river_data.each do |row|
      River.create({
        name: row[:river],
        state: row[:state]
      })
    end
  end

  def self.load_run_data
    Run.delete_all
    source = "./lib/data/runs.csv"
    run_data = CSV.read(source, headers: true, header_converters: :symbol)
    run_data.each do |row|
      section = row[:run].scan(/^\d{2}./).join.gsub(".", "").to_i
      run = row[:run].gsub(/^\d{2}. /, "")
      river = River.find_by(:name => row[:river])
      river.runs.create(name: run, section: section)
    end
  end

  def self.load_beta
    source = "./lib/data/beta.csv"
    beta_data = CSV.read(source, headers: true, header_converters: :symbol)
    beta_data.each do |row|
      if row[:range] == "unknown"
        min_flow = ""
        max_flow = ""
      else
        min_flow = row[:range].match(/^[0-9]*/)[0].to_i
        max_flow = row[:range].match(/[0-9]* cfs$/)[0].gsub(" cfs","").to_i
      end
      if row[:length]
        length = row[:length].match(/^[0-9]+[.]?[0-9]*/)[0].to_f
      else
        length = nil
      end
      if row[:gradient]
        gradient = row[:gradient].match(/^[0-9]+/)[0].to_i
      else
        gradient = nil
      end


      run_name = row[:run].gsub(/^\d{2}. /, "")
      run = Run.find_by(:name => run_name)
      run.update(
          :difficulty => row[:difficulty],
          :min_flow => min_flow,
          :max_flow => max_flow,
          :length => length,
          :gradient => gradient
        )
    end
  end

  def self.create_gauge_csv
    gauge_data = Usgs::Request.measurements_by("CO")
    CSV.open("./lib/data/gauges_co.csv", "wb") do |csv|
      csv << ["gauge_id","state","name","provider","lat","long","run_id"]

      gauge_data.each do |gauge|
        # need to complete this!
        run_id = "not finished"
        row = [
          gauge.gauge_id,
          gauge.state,
          gauge.site_name,
          gauge.provider,
          gauge.geo_location["latitude"],
          gauge.geo_location["longitude"],
          run_id
        ]
        csv << row
      end
    end
  end

end
