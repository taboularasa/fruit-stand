class CheckoutForm < BaseForm
  attr_accessor :cart

  def apples
    @apples ||= cart.apples.any? ? cart.apples : [Apple.new]
  end

  def apples
    @apples ||= [Apple.new]
  end

  def apple_forms
    @apple_forms ||= apples.map do |apple|
      CheckoutForm::AppleForm.new(id: apple.id)
    end
  end

  def apple_forms_attributes=(attributes)
    @apple_forms ||= attributes.map do |_, apple_attributes|
      CheckoutForm::AppleForm.new(apple_attributes)
    end
  end

  def oranges
    @oranges ||= cart.oranges.any? ? cart.oranges : [Orange.new]
  end

  def orange_forms
    @orange_forms ||= oranges.map do |orange|
      CheckoutForm::OrangeForm.new(id: orange.id)
    end
  end

  def orange_forms_attributes=(attributes)
    @orange_forms ||= attributes.map do |_, orange_attributes|
      CheckoutForm::OrangeForm.new(orange_attributes)
    end
  end

  def children_forms
    [apple_forms, orange_forms].flatten
  end

  def valid?
    children_forms.each(&:valid?).all?(&:valid?)
  end

  def save
    return false unless valid?

    # groups of forms can be processed individually if needed
    children_forms.each(&:save)
  end

  def collect_children_flash
    children_forms.each { |f|  @flash.merge f.flash }
  end
end
