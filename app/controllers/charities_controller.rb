# Controller for managing charities and their needs
class CharitiesController < ApplicationController
  def new
    @charity = Charity.new
  end

  def create
    @charity = Charity.new(charity_params)
    if @charity.save
      redirect_to charity_path
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
    @charity = Charity.find(params[:id])
  end

  def update
    @charity = Charity.find(params[:id])
    if @charity.update(charity_params)
      redirect_to charity_path
    else
      render :edit
    end
  end

  def destroy
    @charity = Charity.find(params[:id])
    @charity.destroy
    redirect_to charities_path
  end

  private

  def charity_params
    params.require(:charity).permit(:name, :postcode)
  end
end
