class UserStocksController < ApplicationController
    def create
        stock = Stock.check_db(params[:ticker])
        if stock.blank?
            stock = Stock.new_lookup(params[:ticker])
            stock.save
        end
        @user_stock = UserStock.create(user: current_user, stock: stock)
        flash[:notice] = "Stock #{stock.name} was successfully added to portfolio."
        redirect_to my_portfolio_path
    end    
    def index
        @user_stocks = current_user.user_stocks # Fetch user's stocks from the database
      end
end
