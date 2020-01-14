require 'rails_helper'

RSpec.describe 'Application', type: :request do
  describe 'root path' do
    it 'render docs file' do
      get root_path

      expect(response).to have_http_status(200)
      expect(response).to render_template(file: 'v1.html')
    end
  end
end
