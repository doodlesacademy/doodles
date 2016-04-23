class DonorsController < ApplicationController
  def index
    @donors = Donor.all
  end
end
