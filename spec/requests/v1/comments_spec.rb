require 'rails_helper'

RSpec.describe 'V1::Comments', type: :request do
  include Docs::V1::Comments::Api

  let(:user) { create(:user) }

  let(:token) { JsonWebToken.encode(user_id: user.id) }
  let(:headers) { { authorization: token, accept: 'application/json' } }

  let(:project) { create(:project, user_id: user.id) }
  let(:task) { create(:task, project_id: project.id) }

  describe 'POST #create' do
    include Docs::V1::Comments::Create

    context 'when success' do
      let(:params) { { comment: { text: FFaker::Lorem.characters(11), task_id: task.id } } }

      it 'create comment', :dox do
        expect { post api_v1_task_comments_path(task.id),
                 headers: headers,
                 params: params,
                 as: :json }.to change(Comment, :count).by(1)

        expect(response).to be_created
        expect(response).to match_response_schema('comment')
      end
    end

    context 'when create with file' do
      let(:params) { { comment: { text: FFaker::Lorem.characters(11),
                                  attachment: fixture_file_upload('rg.png'),
                                  task_id: task.id } } }

      before { post api_v1_task_comments_path(task.id), headers: headers, params: params }

      it 'create comment' do
        expect(response).to be_created
        expect(response).to match_response_schema('comment')
      end
    end

    context 'when failed' do
      let(:params) { { text: '' } }

      before { post api_v1_task_comments_path(task.id), headers: headers, params: params, as: :json }

      it 'not create comment', :dox do
        expect(response).to have_http_status :unprocessable_entity
        expect { response }.not_to change(Comment, :count)
      end
    end
  end

  describe 'DELETE #destroy' do
    include Docs::V1::Comments::Destroy

    let!(:comment) { create(:comment, task_id: task.id) }

    context 'when success destroy comment' do
      it 'destroy comment', :dox do
        delete api_v1_comment_path(id: comment.id), headers: headers, as: :json

        expect(response).to have_http_status :ok
      end
    end

    context 'when failed destroy comment' do
      let!(:comment) { create(:comment, task_id: task.id) }

      it 'not destroy comment', :dox do
        allow_any_instance_of(Comment).to receive(:destroy).and_return(false)
        delete api_v1_comment_path(id: comment.id), headers: headers, as: :json

        expect(response).to have_http_status :unprocessable_entity
      end
    end
  end
end
