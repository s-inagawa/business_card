class ModifyColumnToCompany < ActiveRecord::Migration
  def change
    rename_column :companies, :adress, :address
  end
end
