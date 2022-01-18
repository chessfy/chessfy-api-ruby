class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username, limit:30, null:false, index: { unique: true }
      t.references :player, null: true, foreign_key: true
      t.string :role, null:false, default:'user'
      t.string :email, null:false, index: { unique: true }
      t.string :name, limit:100, null:true
      t.string :password_digest, null:false
      t.timestamp :email_verified_at, null:true
      t.boolean :affiliated, null:false, default:false
      t.string :photo, limit:120, null:true
      t.string :biography, limit:750, null:true
      t.date :birthday, null:true
      t.string :remember_token, null:true, limit:100

      t.timestamps
    end
    add_index :users, [:username, :name], name: 'users_username_name_fulltext', type: :fulltext
  end
end