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

end
