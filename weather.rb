#require "nokogiri"
#require "open-uri"
#`mkdir -p "public/plugins/wp-forecast/icons/"`
#("01").upto("300").to_a.each do |h|
#myurl="http://www.ville-cayenne.fr/plugins/wp-forecast/icons/#{h}.png"
#myurl="https://d2erwcr27wae6d.cloudfront.net/resources/v1/resource/IconByCodeV1?iconset=forecast&iconSize=svglarge&iconCode=#{h}&token=c56f2501-1847-439f-8fc7-8e4581944d39"
#`(cd "public/plugins/wp-forecast/icons/" && wget "#{myurl}" -O "#{h}.png") `
#rescue
#next
#
#end
require "nokogiri"
require "open-uri"
`mkdir -p "public/plugins/wp-forecast/icons/"`
("01").upto("50").to_a.each do |h|
myurl="http://www.ville-cayenne.fr/plugins/wp-forecast/icons/#{h}.png"
`(cd "public/plugins/wp-forecast/icons/" && wget "#{myurl}") `
rescue
next

end
