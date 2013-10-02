class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.string :fname
      t.string :lname
      t.string :email
      t.integer :gender
      t.string :street
      t.string :streetno
      t.integer :zip
      t.string :place
      t.date :birthday
      t.integer :study
      t.boolean :vegetarian
      t.boolean :vegan
      t.string :ticket
      t.string :phone
      t.text :comment

      t.timestamps
    end
    add_index :registrations, :email, unique: true
  end
end
