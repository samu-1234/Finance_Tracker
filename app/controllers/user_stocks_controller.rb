class UserStocksController < ApplicationController
	def create
		stock=Stock.check_stock(params[:ticker])
		if stock.blank?
			stock=Stock.new_lookup(params[:ticker])
			stock.save
		end
		@user_stock=UserStock.create(user:current_user,stock:stock)
		flash[:notice]="Stocks has been inserted in myportfolio"
		redirect_to my_portfolio_path	
	end
	def destroy
		#user=User.first
		stock=Stock.find(params[:id])
		del_stock=UserStock.where(user_id:current_user.id,stock_id:stock.id).last
		del_stock.destroy
		flash[:notice]="Associated stock has been removed"
		redirect_to my_portfolio_path
	end
end

'''--> user = User.first
	--> user.stocks
	--> stock=Stock.find(1)
	--> UserStock.all
	-->UserStock.where(user_id: user.id,stock_id:stock.id).first
	-->UserStock.where(user_id: user.id,stock_id:stock.id).first.destroy
'''
