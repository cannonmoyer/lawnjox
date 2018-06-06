class Quote < ApplicationRecord
  belongs_to :requester
  
  after_create :send_notification
  
  
  def send_notification
    notification = SendGridMailer.new()
    notification.send_notification
  
  end
end
