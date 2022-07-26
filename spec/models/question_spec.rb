require 'rails_helper'

RSpec.describe Question, type: :model do
  it { is_expected.to belong_to :test }
  it { is_expected.to have_many(:answers).dependent(:destroy) }
  it { is_expected.to have_many(:gists).dependent(:destroy) }
  it { is_expected.to have_many(:links).dependent(:destroy) }
  it { is_expected.to have_many(:current_questions).class_name('TestPassage').with_foreign_key(:current_question_id) }

  it 'have many attached files' do
    expect(described_class.new.files).to be_an_instance_of(ActiveStorage::Attached::Many)
  end

  it { is_expected.to accept_nested_attributes_for :links }

  it { is_expected.to validate_presence_of :title }
end
