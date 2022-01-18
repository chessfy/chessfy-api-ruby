class CreatePlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :players do |t|

      t.string :fideid, limit:12, null: true, index: { unique: true }
      t.string :name, null: true
      t.string :country, limit: 3, null: true
      t.string :sex, limit: 1, null: true
      t.string :title, limit: 4, null: true
      t.string :w_title, limit: 4, null: true
      t.string :o_title, limit: 4, null: true
      t.string :foa_title, limit: 4, null: true
      t.string :rating, limit: 4, null: true
      t.string :games, null: true
      t.string :k, limit: 2, null: true
      t.string :rapid_rating, limit: 4, null: true
      t.string :rapid_games, null: true
      t.string :rapid_k, limit: 2, null: true
      t.string :blitz_rating, limit: 4, null: true
      t.string :blitz_games, null: true
      t.string :blitz_k, limit: 2, null: true
      t.string :birthday, null: true
      t.string :flag, null: true

      t.timestamps null:true, default: DateTime.now
    end
    add_index :players, [:fideid, :name], name: 'players_fideid_name_fulltext', type: :fulltext
  end
end
