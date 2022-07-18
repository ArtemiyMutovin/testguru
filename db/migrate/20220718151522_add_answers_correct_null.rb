class AddAnswersCorrectNull < ActiveRecord::Migration[7.0]
  def change
    change_column_null(:answers, :correct, false)
    add_index :answers, :title, unique: true
  end
end
