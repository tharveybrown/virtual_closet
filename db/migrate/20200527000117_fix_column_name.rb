class FixColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :clothes, :type, :clothing_type

  end
end
