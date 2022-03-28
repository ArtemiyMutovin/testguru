# frozen_string_literal: true

class AddForeignKeyTestToCategory < ActiveRecord::Migration[7.0]
  def change
    add_reference :categories, :test, foreign_key: true, index: true
  end
end
