class Video < ApplicationRecord
has_and_belongs_to_many :categories, :join_table => :videoshavecats

def self.zoom
order(zoom: :desc).limit(1)[0]
end
def self.mylimit2
2
end
before_validation :myvideos
def myvideos
self.urltitle=self.title.parameterize
end
def self.allmyvideos(page = nil)
mylimit=self.mylimit2
nopage=(page  ? (page - 1) : nil).to_i * mylimit
all.select("videos.*, (select count(n.id) from videos n) as nbtotal").offset(nopage).limit(mylimit)

end
end