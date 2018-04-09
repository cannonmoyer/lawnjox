class QuotesController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :authenticate_user!, :except => [:generate]
    def index
        if params[:page].blank?
            page = 1
        else
            page = params[:page].to_i
        end
        @quotes = Quote.all.order(created_at: :desc).page(page).per(15)
    end
    
    def new
        
    end
    
    def generate
       
        requester = Requester.find_by(cookie: cookies.encrypted[:token])
        
        if requester.blank?
            #attempt to find requester. Create if necessary.
            requester = Requester.find_by(ip: request.remote_ip)
            
            if requester.blank?
               requester = Requester.find_by(email: params[:email]) 
            end
            
            #create cookie.
            if requester.blank?
                requester = create_requester(request.remote_ip, params[:email])
                cookies.permanent.encrypted[:token] = requester.cookie
            else
                cookies.permanent.encrypted[:token] = requester.cookie  
            end
            
        end
        
        @quote = false
        @address = Address.find_by(id: params["address_id"])
        
        
        if @address.present?
            requester_address = requester.addresses.find_by(id: @address.id.to_s)
            if requester.addresses.count < 2 && requester_address.blank?
                @quote = true
                requester.addresses << @address
            elsif requester_address.present?
                @quote = true
            else
                @message = "You cannot request more than 2 addresses. If you need further assistance please call us at the number below."
            end
        else
            @quote = requester.quotes.create(name: params[:name], address: params[:address], phone: params[:phone], email: params[:email])
            @message = "We were unable to find your address in our database. We will contact you within 24 hours with a quote!"
        end
        
        if @quote == true
           @lawn_mowing_price = @address.get_mowing_cost
           @lawn_spraying_price = @address.get_spraying_cost
        end
        
        
        
        puts requester.addresses.count
         
    end
    
    private
    def create_requester(ip, email)
       requester = Requester.create(ip: ip, email: email) 
    end
    
    
end
