require 'rails_helper'

RSpec.describe Link, type: :model do
  it { is_expected.to belong_to :linkable }

  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :url }
  it { is_expected.to validate_url_of(:url) }
end
