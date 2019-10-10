require 'rubygems'
require 'bundler'
Bundler.setup
require 'sinatra'
require 'json'
require 'rest-client'
require 'sinatra/reloader' if development?

get '/' do
  api_result = RestClient.get 'https://api.enphaseenergy.com/api/v2/systems/1306036/rgm_stats?key=bffbc4f8c406fb68b7a0eb2290a5cd03&user_id=4f546b324d44637a0a?datetime_format=iso8601'
  jhash = JSON.parse(api_result)
  output = ''

	jhash['meta'].each do |w|
  	title_tag = w[0]
  	info_item = w[1]
  	output << "<tr><td>#{status}</td><td></td></tr>"
	end

  erb :index, :locals => {results: output}
end