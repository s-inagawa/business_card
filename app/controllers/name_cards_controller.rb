class NameCardsController < ApplicationController
  before_action :set_company, :set_group, :set_user
  before_action :set_name_card, only: [:show, :edit, :update, :destroy]

  def index
    @name_cards = @user.name_cards
  end

  def show
  end

  def new
    @name_card = @user.name_cards.new
  end

  def create
    @name_card = @user.name_cards.new(name_card_params)

    if @name_card.save
      redirect_to [@company, @group, @user, @name_card], notice: 'NameCard was successfully created.'
    else
      render action: 'new'
    end
  end

  def edit
  end

  def update
    if @name_card.update(name_card_params)
      redirect_to [@company, @group, @user, @name_card], notice: 'NameCard was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @name_card.destroy
    redirect_to company_group_user_name_cards_path
  end

  private

  def set_name_card
    @name_card = @user.name_cards.find(params[:id])
  end

  def name_card_params
    params.require(:name_card).permit(:name, :address, :fax, :tel, :url)
  end

end
