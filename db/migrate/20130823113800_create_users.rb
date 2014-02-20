class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.references :group, index: true
      t.string :name
      t.string :mail
      t.string :tel

      t.timestamps
    end
  end
end
