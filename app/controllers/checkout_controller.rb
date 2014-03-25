class CheckoutController < ApplicationController
  def edit
    @cart = params[:id]
    @checkout_form = CheckoutForm.new(cart: @cart)
  end

  def update
    @cart = params[:id]
    @checkout_form = CheckoutForm.new(cart: @cart)
    @checkout_form.attributes = params[:checkout_form]
    if @checkout_form.save
      @checkout_form.flash.try(:each) { |f| flash[f.type] = f.message }
      # do success business here
    else
      redirect_to action: "edit"
    end
  end
end
