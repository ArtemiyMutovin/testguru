class QuestionsController < ApplicationController

  before_action :find_test, only: %i[index new]
  before_action :find_question, only: %i[show]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render json: { questions: @test.questions }
  end

  def show
    render json: { questions: @question }
  end

  def new
    @question = Question.create(title: 'Question', test: @test)
    render inline: '<p>New question is ready!: <%= @question %>!<p>'
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def rescue_with_question_not_found
    render json: { question: :not_found }
  end
end
