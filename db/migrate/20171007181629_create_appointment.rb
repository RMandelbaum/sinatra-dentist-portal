class CreateAppointment < ActiveRecord::Migration[5.1]
  def change

    create_table :appointments do |t|
      t.string  :name
      t.string  :month
      t.integer :date
      t.integer :year
      t.integer :user_id
    end
  end
end
