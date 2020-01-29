require 'rails_helper'

RSpec.describe StaticPageDocsController, type: :controller do
  describe '#docs' do
    before { get :docs }

    it 'when rendered docs' do 
      expect(response).to render_template(file: "#{Rails.root}/public/docs/v1.html")
      expect(response).to have_http_status(:success)
    end
  end
end