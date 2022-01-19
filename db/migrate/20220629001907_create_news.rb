class CreateNews < ActiveRecord::Migration[6.0]
  def change
    create_table :news do |t|
      t.string :title
      t.string :urltitle
      t.string :subtitle
      t.string :image
      t.string :smallimage
      t.text :content
      t.timestamps
    end
    create_table :wforecasts do |t|
      t.date :date
      t.string :icon
      t.string :city
      t.integer :temperature
      t.timestamps
      
    end
    create_table :notes do |t|
      t.string :filename
      t.string :title
      t.timestamps
    end
    create_table :categories do |t|
      t.string :name
      t.string :catno
      t.string :url
      t.timestamps
    end
    create_table :rubriques do |t|
        t.string :title
        t.string :image
        t.string :url
        t.text :description
        t.datetime :zoom
        t.timestamps
    end
	create_table :newshavecats do |t|
	t.integer :news_id
	t.integer :category_id
	end
	create_table :eventshavecats do |t|
	t.integer :event_id
	t.integer :category_id
	end
    create_table :events do |t|
      t.date :start_date
      t.date :end_date
      t.string :urltitle
      t.string :place
      t.string :title
      t.string :bannerimage
      t.string :image
      t.text :description
      t.timestamps
    end
    create_table :videos do |t|
        t.string :title
        t.string :url
        t.datetime :zoom
        t.timestamps
    end
    create_table :videoshavecats do |t|
        t.integer :video_id
        t.integer :category_id
    end
  end
end
