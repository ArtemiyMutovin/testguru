# frozen_string_literal: true
class Test < ApplicationRecord

  def self.list
    Test.order('level DESC')
  end
end
