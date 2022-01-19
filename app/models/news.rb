require 'uri'
class News < ApplicationRecord
has_and_belongs_to_many :categories, :join_table => :newshavecats
before_validation :savemynews
def self.fivelastnews
order(:created_at => :desc).limit(5)
end
def title1
title.split(' ')[0..1].join(' ')
end
def title2
title.split(' ')[2..].join(' ')
end
def self.searchallmynews(page = nil,s)
mystr="%"+s.downcase.gsub(' ','%')+"%"
listmynews(page).select("news.*, (select count(n.id) from news n where lower(n.title) like '#{mystr}' or lower(n.content) like '#{mystr}') as nbtotal").where("lower(title) like ? or lower(content) like ?",mystr,mystr)
end
def self.nbsearchallmynews(page = nil,s)
News.searchallmynews(page,s).length
end
def savemynews
self.urltitle=self.title.parameterize
end
def self.allmynews(page = nil)
mylimit=10
nopage=(page  ? (page - 1) : nil).to_i * mylimit
all.select("news.*, (select count(n.id) from news n) as nbtotal").offset(nopage).limit(mylimit).each_slice(3).to_a

end
def self.listmynews(page = nil)
mylimit=10
nopage=(page  ? (page - 1) : nil).to_i * mylimit
all.select("news.*, (select count(n.id) from news n) as nbtotal").group("news.id").offset(nopage).limit(mylimit)

end
def self.mynews
all.each_slice(2).to_a
end
def self.somenews
all.limit(6)
end
def self.alaffiche
mots=["affiche","MAQUETTE"]
all.where(affiche:true).limit(12)
#where([Array.new(mots.length,"image like ?").join(' or ')]+mots.map{|x|"%#{x}%"}).limit(12)
end
#before_validation :savefiles
def savefiles
URI.extract(content, ['http', 'https']).select{|h|h.include?("cayenne.fr/files/")}.each do |url|
#save file
end
end

end
