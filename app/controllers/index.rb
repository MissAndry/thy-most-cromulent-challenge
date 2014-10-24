get '/' do
  erb :index
end

get '/generate-insult' do
  @shakes = Parser.new('app/helpers/shakespearean-insults.txt').generate_insult
  @insult = Insult.find_or_create_by(text: @shakes)
  erb :_insult, layout: false
end

post '/send-insult/:insult_id' do
  @insult = Insult.find(params[:insult_id])
  SendSMS.new(@insult.text).send_sms
  erb :_thanks, layout: false
end