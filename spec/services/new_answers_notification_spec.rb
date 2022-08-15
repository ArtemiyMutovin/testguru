require 'rails_helper'
RSpec.describe NewAnswersNotification do
  let(:admin) { create(:admin) }
  let(:question) { create(:question, author: admin) }
  let!(:answer) { create(:answer, question: question) }

  it 'sends email to question owner' do
    expect(NewAnswersNotificationMailer).to receive(:send_notification).with(question.author, answer).and_call_original
    subject.send_notification(question.author, answer)
  end
end
