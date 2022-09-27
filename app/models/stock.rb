class Stock < ApplicationRecord

	has_many :user_stocks
	has_many:users,through: :user_stocks

	validates :name,:ticker,presence:true
	def self.new_lookup(ticker_symbol)
		client = IEX::Api::Client.new(publishable_token: 'pk_4cb0075e90714dc2b532b9469e5c13ae',
  					endpoint: 'https://cloud.iexapis.com/v1')
		begin
			new(name:client.company(ticker_symbol).company_name,last_price:client.quote(ticker_symbol).latest_price,ticker:ticker_symbol)
		rescue
			return nil
		end
	end

	def self.check_stock(ticker_symbol)
		where(ticker:ticker_symbol).first
	end
end
