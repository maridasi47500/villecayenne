class Category < ApplicationRecord
has_and_belongs_to_many :news, :join_table => :newshavecats
has_and_belongs_to_many :events, :join_table => :eventshavecats
has_and_belongs_to_many :videos, :join_table => :videoshavecats
def catallmyvideos(page)
p videos
videos.allmyvideos(page).select("(select count(distinct v.id) from videos v left join videoshavecats c on c.video_id = v.id group by c.category_id having c.category_id = '#{self.id}' ) as nbtotal")
end
end