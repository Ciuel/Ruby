class CreateBranches < ActiveRecord::Migration[7.0]
  def change
    create_table :branches do |t|
      t.string :name
      t.string :address
      t.integer :telephone

      t.timestamps
    end
  end
end
