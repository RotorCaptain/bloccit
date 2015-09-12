class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :rating_id
      t.integer :topic_id
      t.references :rating, index: true
      t.references :topic, index: true
      t.references :post, index: true

      t.references :rateable, polymorphic: true, index: true
 
      t.timestamps null: false
    end
     
    add_foreign_key :ratings, :rating
    add_foreign_key :ratings, :topics
    add_foreign_key :ratings, :posts
  end
end