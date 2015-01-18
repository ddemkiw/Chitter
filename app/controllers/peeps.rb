get '/' do
  @peeps = Peep.all
  erb :index
end

get '/peeps/new' do
  erb :"links/new" 
end

post '/peeps' do
  text = params["text"]
  Peep.create(:user_id => current_user.id, :text => text, :timestamp => Time.now)
  @username = current_user.username if current_user
  redirect to('/')
end



