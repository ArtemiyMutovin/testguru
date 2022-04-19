# frozen_string_literal: true

module ApplicationHelper
  def upcase_title(resource)
    resource.title.upcase
  end

  def date
    @current_year = Time.now.year
  end

  def link(author, repo)
    "https://github.com/#{author}/#{repo}"
  end
end
