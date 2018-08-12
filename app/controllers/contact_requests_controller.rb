class ContactRequestsController < ApplicationController
  def new
    @contact_request = ContactRequest.new
  end

  def create
    @contact_request = ContactRequest.new(contact_request_params)
    if @contact_request.save
      render 'thanks'
    else
      render 'new', status: :unprocessable_entity, contact_request: @contact_request
    end
  end

  private

  def contact_request_params
    params.require(:contact_request).permit(
      :email_address, :first_name, :last_name, :location,
      :involvement, :message, :subscribe
    )
  end
end
