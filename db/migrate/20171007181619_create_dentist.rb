class CreateDentist < ActiveRecord::Migration[5.1]
  def change

    create_table :dentists do |t|
      t.string :name
    end
    
  end
end
