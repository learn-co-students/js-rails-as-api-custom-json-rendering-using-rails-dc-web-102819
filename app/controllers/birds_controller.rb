class BirdsController < ApplicationController
  def index
    birds = Bird.all
    render json: birds
  end

  def show
    bird = Bird.find_by(id: params[:id])
    if bird
      render json: birds, only: [:id, :name, :species] #or you could use except: [:created_at, updated_at] to exclude those keys
    else
      render json: {messages: 'Bird not found'} #renders a message if there is an error due to invalid endpoint
    end
    
  end

end