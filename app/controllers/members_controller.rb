class MembersController < ApplicationController
  def index
    @board_members = Member.where( role: Member.roles[:board] ).order(:last_name)
    @volunteer_members = Member.where( role: Member.roles[:volunteer] ).order(:last_name)
  end
end
