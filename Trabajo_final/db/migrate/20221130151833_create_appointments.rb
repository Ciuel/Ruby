class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.references :branch, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :staff, null: true, foreign_key: { to_table: :users }
      t.datetime :date
      t.string :reason
      t.integer :status, default: 0, null: false
      t.text :comment

      t.timestamps
    end
  end
end
