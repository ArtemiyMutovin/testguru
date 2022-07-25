# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs_to :question

  has_many_attached :files

  scope :correct, -> { where(correct: true) }

  validates :title, presence: true
  validates :title, uniqueness: true
end
