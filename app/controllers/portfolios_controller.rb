class PortfoliosController < ApplicationController
    def index
       @porfolio_items = Portfolio.all
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
      @portfolio_item = Portfolio.find(params[:id])
    end
    
     def update
       @portfolio_item = Portfolio.find(params[:id])
       
    respond_to do |format|
      if @portfolio_item.update(portfolio.params)
        format.html { redirect_to portfolios_path, notice: 'Portfolio was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
     end
     
     def show
        @portfolio_item = Portfolio.find(params[:id])
     end
     
      def destroy
      #Perfom the lookup  
         @portfolio_item = Portfolio.find(params[:id])
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
end
