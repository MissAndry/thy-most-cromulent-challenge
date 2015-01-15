get '/' do
  erb :index
end

get '/insults/create' do
  @shakes = Parser.new('app/helpers/shakespearean-insults.txt').generate_insult
  @insult = Insult.find_or_create_by(text: @shakes)
  erb :_insult, layout: false
end

post '/insults/:insult_id/send' do
  @insult = Insult.find(params[:insult_id])
  SendSMS.new(@insult.text).send_sms
  erb :_thanks, layout: false
end