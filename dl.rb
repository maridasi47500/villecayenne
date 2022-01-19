require "nokogiri"
require "open-uri"


@myurl="http://www.ville-cayenne.fr"
@doc=Nokogiri::HTML(URI.open(@myurl))
#telecharge rubriques
#p "telecharge rubriques"
#@doc.css('.sub-nav a').each do |t|
#Rubrique.create do |a|
#a.title=t.text
#a.url=t.attributes['href'].value.gsub(@myurl,'').gsub("/",'')
#end
#end
#dl events
#p "dl events"
#@doc.css('.featured-news .item').each do |t|
#event=Event.create do |a|
#a.title=t.css('a').text
#a.urltitle=t.css('a')[0].attributes['href'].value.split('/').last
#a.image=t.css('img')[0].attributes['src'].value
#a.start_date=t.css('img')[0].attributes['src'].value
#a.end_date=t.css('img')[0].attributes['src'].value
#end
#event.categories << Category.find_or_create_by(@doc.css('.meta .roboto_b').map{|x|{name: x.text, url: x.css('a').attributes['href'].value.gsub(@myurl,'').gsub("/","")}})
#end

#dl news 
p "news"
@doc.css('.featured-item').each do |t|
event=News.create do |a|
a.title=t.css('a')[0].attributes['title'].value
a.urltitle=t.css('a')[0].attributes['href'].value
a.smallimage=t.css('img')[0].attributes['src'].value
a.affiche=true
end
end

#dl notes
p "notes"
@doc.css('#test-slider').css('a').each do |h|
note=Note.create do |t|
t.filename=h.attributes['href'].value
t.title=h.css('span').text.strip.squish
end
end

