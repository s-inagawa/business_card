class UsersController < ApplicationController
  before_action :set_company, :set_group
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = @group.users
  end

  def show
  end

  def new
    @user = @group.users.new
  end

  def create
    @user = @group.users.new(user_params)

    if @user.save
      redirect_to [@company, @group, @user], notice: 'User was successfully created.'
    else
      render action: 'new'
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to [@company, @group, @user], notice: 'User was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @user.destroy
    redirect_to company_group_users_path(@company, @group)
  end

  private

  def user_params
    params.require(:user).permit(:name, :mail, :tel)
  end

end
