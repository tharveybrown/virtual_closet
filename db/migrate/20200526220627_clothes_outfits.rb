class ClothesOutfits < ActiveRecord::Migration[6.0]
  def change
    create_join_table :outfits, :clothes
  end
end
