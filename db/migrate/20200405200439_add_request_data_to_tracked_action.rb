# frozen_string_literal: true

class AddRequestDataToTrackedAction < ActiveRecord::Migration[6.0]
  def change
    add_column :tracked_actions, :user_agent, :string
    add_column :tracked_actions, :client_ip_address, :string
  end
end
