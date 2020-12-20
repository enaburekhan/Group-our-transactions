class PaymentsController < ApplicationController
    before_action :logged_in_user
    before_action :set_group, only: %i[show edit update destroy]
  
    def create
      @payment = Payment.new(payment_params)
  
      if @payment.save
        @shopping_list = ShoppingList.find(payment_params[:shopping_list_id])
        @shopping_list.active = false
        @shopping_list.save
        redirect_to shopping_lists_path, notice: 'Payment was successfully saved.'
      else
        redirect_to shopping_lists_path, notice: @payment.errors[:name].first
      end
    end
  
    private
  
    def set_payment
      @payment = Payment.find(params[:id])
    end
  
    def payment_params
      params.require(:payment).permit(:price, :transaction_code, :shopping_list_id)
    end    
end
