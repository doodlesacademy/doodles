class Admin::MembersController < ApplicationController
  before_action :authenticate_user!, :admin_only!
  before_action :set_member, only: [:show, :edit, :update, :destroy]
  layout "admin"

  # GET /admin/members
  def index
    @members = Member.all
  end

  # GET /admin/members/1
  def show
  end

  # GET /admin/members/new
  def new
    @member = Member.new
  end

  # GET /admin/members/1/edit
  def edit
  end

  # POST /admin/members
  def create
    @member = Member.new(member_params)
    if @member.save
      redirect_to action: :index, notice: 'Member was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /admin/members/1
  def update
    if @member.update(member_params)
      redirect_to admin_member_path(@member), notice: 'Member was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /admin/members/1
  def destroy
    @member.destroy
    redirect_to members_url, notice: 'Member was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member
      @member = Member.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def member_params
      params.require(:member).permit(:avatar, :baby_photo, :bio, :first_name, :last_name, :position, :role)
    end
end
