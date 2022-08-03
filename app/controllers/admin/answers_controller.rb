class Admin::AnswersController < Admin::BaseController
  before_action :authenticate_user!
  before_action :find_question, only: %i[new create]
  before_action :set_answer, only: %i[show edit update destroy]

  authorize_resource

  def show; end

  def new
    @answer = @question.answers.new
    @answer.links.new
  end

  def edit
    @answer.links.new
  end

  def create
    @answer = @question.answers.new(answer_params)

    if @answer.save
      redirect_to admin_answer_path(@answer)
    else
      render :new
    end
  end

  def update
    if @answer.update(answer_params)
      redirect_to admin_answer_path(@answer)
    else
      render :edit
    end
  end

  def destroy
    @answer.destroy
    redirect_to admin_questions_path(@answer.question)
  end

  private

  def find_question
    @question ||= params[:question_id] ? Question.with_attached_files.find(params[:question_id]) : Question.new
  end

  def set_answer
    @answer = Answer.with_attached_files.find(params[:id])
  end

  def answer_params
    params.require(:answer).permit(:title, :correct, files: [], links_attributes: %i[name url])
  end
end
