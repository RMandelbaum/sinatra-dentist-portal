class CreateForm < ActiveRecord::Migration[5.1]
  def change

    create_table :forms do |t|
      t.string :name
      t.string :content
      t.integer :patient_id
    end
  end
end
