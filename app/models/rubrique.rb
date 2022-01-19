require "nokogiri"
require "open-uri"
class Rubrique < ApplicationRecord
def self.zoom
order(zoom: :desc).limit(1)[0]
end
before_validation :savemycontent, on: [:create]

def savemycontent
myurl="http://www.ville-cayenne.fr"
doc=Nokogiri::HTML(URI.open(myurl+"/"+self.urltitle))
self.description=doc.css('article.post').map{|h|h.try(:inner_html).to_s}.join('<br>')
rescue => e
p e.message
end
end