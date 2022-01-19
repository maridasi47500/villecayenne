require "nokogiri"
require "open-uri"
@agenda=["http://www.ville-cayenne.fr/agenda/"]+(2..5).to_a.map{|h|"http://www.ville-cayenne.fr/agenda/page/#{h}/"}
@agenda.each do |link|
@doc=Nokogiri::HTML(URI.open(link))
@doc.css('a.more').each do |a|
mylink="http://www.ville-cayenne.fr"
@doc1=Nokogiri::HTML(URI.open(mylink+a.attributes['href'].value))
event=Event.create do |t|
t.title=@doc1.css('h1.page-title').text.strip.squish
t.description=@doc1.css('article.post')[2].inner_html
t.bannerimage=@doc1.css('article.post')[1].css('img')[0].attributes['src'].value
t.image=@doc1.css('article.post')[2].css('img')[0].attributes['src'].value
#t.start_date
#t.end_date
end

begin
dates= @doc1.css('.roboto_b')[0]
t.update(start_date: dates.css('span')[0].text)
rescue => e
end
begin
t.update(end_date: dates.css('span')[1].text) 
rescue => e
end
event.categories << @doc1.css('article.post')[0].css('a').map{|x|Category.find_or_create_by(name: x.text.squish.strip, url: x.attributes['href'].value)}

end
rescue => e
next 
end
