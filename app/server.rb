
require 'sinatra'
require 'data_mapper'
require 'rack-flash'
require 'sinatra/partial'


require_relative 'data_mapper_setup'
require_relative 'helpers/application'

require_relative 'models/peep' 
require_relative 'models/user'

require_relative 'controllers/users'
require_relative 'controllers/sessions'
require_relative 'controllers/peeps'

enable :sessions

set :session_secret, 'super secret'
set :partial_template_engine, :erb
set :public_folder, Proc.new { File.join(root, "..", "/public") }

use Rack::Flash
use Rack::MethodOverride









