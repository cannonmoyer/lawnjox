require 'elasticsearch/model'

class Address < ApplicationRecord
require 'csv'

	has_one :quote
 has_and_belongs_to_many :requesters

	include Elasticsearch::Model
	include Elasticsearch::Model::Callbacks
	
     
  settings index: { number_of_shards: 1 } do
	  mappings dynamic: 'false' do
	    indexes :street, analyzer: 'english'
	    indexes :city, analyzer: 'english'
	    indexes :state, analyzer: 'english' 
	    indexes :zip, analyzer: 'english'
	  end
	end
	
	def as_indexed_json(options={})
	    as_json(
	    	only: [:street, :city, :state, :zip]
	    )
	 end
	 
   ## Address.all.import force: true
   
   def self.import_addresses(file)
   	CSV.foreach(file.path, headers: true) do |row|
   		Address.create!(row.to_hash)
   	end
   end
   
      def get_mowing_cost
    	if self.square_feet < 4000
    		return 24.0
    	elsif self.square_feet < 10000
	        return 29.0
	    elsif self.square_feet < 14000
	    	return 34.0
	    end
	  end
	  
	  def get_spraying_cost
	    if self.square_feet < 4000
    		return 24.0
    	elsif self.square_feet < 10000
	        return 29.0
	    elsif self.square_feet < 14000
	    	return 34.0
	    end
	  end
end
