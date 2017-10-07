class CreateAppointment < ActiveRecord::Migration[5.1]
  def change

    create_table :appointments do |t|
      t.string  :title
      t.string  :location
      t.string  :date
      t.integer :user_id
  end
end
end
