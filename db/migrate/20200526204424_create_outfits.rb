class CreateOutfits < ActiveRecord::Migration[6.0]
  def change
    create_table :outfits do |t|
      t.datetime :date_last_worn

      t.timestamps
    end
  end
end
