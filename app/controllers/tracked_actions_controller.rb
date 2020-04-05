# frozen_string_literal: true

class TrackedActionsController < ApplicationController
  include Helpers::Response

  def opened
    tracking_link = TrackingLink.find_by(message_id: params[:message_id])

    if tracking_link
      tracked_action = TrackedAction.new(tracked_action_params(tracking_link.id))
      if tracked_action.save
        json_response(data: { tracked_action: tracked_action })
      else
        json_response({ data: { error: "Couldn't create tracking action." } }, :not_found)
      end
    else
      json_response({ data: { error: "Couldn't find tracking link." } }, :not_found)
    end
  end

  private

  def tracked_action_params(tracking_link_id)
    {
      action: 'opened',
      user_agent: request.user_agent,
      client_ip_address: request.remote_ip,
      tracking_link_id: tracking_link_id
    }
  end
end
