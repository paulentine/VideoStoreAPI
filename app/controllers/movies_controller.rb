class MoviesController < ApplicationController
  def index
    movies = Movie.all
    render json: movies.as_json(only: [:id, :title, :release_date]), status: :ok
  end

  def show
    movie = Movie.find_by(id: params[:id])
    if movie
      render json: movie.as_json(only: [:id, :title, :release_date, :available_inventory, :inventory, :overview]), status: :ok
    else
      render json: { errors: { movie: ["No movie by this id found"] } }, status: :not_found
    end
  end

  def create
    movie = Movie.new(movie_params)
    movie.available_inventory = movie.inventory
    if movie.save
      render json: { id: movie.id }, status: :ok
    else
      render json: { errors: movie.errors.messages },
        status: :bad_request
    end
  end

  private

  def movie_params
    params.permit(:title, :overview, :release_date, :inventory)
  end
end
