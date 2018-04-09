class Requester < ApplicationRecord
    
    before_create :generate_cookie, :set_count
    
    has_and_belongs_to_many :addresses
    has_many :quotes
    
    protected

    def generate_cookie
        self.cookie = loop do
            random_token = SecureRandom.urlsafe_base64(nil, false)
            break random_token unless Requester.exists?(cookie: random_token)
        end
    end
    
    def set_count
        self.count = 1
    end
end
