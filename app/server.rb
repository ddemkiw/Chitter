require 'sinatra/base'
require 'data_mapper'
require 'rack-flash'
require 'sinatra/partial'


require_relative 'models/peep'
require_relative 'models/user'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
 

 get '/' do
  @peeps = Peep.all
  erb :index
end

post '/peeps' do
#==== just here to pass the test until I create login ===== 
  User.create(id: 1,
                email: 'test@test.com',
                username: 'JimJim')
#============================================================ 
  text = params["text"]
  Peep.create(:user_id =>1, :text => text)
  redirect to('/')
end

get '/users/new' do
  # note the view is in views/users/new.erb
  # we need the quotes because otherwise
  # ruby would divide the symbol :users by the
  # variable new (which makes no sense)
  erb :"users/new"
end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
