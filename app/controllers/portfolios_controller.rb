class PortfoliosController < ApplicationController
    before_action :set_portfolio_item, only: [:edit, :show, :update, :destroy]
    layout 'portfolio'
    access all: [:show, :index, :angular], user: {except: [:destroy, :new, :create, :update, :edit]}, site_admin: :all

    
    def index
       @portfolio_items = Portfolio.all
    end
    
    def angular
       @angular_portfolio_items = Portfolio.angular
    end
    
    def new
        @portfolio_item = Portfolio.new
        3.times { @portfolio_item.technologies.build }
    end
    
    def create
        @portfolio_item = Portfolio.new(portfolios_params)
    
        respond_to do |format|
          if @portfolio_item.save
            format.html { redirect_to portfolios_path, notice: 'Your portfolio item is now live.' }
          else
            format.html { render :new }
          end
        end
    end
    
    def edit 
    end
    
     def update
    respond_to do |format|
      if @portfolio_item.update(portfolio.params)
        format.html { redirect_to portfolios_path, notice: 'Portfolio was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
     end
     
     def show
        
     end
     
      def destroy
   
     #destroy/delete the record    
        @portfolio_item.destroy
    
    #redirect
        respond_to do |format|
          format.html { redirect_to portfolios_url, notice: 'Portfolio was removed.' }
        end
      end
      
    private 

    def portfolios_params
        params.require(:portfolio).permit(:title, 
                                          :subtitle, 
                                          :body, 
                                          technologies_attributes: [:name]
                                          )
    end

    def set_portfolio_item
        @portfolio_item = Portfolio.find(params[:id])
    end
end
