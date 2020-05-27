class CreateOutfits < ActiveRecord::Migration[6.0]
  def change
    create_table :outfits do |t|
      t.datetime :date_last_worn
      t.belongs_to :closet, null: false, foreign_key: true

      t.timestamps
    end
  end
end
