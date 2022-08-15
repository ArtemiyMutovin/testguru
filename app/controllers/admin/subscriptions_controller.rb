class Admin::SubscriptionsController < ApplicationController
  before_action :authenticate_user!
  before_action :question, only: :create
  before_action :subscription, only: :destroy

  authorize_resource

  def create
    @question.subscriptions.create(user: current_user)
    redirect_to admin_question_subscriptions_path(@question)
  end

  def destroy
    @question = @subscription.question
    subscription.destroy
  end

  private

  def question
    @question = Question.find(params[:question_id])
  end

  def subscription
    @subscription = Subscription.find(params[:id])
  end

  def subscription_params
    params.require(:subscription).permit(:user_id, :question_id)
  end
end
