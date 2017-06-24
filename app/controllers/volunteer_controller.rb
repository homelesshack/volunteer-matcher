class VolunteerController < ApplicationController
  def new
    @volunteer = Volunteer.new
  end
end
