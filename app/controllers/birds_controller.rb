class BirdsController < ApplicationController

  # POST /birds using strong params 
  def create
    bird = Bird.create(bird_params)
    render json: bird, status: :created
  end

  # Other controller actions below

  # GET /birds
  def index
    birds = Bird.all
    render json: birds
  end

  # # POST /birds
  # def create
  #   bird = Bird.create(name: params[:name], species: params[:species])
  #   render json: bird, status: :created
  # end

  # GET /birds/:id
  def show
    bird = Bird.find_by(id: params[:id])
    if bird
      render json: bird
    else
      render json: { error: "Bird not found" }, status: :not_found
    end
  end
  
  # private methods
  private

  def bird_params
    params.permit(:name, :species)
  end

end
