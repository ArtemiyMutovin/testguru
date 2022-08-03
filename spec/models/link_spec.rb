require 'rails_helper'

RSpec.describe Link, type: :model do
  let(:gist_link) { create(:gist_link, linkable: question) }
  let(:google_link) { create(:google_link, linkable: question) }
  let(:question) { create(:question) }
  let(:admin) { create(:admin) }

  it { is_expected.to belong_to :linkable }

  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :url }
  it { is_expected.to validate_url_of(:url) }

  context 'when is gist?' do
    it 'true' do
      expect(gist_link).to be_gist
    end

    it 'false' do
      expect(google_link).not_to be_gist
    end
  end

  context 'when give gist content?' do
    it 'true' do
      expect(gist_link.gist).to eq 'Кто создал Ruby?/nYukihiro "Matz" Matsumoto/nGuido van Rossum/nBrendan Eich'
    end

    it 'false' do
      expect(google_link.gist).to eq nil
    end
  end
end
