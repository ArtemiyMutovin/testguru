# frozen_string_literal: true

class AddNameNullConstraint < ActiveRecord::Migration[7.0]
  def change
    change_column_null(:tests, :title, false)
    change_column_null(:questions, :title, false)
    change_column_null(:answers, :title, false)
    change_column_null(:users, :email, false)
  end
end
