class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :name
      t.text :summary
      t.text :content
      t.string :url
      t.string :guid
      t.datetime :published_at

      t.timestamps
    end
  end
end
