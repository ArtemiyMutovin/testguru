class Admin::QuestionsController < Admin::BaseController
  before_action :authenticate_user!
  before_action :find_test, only: %i[index new create]
  before_action :find_question, only: %i[show edit update]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = @test.questions
  end

  def show; end

  def new
    @question = @test.questions.new
  end

  def edit; end

  def update
    if @question.update(question_params)
      redirect_to admin_question_path(@question)
    else
      render :edit
    end
  end

  def create
    @question = @test.questions.new(question_params)

    if @question.save
      redirect_to admin_question_path(@question), notice: t('.success')
    else
      render :new
    end
  end

  private

  def question_params
    params.require(:question).permit(:title, :test_id)
  end

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
