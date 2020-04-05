# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Tracked Action', type: :request do
  describe 'GET /api/tracked_actions/opened/:message_id' do
    let(:json_response) { JSON.parse(response.body).deep_symbolize_keys }

    context 'with existing tracking link' do
      before { get "/api/tracked_actions/opened/#{tracking_link.message_id}" }

      let(:tracking_link) { create(:tracking_link) }

      it 'returns tracked action' do
        tracked_action_params = {
          action: 'opened',
          user_agent: nil,
          client_ip_address: '127.0.0.1'
        }

        expect(json_response[:data][:tracked_action]).to include(tracked_action_params)
      end

      it 'creates an appropriate tracked action ling record' do
        expect(TrackedAction.last.tracking_link).to eq(tracking_link)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'with inexisting tracking link' do
      before { get '/api/tracked_actions/opened/bad-msg-id' }

      it 'returns error' do
        expect(json_response[:data][:error]).to match(/tracking link/)
      end

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end
    end
  end
end
