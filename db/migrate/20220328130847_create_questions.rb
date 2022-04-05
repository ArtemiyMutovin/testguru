# frozen_string_literal: true

class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.string :title
      t.references :test, foreign_key: true, index: true

      t.timestamps
    end
  end
end
