require 'twilio-ruby'
require_relative 'read_insults'


class SendSMS
  def initialize(phone_number)
    @phone_number = phone_number
    @account_sid = 'ACa744d540c6279e687a7c3a0046852eb6'
    @auth_token = ENV['AUTH_TOKEN']
  end

  # Get your Account Sid and Auth Token from twilio.com/user/account
  def sendable
    "+1" + @phone_number
  end

  def just_the_digits
    @phone_number.scan(/\d/).join("")    
  end

  def valid?
    just_the_digits.length == 10 
  end

  def send_sms(shakes_insult)
    begin
    @client = Twilio::REST::Client.new @account_sid, @auth_token
     
    message = @client.account.messages.create(:body => shakes_insult,
        :to => "#{@phone_number}", # Replace with your phone number
        :from => "+14152026709")   # Replace with your Twilio number
    rescue Twilio::REST::RequestError => e
      return e.message
    end
    return message.sid
  end
end
