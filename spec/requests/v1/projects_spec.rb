require 'rails_helper'

RSpec.describe 'Projects', type: :request do
  include Docs::V1::Projects::Api

  let(:user) { create(:user) }   
  let(:token) { JsonWebToken.encode(user_id: user.id) }
  let(:headers) { { authorization: token, accept: 'application/json' } }

  describe 'POST #create' do
    include Docs::V1::Projects::Create

    context 'when success' do
      let(:project) { create(:project, user: user) }
      let(:params) { { project: attributes_for(:project) } }

      it 'creates a new project', :dox do
        expect { post api_v1_projects_path, headers: headers, params: params, as: :json }.to change(Project, :count).by(1)
        expect(response).to have_http_status :created
        expect(response).to match_response_schema('project')
      end
    end

    context 'when failed' do
      let(:params) { { project: { name: '' } } }
    
      before { post api_v1_projects_path, params: params, headers: headers, as: :json }

      it 'create project with wrong params', :dox do
        expect(user.projects).to be_empty
        expect(response).to have_http_status :unprocessable_entity
      end
    end
  end

  describe 'PUT #update' do
    include Docs::V1::Projects::Update

    let!(:project) { create(:project, user: user) }

    context 'when success' do
      let(:params) { { project: attributes_for(:project) } }

      it 'updates project', :dox do
        put api_v1_project_path(id: project.id), headers: headers, params: params, as: :json

        expect(response).to have_http_status :ok
        expect(response).to match_response_schema('project')
      end
    end

    context 'when failed' do
      let(:params) { { project: { name: '' } } }
    
      before { put api_v1_project_path(id: project.id), params: params, headers: headers, as: :json }

      it 'update project with wrong params', :dox do
        expect(response).to have_http_status :unprocessable_entity
      end
    end

    context "when project isn't autorizated" do
      let(:params) { { project: { name: 'test' } } }
    
      before { put api_v1_project_path(id: 0), params: params, headers: headers, as: :json }

      it 'project does not exist', :dox do
        expect(response).to have_http_status :unprocessable_entity
      end
    end
  end

  describe 'DELETE #destroy' do
    include Docs::V1::Projects::Destroy

    let!(:project) { create(:project, user: user) }

    context 'when success' do
      it 'deletes project', :dox do
        expect { delete api_v1_project_path(id: project.id), headers: headers, as: :json }.to change(Project, :count).by(-1)
        expect(response).to have_http_status :ok
      end
    end

    context 'when failed' do
      let(:params) { { project: attributes_for(:project) } }

      it 'error deleting project', :dox do
        allow_any_instance_of(Project).to receive(:destroy).and_return(false)
        delete api_v1_project_path(id: project.id), params: params, headers: headers, as: :json

        expect(response).to have_http_status :unprocessable_entity
      end
    end
  end
end
