class NeedsController < ApplicationController
  def index
    @charity = load_charity
    @needs = @charity.needs
  end

  def show
    @need = Need.find(params[:id])
  end

  def new
    @charity = load_charity
    @need = @charity.needs.new
  end

  def create
    @charity = load_charity
    @need = @charity.needs.new(need_params)
    if @need.save
      redirect_to @need
    else
      render :new
    end
  end

  def edit
    @need = Need.find(params[:id])
  end

  def update
    @need = Need.find(params[:id])
    if @need.update(need_params)
      redirect_to @need
    else
      render :edit
    end
  end

  def destroy
    @need = Need.find(params[:id])
    @need.destroy
    redirect_to [@need.charity, :needs]
  end

  private

  def need_params
    params.require(:need).permit(:skill, :time_amount, days: [])
  end

  def load_charity
    Charity.includes(:needs).approved.find(params[:charity_id])
  end
end
