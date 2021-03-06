# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'
  has_many :questions, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages

  validates :title, presence: true
  validates :title, uniqueness: true
  validates :level, numericality: { only_integer: true, greater_than: 0 }

  scope :easy, -> { where(level: 0..1).order(test_id: :desc) }
  scope :medium, -> { where(level: 2..4).order(test_id: :desc) }
  scope :hard, -> { where(level: 5..20).order(test_id: :desc) }
  scope :list, ->(level) { where(level: level).order(test_id: :desc) }
end
