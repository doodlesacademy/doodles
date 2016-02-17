class MembersController < ApplicationController
  def index
    @members = Member.all
    @board_members = Member.where( role: Member.roles[:board] )
    @volunteer_members = Member.where( role: Member.roles[:volunteer] )
  end
end
