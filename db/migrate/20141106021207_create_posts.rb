class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer  "user_id",                          null: false
      t.string   "title",                            null: false
      t.integer  "status",      limit: 1, default: 0, null: false
      t.string   "tag"
      t.binary   "content",                           null: false
      t.integer  "setting_id",                        null: false
      t.timestamps
    end
  end
end
