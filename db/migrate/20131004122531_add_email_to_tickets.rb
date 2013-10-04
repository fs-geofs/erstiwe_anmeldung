class AddEmailToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :email, :string
    add_index :tickets, :email, unique: true
  end
end
