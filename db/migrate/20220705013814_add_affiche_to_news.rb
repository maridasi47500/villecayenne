class AddAfficheToNews < ActiveRecord::Migration[6.0]
  def change
    add_column :news, :affiche, :boolean
  end
end
