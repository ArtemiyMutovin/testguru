class BadgeIssuance
  GIVE_BADGES = %i[give_first_try_badge give_game_dev_master_badge give_web_master_badge give_test_guru_master_badge].freeze
  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
  end

  def give_badges
    GIVE_BADGES.map { |give_badge| send give_badge }.compact
  end

  def give_first_try_badge
    Badge.first_try if @user.tests.where(title: @test_passage.test.title).count.eql?(1) && @test_passage.successful
  end

  def give_game_dev_master_badge
    Badge.game_dev_master if game_dev_completed?
  end

  def give_web_master_badge
    Badge.web_master if ruby_completed?
  end

  def give_test_guru_master_badge
    Badge.test_guru_master if ruby_completed? && game_dev_completed?
  end

  def ruby_completed?
    ruby_tests = @user.tests.ruby.map do |test|
      test.test_passages.where(successful: false)[0]
    end

    ruby_tests.present?
  end

  def game_dev_completed?
    game_tests = @user.tests.game_dev.map do |test|
      test.test_passages.where(successful: false)[0]
    end
    game_tests.present?
  end
end
