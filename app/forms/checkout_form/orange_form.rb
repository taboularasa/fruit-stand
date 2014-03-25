class CheckoutForm::OrangeForm < BaseForm
  attr_accessor :id

  validates :sweetness_level,
    presence: true,
    numericality: { only_integer: true  }

  validates :variety, presence: true
  validate :variety_type

  def cart_id=(cart_id)
    orange.cart_id = cart_id
  end

  def cart_id
    orange.cart_id
  end

  def sweetness_level
    orange.sweetness_level
  end

  def sweetness_level=(sweetness_level)
    orange.sweetness_level = sweetness_level
  end

  def variety
    orange.variety
  end

  def variety=(variety)
    orange.variety = variety
  end

  def orange
    @orange ||= Orange.find_or_initialize_by_id(id)
  end

  def save
    orange.save
  end

  private

  def variety_type
    unless ["homosassa", "maltaise", "moro", "pera"].include? variety
      errors.add(:variety, "invalid variety")
    end
  end
end
