class PortfoliosController < ApplicationController
    def index
       @porfolio_items = Portfolio.all 
    end
end
