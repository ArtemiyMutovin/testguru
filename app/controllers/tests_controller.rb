class TestsController < ApplicationController
  before_action :authenticate_user!
  before_action :test, only: %i[start]

  authorize_resource

  def index
    @tests = Test.all
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  private

  def test
    @test = Test.find(params[:id])
  end
end
