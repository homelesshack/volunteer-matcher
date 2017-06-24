# Controller for managing charities and their needs
class CharitiesController < ApplicationController
  include EnsureNewAccount

  before_action :load_charity, only: [:show, :edit, :update, :destroy]
  before_action :authorize, only: [:edit, :update, :destroy]

  def new
    @charity = Charity.new
  end

  def create
    @charity = Charity.new(charity_params)
    @charity.account = current_account
    if @charity.save
      redirect_to root_path
    else
      render :new
    end
  end

  def index
    @charities = Charity.approved
  end

  def show
    @charity = Charity.approved.find(params[:id])
  end

  def edit
  end

  def update
    if @charity.update(charity_params)
      redirect_to @charity
    else
      render :edit
    end
  end

  def destroy
    @charity.destroy
    redirect_to charities_path
  end

  private

  def charity_params
    params.require(:charity).permit(:name, :postcode)
  end

  def load_charity
    @charity = Charity.approved.find(params[:id])
  end

  def authorize
    redirect_to root_path unless @Charity.account == current_account
  end
end
