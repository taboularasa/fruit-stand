class StandardForm < BaseForm
  attributes_mapping_for :user, {
    user_name: :name,
    user_role: {
      model_attribute: :role,
      type: Integer
    }
  }

  attributes_mapping_for :project, {
    project_name: :name,
    price: :price
  }

  validates :user_name, presence: true

  def self.setup(params, user, project)
    new.tap do |form|
      form.load(user, project)
      form.attributes = params
    end
  end

  # TODO come up with standard way of handling nested forms
  # something like below but better
  def apples
    @apples ||= cart.apples.any? ? cart.apples : [Apple.new]
  end

  def apple_forms
    @apple_forms ||= apples.map do |apple|
      CheckoutForm::AppleForm.new(id: apple.id, cart_id: cart.id)
    end
  end

  def apple_forms_attributes=(attributes)
    @apple_forms ||= attributes.map do |_, apple_attributes|
      apple_attributes.merge cart_id: cart.id
      CheckoutForm::AppleForm.new(apple_attributes)
    end
  end

  def load(user, project)
    self.attributes = attributes_from(:user, user)
    self.attributes = attributes_from(:project, project)
  end

  def save
    return false unless valid?

    user.attributes = attributes_for(:user)
    project.attributes = attributes_for(:project)

    safe_save do
      user.save!
      project.save!
    end
  end
end
