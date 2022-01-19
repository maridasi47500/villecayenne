class AddYtlinkToVideos < ActiveRecord::Migration[6.0]
  def change
    add_column :videos, :ytlink, :string
  end
end
