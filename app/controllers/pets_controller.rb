class PetsController < ApplicationController
  before_action :set_user, only: [:index, :create, :new, :mypet]
  before_action :set_pets, only: [:destory]

  def index
    @pets = @user.pets.order(created_at: :desc)
  end

  def destroy
    @pet.destroy
  end

  def mypet
    @pets = @user.pets.order(created_at: :desc)
  end

  private

    def set_user
      @user = User.find(params[:user_id])
    end

    def set_pet
      @pet = Pet.find(params[:id])
    end
end
