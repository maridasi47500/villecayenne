require 'net/https'
require 'nokogiri'

url = "https://www.accuweather.com/en/gf/cayenne/168384/weather-forecast/168384"
url = URI.parse( url )
http = Net::HTTP.new( url.host, url.port )
http.use_ssl = true if url.port == 443
http.verify_mode = OpenSSL::SSL::VERIFY_NONE if url.port == 443
path = url.path
path += "?" + url.query unless url.query.nil?
res, data = http.get( path )
p data

case res
  when Net::HTTPSuccess, Net::HTTPRedirection
    # parse link
    doc = Nokogiri::HTML(data)
     # do what you want ...
  else
    return "failed" + res.to_s
end
