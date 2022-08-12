require 'rails_helper'
RSpec.describe DailyDigestMailer, type: :mailer do
  describe 'digest' do
    let(:admin) { create(:admin) }
    let(:mail) { described_class.digest(admin) }
    let!(:questions) { create_list(:question, 2, created_at: Time.zone.now, author: admin) }

    it 'renders the headers' do
      expect(mail.subject).to eq('Digest')
      expect(mail.to).to eq([admin.email])
      expect(mail.from).to eq(['mail@testguru.com'])
    end

    it 'renders the body' do
      expect(mail.body.encoded).to match('Daily Digest')
      questions.each do |question|
        expect(mail.body.encoded).to match(question.title)
      end
    end
  end
end
