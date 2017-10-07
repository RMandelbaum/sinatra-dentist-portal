class CreatePatient < ActiveRecord::Migration[5.1]
  def change

    create_table :patients do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.integer :dentist_id
    end
  end
end
