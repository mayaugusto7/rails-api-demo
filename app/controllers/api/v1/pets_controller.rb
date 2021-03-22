class Api::V1::PetsController < ApplicationController
  include ActionController::HttpAuthentication::Token::ControllerMethods

  before_action :set_pet, only: %i[show edit update destroy]
  before_action :authenticate, only: %i[create destroy]

  api :GET, '/pets', 'Lista todos os pets'
  def index
    @pets = Pet.all
    render json: @pets
  end

  api :GET, '/pets/:id', 'Exibe os dados do Pet pelo ID'
  param :id, :number, desc: 'id do Pet'
  def show
    render json: @pet
  end

  def new
  end

  def edit
  end

  def create
    @pet = Pet.new(pet_params)
    if @pet.save
      render json: @pet, status: :created, location: @pet
    else
      render json: @pet.errors, status: :unprocessable_entity
    end
  end

  def update
    if @pet.update(pet_params)
      render json: @pet
    else
      render json: @pet.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @pet
      @pet.destroy
    else
      render json: { pet: "not found" }, status: :not_found
    end
  end

  private

  def authenticate
    authenticate_or_request_with_http_token do |token, options|
      @user = User.find_by(token: token)
    end
  end

  def set_pet
    @pet = Pet.find(params[:id])
  end

  def pet_params
    params.require(:pet).permit(:name, :kind)
  end
end
