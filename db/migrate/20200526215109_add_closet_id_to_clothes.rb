class AddClosetIdToClothes < ActiveRecord::Migration[6.0]
  def change
    add_column :clothes, :closet_id, :belongs_to
  end
end
