class CreateAppConfigs < ActiveRecord::Migration
  def change
    create_table :app_configs do |t|
      t.datetime :beginning
      t.datetime :ending
      t.string :mail_server
      t.string :mail_user
      t.string :mail_password
      t.integer :mail_port
      t.boolean :mail_auth

      t.timestamps
    end
  end
end
