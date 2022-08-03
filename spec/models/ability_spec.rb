require 'rails_helper'

RSpec.describe Ability, type: :model do
  subject(:ability) { described_class.new(user) }

  describe 'admin' do
    let(:user) { create(:user, :admin) }

    it { is_expected.to be_able_to :manage, :all }
  end

  describe 'user' do
    let(:user) { create :user }
    let(:test) { create(:test, users: [user]) }
    let(:question) { create(:question, test: test) }
    let(:answer) { create(:answer, question: question) }
    let(:test_passage) { create(:test_passage, user: user, test: test, current_question_id: question) }

    it { is_expected.not_to be_able_to :manage, :all }
    it { is_expected.to be_able_to :read, :all }

    it { is_expected.to be_able_to :start, Test }
    it { is_expected.to be_able_to :update, TestPassage }
    it { is_expected.to be_able_to :result, TestPassage }
    it { is_expected.to be_able_to :gist, TestPassage }
  end
end
