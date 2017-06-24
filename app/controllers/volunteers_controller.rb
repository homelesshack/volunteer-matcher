class VolunteersController < ApplicationController
  include EnsureNewAccount

  before_action :set_volunteer, only: [:show, :edit, :update, :destroy]
  before_action :authorize, only: [:edit, :update, :destroy]

  def index
    @volunteers = Volunteer.all
  end

  def show
  end

  def new
    @volunteer = Volunteer.new
  end

  def edit
  end

  def create
    @volunteer = Volunteer.new(volunteer_params)
    @volunteer.account = current_account
    if @volunteer.save
      redirect_to @volunteer, notice: 'Volunteer was successfully created.'
    else
      render :new
    end
  end

  def update
    if @volunteer.update(volunteer_params)
      redirect_to @volunteer, notice: 'Volunteer was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @volunteer.destroy
    redirect_to volunteers_url, notice: 'Volunteer was successfully destroyed.'
  end

  private

  def set_volunteer
    @volunteer = Volunteer.find(params[:id])
  end

  def authorize
    redirect_to root_path unless @volunteer.account == current_account
  end

  def volunteer_params
    params.require(:volunteer).permit(
      :name,
      :hours_per_week,
      :postcode,
      :miles_from,
      :dbs_checked,
      days_available: [],
      skills: []
    )
  end
end
