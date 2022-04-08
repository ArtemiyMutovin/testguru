class QuestionsController < ApplicationController

  before_action :find_test, only: %i[show]

  def index
    render json: { questions: Test.first.questions }
  end

  def show
    render json: { questions: Question.first }
  end

  def new
    @question = Question.create(title: 'Question3', test: Test.first)
    render inline: '<p>New question is ready!: <%= @question %>!<p>'
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end
end
