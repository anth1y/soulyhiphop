class CreateHiphopSites < ActiveRecord::Migration
  def change
    create_table :hiphop_sites do |t|
      t.string :url
      t.string :image_url
      t.string :description

      t.timestamps
    end
  end
end
