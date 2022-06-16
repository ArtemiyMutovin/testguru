class Badge < ApplicationRecord
  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges

  validates :name, :file, presence: true

  def self.first_try
    find_by name: 'On The First Try'
  end

  def self.game_dev_master
    find_by name: 'Game Master'
  end

  def self.web_master
    find_by name: 'Web Master'
  end

  def self.test_guru_master
    find_by name: 'Test Guru Master'
  end
end
