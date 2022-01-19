class Event < ApplicationRecord
has_and_belongs_to_many :categories, :join_table => :eventshavecats
def self.someevents
all.limit(10)
end
def self.myevents(page = nil)
mylimit=2
nopage=(page  ? (page - 1) : nil).to_i * mylimit
all.select("events.*, (select count(e.id) from events e) as nbtotal").group("events.id").offset(nopage).limit(mylimit).each_slice(3).to_a
end
def self.allmyevents(page = nil)
mylimit=2
nopage=(page  ? (page - 1) : nil).to_i * mylimit
all.select("events.*, (select count(e.id) from events e) as nbtotal").group("events.id").offset(nopage).limit(mylimit)
end

end