class CreateBars < ActiveRecord::Migration
  def change
    create_table :bars do |t|
      t.string :title
      t.text :body
      t.string :authors
      t.string :entry_url
      t.text :description
      t.timestamp :published_at

      t.timestamps
    end
  end
end
