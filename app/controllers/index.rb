get '/' do
  erb :index
end

get '/insults/create' do
  puts params
  @shakes = Parser.new('app/helpers/shakespearean-insults.txt').generate_insult
  @insult = Insult.find_or_create_by(text: @shakes)
  erb :_insult, layout: false
end

post '/insults/:insult_id/send' do
  insult = Insult.find(params[:insult_id])
  sms = SendSMS.new(params[:phoneNumber])

  if sms.valid?
    sms.send_sms(insult.text)
    erb :_thanks, layout: false
  else
    erb :_aint_no_phone, layout: false
  end

end