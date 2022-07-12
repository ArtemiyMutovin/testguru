require 'rails_helper'

RSpec.describe Badge, type: :model do
  it { is_expected.to have_many(:user_badges).dependent(:destroy) }
  it { is_expected.to have_many(:users).through(:user_badges) }

  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :file }
  it { is_expected.to validate_presence_of :reason }
  it { is_expected.to validate_presence_of :rule_value }
  it { is_expected.to validate_presence_of :rule_type }

  it {
    expect(subject).to validate_inclusion_of(:rule_type).in_array(BadgeIssuance::RULES)
                                                        .with_message(I18n.t('activerecord.errors.messages.rule_type'))
  }
end
