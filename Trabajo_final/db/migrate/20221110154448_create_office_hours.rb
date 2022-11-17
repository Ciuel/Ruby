class CreateOfficeHours < ActiveRecord::Migration[7.0]
  def change
    create_table :office_hours do |t|
      t.string :day
      t.time :start
      t.time :end
      t.belongs_to :branch, null: false, foreign_key: true

      t.timestamps
    end
  end
end
