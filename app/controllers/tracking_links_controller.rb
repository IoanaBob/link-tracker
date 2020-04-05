class TrackingLinksController < ApplicationController
  include Helpers::Response

  def create
    user = User.where(email: params[:email]).first_or_create 
    tracking_link = TrackingLink.new(tracking_link_params.merge(user_id: user.id)) 

    if tracking_link.save
      tracking_link_path = "#{request.base_url}#{tracked_action_opened_path(message_id: params[:message_id])}"
      json_response(data: { tracking_link: tracking_link_path } )
    else
      json_response({data: { error: "Couldn't create tracking link. Please try again." }}, :not_found)
    end
  end

  private

  def tracking_link_params   
    params.permit(:message_id, :recipient_email, :subject, :user_id)   
  end
end
