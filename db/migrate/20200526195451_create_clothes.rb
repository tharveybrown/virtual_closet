class CreateClothes < ActiveRecord::Migration[6.0]
  def change
    create_table :clothes do |t|
      t.string :type
      t.string :size
      t.string :season
      t.string :color 
      t.string :pattern
      t.string :style
    end
  end
end
