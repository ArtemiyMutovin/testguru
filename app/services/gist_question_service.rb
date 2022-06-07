class GistQuestionService

  attr_accessor :client

  def initialize(question, client: default_client)
    @question = question
    @test = @question.test
    @client = client
  end

  def call
    @client.create_gist(gist_params)
  end

  private

  def default_client
    Octokit::Client.new(access_token: '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')
  end

  def gist_params
    {
      "description": I18n.t('admin.gists.question', question: @question.title),
      "public": true,
      "files": {
        'test-guru-question.txt' => {
          "content": gist_content
        }
      }
    }
  end


  def gist_content
    content = [@question.title]
    content += @question.answers.pluck(:title)
    content.join('/n')
  end

end
