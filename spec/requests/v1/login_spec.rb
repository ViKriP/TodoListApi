require 'rails_helper'

RSpec.describe 'LoginController', type: :request do
  include Docs::V1::Login::Api
  let(:user) { create(:user) }

  describe '#create' do
    include Docs::V1::Login::Create
    before { post api_v1_sign_in_path, params: params, as: :json }

    context 'success' do
      let(:params) { { email: user.email, password: user.password } }

      it 'when success login user', :dox do
        expect(response).to have_http_status 200
        expect(response).to match_response_schema('user')
      end
    end

    context 'failed' do
      let(:params){ nil }

      it 'when failed login user', :dox do
        expect(response).to have_http_status 401
      end
    end
  end

  describe '#destroy' do
    include Docs::V1::Login::Destroy
    include_context 'login user without project'
    let(:access_token) { { Authorization: "Bearer #{@session.login[:access]}" } }
    before { delete api_v1_sign_out_path, headers: access_token, as: :json }
    
    context 'success' do

      it 'when success destroy session', :dox do
        expect(response).to have_http_status 200
      end
    end

    context 'success' do
      let(:access_token) { nil }

      it 'when not authorized', :dox do
        expect(response).to have_http_status 401
      end
    end
  end
end
