class CheckoutForm::AppleForm < BaseForm

  attr_accessor :id

  validates :juiciness_level,
    presence: true,
    numericality: { only_integer: true  }

  validates :variety, presence: true
  validate :variety_type

  def juiciness_level
    apple.juiciness_level
  end

  def juiciness_level=(juiciness_level)
    apple.juiciness_level = juiciness_level
  end

  def variety
    apple.variety
  end

  def variety=(variety)
    apple.variety = variety
  end

  def apple
    @apple ||= Apple.find_or_initialize_by_id(id)
  end

  def save
    apple.update_attributes(attributes)
  end

  private

  def variety_type
    unless ["ambrosia", "bailey", "baldwin", "cameo"].include? variety
      errors.add(:variety, "invalid variety")
    end
  end
end
