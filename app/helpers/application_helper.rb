# frozen_string_literal: true

module ApplicationHelper
  def upcase_title(resource)
    resource.title.upcase
  end

  def date
    Time.zone.now.year
  end

  def link(author, repo)
    "https://github.com/#{author}/#{repo}"
  end

  def flash_message(type)
    tag.p(flash[type], class: "flash #{type}")
  end
end
