require 'rails_helper'

RSpec.describe Question, type: :model do
  it { is_expected.to belong_to :test }
  it { is_expected.to have_many(:answers).dependent(:destroy) }
  it { is_expected.to have_many(:current_questions).class_name('TestPassage').with_foreign_key(:current_question_id) }
  it { is_expected.to have_many(:gists).dependent(:destroy) }

  it { is_expected.to validate_presence_of :title }
end
