class CreateNameCards < ActiveRecord::Migration
  def change
    create_table :name_cards do |t|
      t.references :user, index: true
      t.string :name
      t.string :adress
      t.string :fax
      t.string :tel
      t.string :url

      t.timestamps
    end
  end
end
