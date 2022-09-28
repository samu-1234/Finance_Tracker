class StocksController < ApplicationController
	def search
		if params[:stock].present?
			@stock=Stock.new_lookup(params[:stock])
			if @stock
				# respond_to do |format|
				# 	format.js{render partial:'users/result'}
				render 'users/my_portfolio'
			
			else
				flash[:alert]="Kindly provide the valid ticker symbol:"
				render 'users/my_portfolio'
			end
		else
			flash[:alert]="Kindly provide some ticker name:"
			render 'users/my_portfolio'
		end
		# render json: stock
		# render 'users/my_portfolio'
	end
end