class CreateLabels < ActiveRecord::Migration
  def change
    create_table :labels do |t|
      t.string :name
      t.references :labelable, polymorphic: true, index: true
 
      t.timestamps null: false
    end
  end
end