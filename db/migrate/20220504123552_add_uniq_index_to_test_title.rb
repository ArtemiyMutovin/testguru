class AddUniqIndexToTestTitle < ActiveRecord::Migration[7.0]
  def change
    add_index :tests, :title, unique: true
  end
end
