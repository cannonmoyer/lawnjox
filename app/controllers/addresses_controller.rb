

class AddressesController < ApplicationController
    

skip_before_action :verify_authenticity_token
 
 before_action :authenticate_user!, :except => [:search]
  
	
    def new
        @address = Address.new
    end
    
    def index
        Address.__elasticsearch__.delete_index!
        Address.__elasticsearch__.create_index!
        Address.all.import force: true
	          
        
    end
    
    def edit
        
    end
    
    def search
       
	   
        #Address.all.import force: true
        @addresses = Address.all
        puts @addresses.size
        
        search_params = {
            query: {
              multi_match: {
                query: "#{params[:q]}",
                fields: ["street", "state"]
              }
            }
          }
        
          @addresses= Address.__elasticsearch__.search(search_params, size: 1).results()
         
          
        
    end
    
    def import
        Address.import_addresses(params[:file])
    end
    
end
