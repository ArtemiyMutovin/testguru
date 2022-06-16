module BadgesHelper
  def badge_header(badge)
    return 'Новый бейдж' if badge.new_record?

    "Редактирование бейджа: #{badge.name}"
  end
end
