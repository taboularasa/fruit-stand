class BaseForm
  include ActiveAttr::Model

  def flash
    @flash ||= []
  end

  def set_flash(type, message)
    flash << Hashie::Mash.new(type: type, message: message)
  end

end
