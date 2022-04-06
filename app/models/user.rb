# frozen_string_literal: true

class User < ApplicationRecord
  has_many :created_tests, class_name: 'Test', foreign_key: :author_id
  has_many :tests_users
  has_many :tests, through: :tests_users

  validates :email, presence: true

  def show_tests(level)
    tests.where(level: level)
  end
end

