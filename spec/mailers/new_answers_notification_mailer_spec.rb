require 'rails_helper'

RSpec.describe NewAnswersNotificationMailer, type: :mailer do
  let(:admin) { create(:admin) }
  let(:question) { create(:question, author: admin) }
  let!(:answer) { create(:answer, question: question) }
  let(:mail_for_author) { described_class.send_notification(question.author, answer) }

  describe 'NewAnswersNotificationMailer#send_notification' do
    it 'renders the headers' do
      expect(mail_for_author.subject).to eq('New answer')
      expect(mail_for_author.to).to eq([question.author.email])
      expect(mail_for_author.from).to eq(['mail@testguru.com'])
    end

    it 'renders the body' do
      expect(mail_for_author.body.encoded).to match(answer.title)
    end
  end
end
