# frozen_string_literal: true

class Question < ApplicationRecord
  belongs_to :test
  has_many :answers, dependent: :destroy
  has_many :current_questions,
           class_name: 'TestPassage',
           foreign_key: :current_question_id,
           inverse_of: :current_question,
           dependent: :destroy
  has_many :gists, dependent: :destroy

  validates :title, presence: true
end
