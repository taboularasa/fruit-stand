class CheckoutController < ApplicationController
  helper_method :checkout_form

  def edit;end

  def update
    checkout_form.attributes = params[:checkout_form]
    if checkout_form.save
      checkout_form.flash.try(:each) { |f| flash[f.type] = f.message }
      # do success business here
    else
      redirect_to action: "edit"
    end
  end

  private

  def checkout_form
    @checkout_form ||= CheckoutForm.new()
  end
end
