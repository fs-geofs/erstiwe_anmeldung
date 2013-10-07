class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.belongs_to :user
      t.string :token
      t.string :email

      t.timestamps
    end

    add_index :tickets, :token, unique: true
    add_index :tickets, :email, unique: true
  end
end
