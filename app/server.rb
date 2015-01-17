
require 'sinatra/base'
require 'data_mapper'
require 'rack-flash'

require './app/models/peep' 
require './app/models/user'

require_relative 'data_mapper_setup'
require_relative 'helpers/application'

class Chitter < Sinatra::Base

  include Helpers

enable :sessions
set :session_secret, 'super secret'

use Rack::Flash
use Rack::MethodOverride
 

get '/' do
  @peeps = Peep.all
  erb :index
end


get '/users/new' do
  @user = User.new
  erb :"users/new"
end

post '/users' do
  @user = User.create( :name => params[:name],
                      :username => params[:username],
                      :email => params[:email],
                      :password => params[:password],
                      :password_confirmation => params[:password_confirmation])
  if @user.save
    session[:user_id] = @user.id
    redirect to('/')
  else
    flash[:notice] = "Sorry, your passwords don't match"
    erb :"users/new"
  end
end

# post '/peeps' do
#   text = params["text"]
#   Peep.create(:user_id =>1, :text => text)
#   redirect to('/')
# end

  # start the server if ruby file executed directly
  run! if app_file == $0
end

