require 'rails_helper'

RSpec.describe Test, type: :model do
  it { is_expected.to belong_to :category }
  it { is_expected.to belong_to(:author).class_name('User') }
  it { is_expected.to have_many(:questions).dependent(:destroy) }
  it { is_expected.to have_many(:test_passages).dependent(:destroy) }
  it { is_expected.to have_many(:users).through(:test_passages) }

  it { is_expected.to validate_presence_of :title }
  it { is_expected.to validate_numericality_of :level }

  describe 'validate test uniqueness' do
    let!(:test) { create(:test) }

    it { is_expected.to validate_uniqueness_of :title }
  end
end
