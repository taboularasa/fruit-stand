class BaseForm
  include ActiveAttr::Model

  class_attribute :attributes_mappings
  def self.attributes_mapping_for(group_name, attributes)
    self.attributes_mappings ||= {}
    attributes_mappings[group_name] = {}

    attributes.each do |name, options|
      model_attribute = options.is_a?(Symbol) ? options : options[:model_attribute]
      attributes_mappings[group_name][name] = model_attribute

      attribute_options = options.is_a?(Symbol) ? {} : options.except(:model_attribute)
      attribute name, attribute_options
    end
  end

  def attributes_for(group_name)
    attributes_mappings[group_name].each_with_object({}) do |(form_attribute, model_attribute), obj|
      obj[model_attribute] = attributes[form_attribute]
    end
  end

  def attributes_from(group_name, model)
    attributes_mappings[group_name].each_with_object({}) do |(form_attribute, model_attribute), obj|
      obj[form_attribute] = model.attributes[model_attribute]
    end
  end

  def safe_save
    yield
    true
  rescue ActiveRecord::RecordInvalid #find out which ones
    false #counterpart to save!
  end
end
