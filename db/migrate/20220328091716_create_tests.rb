# frozen_string_literal: true

class CreateTests < ActiveRecord::Migration[7.0]
  def change
    create_table :tests do |t|
      t.string :title
      t.integer :level, default: 1
      t.references :category, foreign_key: true, index: true

      t.timestamps
    end
  end
end
