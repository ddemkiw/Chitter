get '/' do
  @peeps = Peep.all
  erb :index
end

post '/peeps' do
  text = params["text"]
  @username = current_user.username if current_user
  Peep.create(:user_id => current_user.id, :text => text, :timestamp => Time.now)
  redirect to('/')
end


