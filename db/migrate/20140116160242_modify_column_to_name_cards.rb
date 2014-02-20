class ModifyColumnToNameCards < ActiveRecord::Migration
  def change
    rename_column :name_cards, :adress, :address
  end
end
