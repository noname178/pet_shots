class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def show
    @articles = @user.articles
  end

  def edit
    if @user.pets.present?
      @pets = @user.pets
    else
      @pet = @user.pets.build
    end
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: 'プロフィールを編集しました。'
    else
      render :edit
    end
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:nickname, :profile, :avatar, pets_attributes: [:id, :name, :profile, :thumbnail, :_destroy])
    end
end
