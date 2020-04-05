# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Tracking Link', type: :request do
  describe 'POST /api/tracking_links' do
    let(:json_response) { JSON.parse(response.body).deep_symbolize_keys }
    let(:params) do
      {
        message_id: "ABC123",
        email: email,
        recipient_email: recipient_email,
        subject: "blabla"
      }
    end
    let(:email) { "email1@gmail.com"} 
    let(:recipient_email) { "email2@gmail.com"} 
    let(:expected_tracking_link) { "http://www.example.com/api/tracked_actions/opened/ABC123" }

    context 'with existing user' do
      before do
        create(:user, email: email)
        post '/api/tracking_links', params: params
      end

      it 'returns tracking link' do
        expect(json_response[:data][:tracking_link]).to eq(expected_tracking_link)
      end

      it 'creates an appropriate tracking ling record' do
        expect(TrackingLink.last.user.email).to eq(email)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'with inexisting user' do
      before { post '/api/tracking_links', params: params }

      it 'returns tracking link' do
        expect(json_response[:data][:tracking_link]).to eq(expected_tracking_link)
      end

      it 'creates an appropriate tracking ling record' do
        expect(TrackingLink.last.user.email).to eq(email)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end
end
