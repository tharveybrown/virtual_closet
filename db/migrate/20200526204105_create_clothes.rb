class CreateClothes < ActiveRecord::Migration[6.0]
  def change
    create_table :clothes do |t|
      t.string :clothing_type
      t.string :size
      t.string :season
      t.string :color 
      t.string :pattern
      t.string :style
      t.belongs_to :closet, null: false, foreign_key: true
    end
  end
end
