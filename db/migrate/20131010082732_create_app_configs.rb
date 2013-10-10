class CreateAppConfigs < ActiveRecord::Migration
  def change
    create_table :app_configs do |t|
      t.datetime :beginning, :null => false, :default => 0
      t.datetime :ending, :null => false, :default => 1
      t.string :mail_adress, :null => false, :default => ""
      t.string :mail_server, :null => false, :default => ""
      t.string :mail_user, :null => false, :default => ""
      t.string :mail_password, :null => false, :default => ""
      t.integer :mail_port, :null => false, :default => 25
      t.boolean :mail_auth, :null => false, :default => false

      t.timestamps
    end
  end
end
