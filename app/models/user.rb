# frozen_string_literal: true

class User < ApplicationRecord

  def show_tests(level)
    Test.where(level)
  end
end


