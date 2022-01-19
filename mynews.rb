require "nokogiri"
require "open-uri"
@news=["http://www.ville-cayenne.fr/actualites/"]+(2..110).to_a.map{|h|"http://www.ville-cayenne.fr/actualites/page/#{h}/"}
@news.each do |link|
@doc=Nokogiri::HTML(URI.open(link))
@doc.css('a.more').each do |a|
mylink="http://www.ville-cayenne.fr"
@doc1=Nokogiri::HTML(URI.open(mylink+a.attributes['href'].value))
event=News.create do |t|
t.title=@doc1.css('h1.page-title').text.strip.squish
t.content=@doc1.css('article.post')[2].inner_html
t.image=@doc1.css('article.post')[2].css('img')[0].attributes['src'].value
end
event.categories << @doc1.css('article.post')[0].css('a').map{|x|Category.find_or_create_by(name: x.text.squish.strip, url: x.attributes['href'].value)}
end
rescue => e
next 
end