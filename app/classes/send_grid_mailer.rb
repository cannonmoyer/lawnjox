require 'sendgrid-ruby'
include SendGrid

class SendGridMailer
    
   def initialize
       
   end
   
   
   def send_notification
      
        from = Email.new(email: 'quotes@lawnjox.com')
        to = Email.new(email: 'office@lawnjox.com')
        subject = 'Lawn Jox Quote Request'
        content = Content.new(type: 'text/plain', value: 'You have a new quote request. Please view the quote here: https://ancient-river-24085.herokuapp.com/')
        mail = Mail.new(from, subject, to, content)

        sg = SendGrid::API.new(api_key: "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")
        response = sg.client.mail._('send').post(request_body: mail.to_json)
        puts response.status_code
        
   end
    
end

