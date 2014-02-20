class NameCardsController < ApplicationController
  before_action :set_name_card, only: [:show, :edit, :update, :destroy]

  def index
    @name_cards = NameCard.all
  end

  def show
  end

  def new
    @name_card = NameCard.new
  end

  def create
    @name_card = NameCard.new(name_card_params)

    if @name_card.save
      redirect_to @name_card, notice: 'NameCard was successfully created.'
    else
      render action: 'new'
    end
  end

  def edit
  end

  def update
    if @name_card.update(name_card_params)
      redirect_to @name_card, notice: 'NameCard was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @name_card.destroy
    redirect_to name_cards_url
  end

  private

  def set_name_card
    @name_card = NameCard.find(parmas[:id])
  end

  def name_card_params
    params.require(:name_card).permit(:name, :address, :fax, :tel, :url)
  end

end
