require 'twilio-ruby'

require_relative 'elizabethan_parser'


class SendSMS
# shakes = Pangloss.new("http://www.pangloss.com/seidel/shake_rule.html")
  def initialize(shakes_insult)
    @shakes_insult = shakes_insult
    @account_sid = 'ACa744d540c6279e687a7c3a0046852eb6'
    @auth_token = ENV['AUTH_TOKEN']
  end
# Get your Account Sid and Auth Token from twilio.com/user/account


  def send_sms
    begin
    @client = Twilio::REST::Client.new @account_sid, @auth_token
     
    message = @client.account.messages.create(:body => shakes_insult,
        :to => "+15106849426",     # Replace with your phone number
        :from => "+14152026709")   # Replace with your Twilio number
    rescue Twilio::REST::RequestError => e
      return e.message
    end
    return message.sid
  end
end