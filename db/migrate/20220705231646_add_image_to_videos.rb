class AddImageToVideos < ActiveRecord::Migration[6.0]
  def change
    add_column :videos, :image, :string
    add_column :videos, :urltitle, :string
  end
end
