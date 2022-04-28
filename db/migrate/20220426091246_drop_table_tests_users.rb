class DropTableTestsUsers < ActiveRecord::Migration[7.0]
  def up
    drop_table :tests_users, if_exists: true
  end

  def down
    create_join_table :users, :tests do |t|
      t.index %i[user_id test_id], unique: true
    end
  end
end
