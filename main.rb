require "sinatra"
require "sinatra/reloader" if development?
require 'pg'

enable :sessions 

require_relative 'db/db'

require_relative 'models/question'
require_relative 'models/user'

require_relative 'helpers/sessions_helper'

require_relative 'controllers/questions_controller'
require_relative 'controllers/users_controller'
require_relative 'controllers/sessions_controller'


get '/' do
  redirect '/questions'
end






