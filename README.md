An app for paddlers and river users to track their favorite rivers and their
best adventures.

## Specs
Run the specs with `rspec`

## API

### api/v1/gauges returns:
????  should we add a tag "?format=geojson" to return geojson, and leave blank to return standard json information? ????
"""
[{"type":"Feature",
	"geometry":{
		"type":"Point",
		"coordinates":["-107.3167","39.55"]
		},
	"properties":{
		"title":"BLUE RIVER BELOW GREEN MOUNTAIN RESEVOIR",
		"description":"273 cfs (2014-02-21)",
		"marker-color":"#fc4353",
		"marker-size":"large",
		"marker-symbol":"monument"
		}
	},
	{additional geojson objects...}]
"""
### api/v1/gauges/:gauge_id returns:

{
	"gauge_id":"45",
	"source_id":"09057500",
	"source":"usgs"
	"name":"BLUE RIVER BELOW GREEN MOUNTAIN RESEVOIR",
	"lat":"-107.3167",
	"long":"39.55",
	"measurements":[{
    "date_time":"2014-02-20T00:00:00.000-05:00",
    "unit" => "ft3/s",
    "value" => "379"
  },{additional measurements...}]
}

### api/v1/rivers returns:
???? thinking of adding "?state=CO" to limit the return values ????

[{"river_id":"45",
	"name":"Animas",
	"state":"CO"
	},
	{additional rivers...}]

### api/v1/rivers/:river_id returns:

{
	"river_id":"45",
	"name":"Animas",
	"state":"CO",
	"runs":[{
		"run_id":"1",
		"name":"Upper Animas",
		"section":"1",
		"difficulty":"III(for normal flows)",
		"length":"3.6",
		"gradient":"90"
		"min":"150",
		"max":"2000",
		"gauges":[
		{	"gauge_id":"45",
			"source_id":"09057500",
			"source":"usgs"
			"name":"BLUE RIVER BELOW GREEN MOUNTAIN RESEVOIR",
			"lat":"-107.3167",
			"long":"39.55",
			"measurements":[{
		    "date_time":"2014-02-20T00:00:00.000-05:00",
		    "unit" => "ft3/s",
		    "value" => "379"
		  },{additional measurements...}]
		},{additional gauges...}]
	},
	{additional runs...}]
}

### api/v1/runs returns:
???? thinking of adding/requiring "?state=CO" to limit the return/limit values ????

[
	{	"river_id":"45",
		"name":"Animas",
		"state":"CO",
		"runs":[{
			"run_id":"1",
			"name":"Upper Animas",
			"section":"1",
			"difficulty":"III(for normal flows)",
			"length":"3.6",
			"gradient":"90"
			"min":"150",
			"max":"2000",
			"gauges":[
			{	"gauge_id":"45",
				"source_id":"09057500",
				"source":"usgs"
				"name":"BLUE RIVER BELOW GREEN MOUNTAIN RESEVOIR",
				"lat":"-107.3167",
				"long":"39.55",
				"measurements":[{
			    "date_time":"2014-02-20T00:00:00.000-05:00",
			    "unit" => "ft3/s",
			    "value" => "379"
			  },{additional measurements...}]
			},{additional gauges...}]
		},{additional runs...}]
	},{additional rivers...}
]

### api/v1/runs/:run_id returns:

{
	"run_id":"1",
	"name":"Upper Animas",
	"section":"1",
	"difficulty":"III(for normal flows)",
	"length":"3.6",
	"gradient":"90"
	"min":"150",
	"max":"2000",
	"gauges":[
	{	"gauge_id":"45",
		"source_id":"09057500",
		"source":"usgs"
		"name":"BLUE RIVER BELOW GREEN MOUNTAIN RESEVOIR",
		"lat":"-107.3167",
		"long":"39.55",
		"measurements":[{
	    "date_time":"2014-02-20T00:00:00.000-05:00",
	    "unit" => "ft3/s",
	    "value" => "379"
	  },{additional measurements...}]
	},{additional gauges...}]
}
