class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :test_passage, only: %i[show result update gist]

  def show; end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      @badges = BadgeIssuance.new(@test_passage).give_badges
      @test_passage.user.badges.push(@badges) if @badges.present?
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    request = GistQuestionService.new(@test_passage.current_question)
    request_result = request.call
    response = request.client.last_response
    gist_link = request_result.html_url

    redirect_to @test_passage

    request_result_message(response, gist_link)
  end

  private

  def test_passage
    @test_passage ||= TestPassage.find(params[:id])
  end

  def request_result_message(response, gist_link)
    if gist_link.present? && response.status.eql?(201)
      current_user.gists.create(question: @test_passage.current_question, gist_url: gist_link)
      flash[:notice] = t('.gist.success', gist_link: view_context.link_to('Gist', gist_link))
    else
      flash[:alert] = t('.gist.failure')
    end
  end
end
