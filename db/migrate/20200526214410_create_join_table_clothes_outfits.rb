class CreateJoinTableClothesOutfits < ActiveRecord::Migration[6.0]
  def change
    create_join_table :clothes, :outfits do |t|
      t.index [:clothe_id, :outfit_id]
      t.index [:outfit_id, :clothe_id]
    end
  end
end
