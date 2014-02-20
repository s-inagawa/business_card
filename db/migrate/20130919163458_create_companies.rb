class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :adress
      t.string :fax
      t.string :tel
      t.string :url

      t.timestamps
    end
  end
end
