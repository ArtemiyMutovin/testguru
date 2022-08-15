# frozen_string_literal: true

class Question < ApplicationRecord
  belongs_to :test
  belongs_to :author, class_name: 'User'
  has_many :answers, dependent: :destroy
  has_many :links, dependent: :destroy, as: :linkable
  has_many :gists, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
  has_many :current_questions,
           class_name: 'TestPassage',
           foreign_key: :current_question_id,
           inverse_of: :current_question,
           dependent: :destroy

  has_many_attached :files

  accepts_nested_attributes_for :links, reject_if: :all_blank

  validates :title, presence: true

  after_create :calculate_reputation
  after_create :create_subscription

  def subscribed?(user)
    subscriptions.exists?(user: user)
  end

  def subscription(user)
    subscriptions.find_by(user_id: user.id)
  end

  private

  def calculate_reputation
    ReputationJob.perform_later(self)
  end

  def create_subscription
    subscriptions.create(user: author, question: self)
  end
end
