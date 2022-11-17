class CreateBranches < ActiveRecord::Migration[7.0]
  def change
    create_table :branches do |t|
      t.string :name
      t.string :address
      t.integer :tel

      t.timestamps
    end
    add_index :branches, :name, unique: true
  end
end
