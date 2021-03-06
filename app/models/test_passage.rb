class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :set_first_question, on: :create

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    self.successful = true if successful?

    self.current_question = next_question
    save!
  end

  def successful?
    progress >= 75
  end

  def failed?
    !successful?
  end

  def progress
    (correct_questions / test.questions.count.to_f) * 100
  end

  private

  def set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def correct_answer?(answer_ids)
    correct_answers_count = correct_answers.count

    (correct_answers_count == correct_answers.where(id: answer_ids).count) &&
      correct_answers_count == answer_ids.count
  end

  def correct_answers
    current_question.answers.correct
  end

  def before_create_set_count
    self.count += 1
  end

  def next_question
    test.questions.order(:id).find_by('id > ?', current_question.id)
  end
end
