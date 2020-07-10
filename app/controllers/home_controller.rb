class HomeController < ApplicationController
    def index
      @contact = Home.new(params[:home])
    end
    
    def create 
       
        @contact = Home.new(params[:home])
        @contact.request = request
        respond_to do |format|
            if @contact.deliver
                @contact = Home.new
                format.html { render 'index' }
                format.js { flash.now[:success] = @message = "Thank you for your interest. I'll get back to you soon!" }
            else
                format.html { render 'index' }
                format.js { flash.new[:error] = @message = "Form did not send." }
        
            end
        end
    end
end
