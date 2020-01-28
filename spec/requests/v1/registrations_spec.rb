RSpec.describe 'V1::Registrations', type: :request do
  include Docs::V1::Registrations::Api

  let(:email) { 'test1@gmail.com' }
  let(:password) { 'qwert123' }

  describe '#create' do
    include Docs::V1::Registrations::Create

    before { post api_v1_registration_path, params: params, as: :json }

    context 'success' do
      let(:params) { { email: email, password: password, password_confirmation: password } }

      it 'valid param', :dox do
        expect(response).to have_http_status 201
        expect(response).to match_response_schema('registration')
      end
    end

    context 'when failed registration user' do
      let(:params) { { email: email, password: password, password_confirmation: nil } }

      it 'invalid params', :dox do
        expect(response).to have_http_status 422
      end
    end
  end
end
