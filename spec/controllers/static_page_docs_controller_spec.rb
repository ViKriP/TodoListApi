require 'rails_helper'

RSpec.describe StaticPageDocsController, type: :controller do
  describe '#docs' do
    before { get :docs }

    it { expect(response).to have_http_status(:success) }
  end
end