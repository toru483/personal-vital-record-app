class CreateVitalRecords < ActiveRecord::Migration[8.1]
  def change
    create_table :vital_records do |t|
      t.datetime :recorded_at
      t.decimal :weight
      t.integer :blood_sugar
      t.integer :systolic_pressure
      t.integer :diastolic_pressure
      t.text :memo

      t.timestamps
    end
  end
end
