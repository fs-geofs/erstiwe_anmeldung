class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :token

      t.timestamps
    end

    add_index :tickets, :token, unique: true
  end
end
