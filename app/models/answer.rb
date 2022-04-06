# frozen_string_literal: true
class Answer < ApplicationRecord
  belongs_to :question

  scope :correct, ->(correct) { where(correct: correct).order(question_id: :desc) }
end
