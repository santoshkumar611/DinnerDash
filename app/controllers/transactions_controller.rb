class TransactionsController < ApplicationController
	def new
		if session[:user_id]
 	   gon.client_token = generate_client_token
			@sum = sum(current_order.id)
 	  else	
     flash[:notice] = "login from controller"
     redirect_to login_page_path
    end
  end
		def create
			unless current_user.has_payment_info?
				
				@result = Braintree::Transaction.sale(
					amount: sum(current_order.id),
					payment_method_nonce: params[:payment_method_nonce],
					customer: {
						first_name: params[:first_name],
						last_name: params[:last_name],
						company: params[:company],
						email: current_user.email,
						phone: params[:phone]
						},
						options: {
							store_in_vault: true
							})
			else
				
				@result = Braintree::Transaction.sale(
					amount: sum(current_order.id),
					payment_method_nonce: params[:payment_method_nonce])
			end

			if @result.success?
				current_user.update(braintree_customer_id: @result.transaction.customer_details.id) unless current_user.has_payment_info?
				current_user.orders << current_order
				current_order.update(total_cost: sum(current_order.id),is_missed: false,status_id: 2)
				redirect_to clear_cart_path, notice: "Congraulations! Your transaction has been successfully!"

			else
				flash[:alert] = "Something went wrong while processing your transaction. Please try again!"
				gon.client_token = generate_client_token
				render :new
			end
		end

		private
		def generate_client_token
			if current_user.has_payment_info?
				Braintree::ClientToken.generate(customer_id: current_user.braintree_customer_id)
			else
				Braintree::ClientToken.generate
			end
		end
		
	end
