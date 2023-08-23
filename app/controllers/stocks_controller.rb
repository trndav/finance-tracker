class StocksController < ApplicationController
    def search
        if params[:stock].present?
            @stock = Stock.new_lookup(params[:stock])   
            if @stock     
                render "users/my_portfolio"
            else
                flash[:alert] = "Symbol you entered is not valid." 
                redirect_to my_portfolio_path
            end
        else
            flash[:alert] = "Search term must not be empty."
            redirect_to my_portfolio_path
        end       
    end
end