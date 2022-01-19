require "nokogiri"
require "open-uri"
require "openssl"
class Wforecast < ApplicationRecord
def self.weathertoday
if Wforecast.where(date: Date.today).length > 0
Wforecast.last
else
#doc=Nokogiri::HTML(URI.open("https://www.accuweather.com/en/gf/cayenne/168384/weather-forecast/168384", ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE, 'User-Agent' => 'opera'))
#doc=Nokogiri::HTML(URI.open("https://www.weatherbug.com/weather-forecast/now/cayenne-cayenne-fg"))
w=Wforecast.create do |t|
t.icon=(1..45).to_a.sample
t.temperature=(23..32).to_a.sample
#doc.css('.header-weather-icon').attributes['src'].value.split("icons/")[1].split('.')[0]
#t.temperature=doc.css(".header-temp").text.gsub('°','').gsub('"','').to_i
#t.icon=doc.css('.weather .icon').attributes['src'].value.split("icons/")[1].split('.')[0]
#t.temperature=doc.css("[class*='obsTemperature__ObsTemperature']").text.gsub('°','').gsub('"','').to_i
t.date=Date.today
t.city="Cayenne"
end

w
end
end
end