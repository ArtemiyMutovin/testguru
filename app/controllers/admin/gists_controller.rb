class Admin::GistsController < Admin::BaseController
  authorize_resource

  def index
    @gists = Gist.all
  end
end
