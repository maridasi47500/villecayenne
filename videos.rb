require "nokogiri"
require "open-uri"
@videos=["http://www.ville-cayenne.fr/videos/"]+(2..11).to_a.map{|h|"http://www.ville-cayenne.fr/videos/page/#{h}/"}
@videos.each do |link|
@doc=Nokogiri::HTML(URI.open(link))
@doc.css('article.post-c').each do |a|
event=Video.new do |t|
t.image=a.css('img')[0].attributes['src'].value
end
thisurl=a.css('a.more')[0].attributes['href'].value
event.url=thisurl

mylink="http://www.ville-cayenne.fr"
@doc1=Nokogiri::HTML(URI.open(mylink+thisurl))
event.title=@doc1.css('h1.page-title').text.strip.squish

event.ytlink=@doc1.css('iframe')[0].attributes['src'].value

event.save
event.categories << @doc1.css('article.post')[0].css('a').map{|x|Category.find_or_create_by(name: x.text.squish.strip, url: x.attributes['href'].value)}
rescue => e
p e.message
end
rescue => e
next 
end
