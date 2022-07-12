require 'rails_helper'

RSpec.describe TestPassage, type: :model do
  it { is_expected.to belong_to :user }
  it { is_expected.to belong_to :test }
  it { is_expected.to belong_to(:current_question).class_name('Question').optional(true) }

  describe 'completed?' do
    let(:test) { create(:test) }
    let(:user) { create(:user) }
    let!(:test_passage) { create(:test_passage, user: user, test: test) }

    it 'current question not exist' do
      expect(test_passage.completed?).to eq true
    end
  end

  describe 'successful?' do
    let(:test) { create(:test) }
    let(:user) { create(:user) }
    let!(:test_passage) { create(:test_passage, user: user, test: test) }

    it 'user test passage successful?' do
      expect(test_passage.successful?).to eq true
    end
  end

  describe 'failed?' do
    let(:test) { create(:test) }
    let(:user) { create(:user) }
    let!(:test_passage2) { create(:test_passage, :test_passage2, user: user, test: test) }

    it 'user test passage failed?' do
      expect(test_passage2.failed?).to eq true
    end
  end

  describe 'progress' do
    let(:test) { create(:test) }
    let(:question) { create(:question, test: test) }
    let!(:correct_answer) { create(:answer, :correct_answer, question: question) }
    let(:user) { create(:user) }
    let!(:test_passage) { create(:test_passage, user: user, test: test) }

    it 'user test passage result' do
      expect(test_passage.progress).to eq 100
    end
  end
end
