# Controller for managing charities and their needs
class CharitiesController < ApplicationController
  def new
  end

  def create
  end

  def index
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def charity_params
    params.require(:charity).permit(
      :name,
      :postcode,
      need_attributes: %i[
        id
        time_amount
        skill
        days
      ]
    )
  end
end
