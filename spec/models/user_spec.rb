require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to have_many(:created_tests).class_name('Test').with_foreign_key(:author_id).dependent(:destroy) }
  it { is_expected.to have_many(:test_passages).dependent(:destroy) }
  it { is_expected.to have_many(:tests).through(:test_passages) }
  it { is_expected.to have_many(:gists).dependent(:destroy) }
  it { is_expected.to have_many(:user_badges).dependent(:destroy) }
  it { is_expected.to have_many(:badges).through(:user_badges) }

  describe 'validate user uniqueness' do
    let!(:user) { create(:user) }

    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
  end

  describe 'show_tests(level)' do
    let(:test) { create(:test) }
    let(:second_test) { create(:test, :test_with_second_level) }
    let(:user) { create(:user, tests: [test, second_test]) }

    it 'show user tests with level' do
      expect(user.show_tests(4)).to include(test)
    end

    it "doesn't show tests with other level" do
      expect(user.show_tests(4)).not_to include(second_test)
    end

    it "doesn't show tests if test not exist" do
      expect(user.show_tests(1).count).to be 0
    end
  end

  describe 'test_passage(test)' do
    let(:test) { create(:test) }
    let(:user) { create(:user) }
    let!(:test_passage) { create(:test_passage, user: user, test: test) }

    it 'show user test_passages' do
      expect(user.test_passage(test)).to eq(test_passage)
    end
  end

  describe 'admin?' do
    let(:user) { create(:user) }
    let(:admin) { create(:user, :admin) }

    it 'user is admin' do
      expect(admin.admin?).to eq true
    end

    it 'user is not admin' do
      expect(user.admin?).to eq false
    end
  end
end
