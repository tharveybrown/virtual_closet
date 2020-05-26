class AddClosetIdToOutfits < ActiveRecord::Migration[6.0]
  def change
    add_column :outfits, :closet_id, :belongs_to
  end
end
