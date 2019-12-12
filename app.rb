require './environment'
require 'byebug'

module FormsLab
  class App < Sinatra::Base

    # code other routes/actions here
    get '/' do
      erb :root
    end

    get '/new' do
      erb :'pirates/new'
    end

    post '/pirates' do
      # byebug

      #NOT NEEDED?
      @pirate = Pirate.new(params[:pirate])
      
      params[:pirate][:ships].each do |details|
        Ship.new(details)
      end
      
      @ships = Ship.all

      erb :'pirates/show'
    end
  end
end
