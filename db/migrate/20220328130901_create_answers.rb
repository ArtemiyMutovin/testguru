# frozen_string_literal: true

class CreateAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :answers do |t|
      t.string :title
      t.string :correct, default: false

      t.timestamps
      t.references :questions, foreign_key: true, index: true
    end
  end
end
