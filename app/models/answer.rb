# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs_to :question
  has_many :links, dependent: :destroy, as: :linkable

  has_many_attached :files

  accepts_nested_attributes_for :links, reject_if: :all_blank

  scope :correct, -> { where(correct: true) }

  validates :title, presence: true
  validates :title, uniqueness: true

  after_create :send_notification

  private

  def send_notification
    NewAnswersNotificationJob.perform_later(question.author, self)
  end
end
