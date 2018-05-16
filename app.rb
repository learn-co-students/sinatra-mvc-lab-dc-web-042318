require_relative 'config/environment'

class App < Sinatra::Base
  get '/' do
    erb :user_input
  end

  post '/piglatinizer' do
    # binding.pry
    @translate = PigLatinizer.new(params['text_input'])
    erb :result
  end

  get '/piglatinizer' do
    erb :result
  end
end