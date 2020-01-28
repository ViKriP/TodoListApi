RSpec.describe 'V1::Tasks', type: :request do
  include Docs::V1::Tasks::Api

  let(:user) { create(:user) }
  let(:token) { JsonWebToken.encode(user_id: user.id) }
  let(:headers) { { authorization: token, accept: 'application/json' } }

  describe 'POST #create' do
    include Docs::V1::Tasks::Create

    context 'when succes' do
      let(:project) { create(:project, user: user) }
      let(:task) { create(:task, project: project) }
      let(:params) { { task: attributes_for(:task).merge(project_id: project.id) } }
    
      it 'creates a new task', :dox do
        expect { post api_v1_project_tasks_path(project.id), headers: headers, params: params, as: :json }.to change(Task, :count).by(1)
        expect(response).to have_http_status :created
        expect(response).to match_response_schema('task')
      end
    end

    context 'when failed' do
      let(:project) { create(:project, user: user) }
      let(:params) { { name: '' } }

      before { post api_v1_project_tasks_path(project.id), params: params, headers: headers, as: :json }

      it 'create task with wrong params', :dox do
        expect(response).to have_http_status :unprocessable_entity
      end
    end
  end

  describe 'PUT  #update' do
    include Docs::V1::Tasks::Update

    context 'when success' do
      let(:project) { create(:project, user: user) }
      let(:task) { create(:task, project: project) }
      let(:params) { { task: attributes_for(:task).merge(project_id: project.id) } }

      it 'updates task', :dox do
        put api_v1_task_path(id: task.id), headers: headers, params: params, as: :json

        expect(response).to have_http_status :ok
        expect(response).to match_response_schema('task')
      end
    end

    context 'when failed' do
      let(:task) { create(:task) }
      let(:params) { { name: '' } }

      before { put api_v1_task_path(id: task.id), params: params, headers: headers, as: :json }

      it 'update task with wrong params', :dox do
        expect(response).to have_http_status :unprocessable_entity
      end
    end

    context "when task isn't autorizated" do
      let(:project) { create(:project, user: user) }
      let(:params) { { task: attributes_for(:task).merge(project_id: project.id) } }


      before { put api_v1_task_path(id: 0), params: params, headers: headers, as: :json }

      it 'task does not exist', :dox do
        expect(response).to have_http_status :unprocessable_entity
      end
    end

    context 'when task is moved' do
      let(:project) { create(:project, user: user) }
      let!(:tasks) { FactoryBot.create_list(:task, 3, project_id: project.id) }
      let(:task) { tasks[1] }
      let(:params_up) { { task: attributes_for(:task).merge(project_id: project.id), position: 'up' } }
      let(:params_down) { { task: attributes_for(:task).merge(project_id: project.id), position: 'down' } }

      it 'moved to up', :dox do
        put api_v1_task_path(id: task.id), headers: headers, params: params_up, as: :json

        expect(response).to have_http_status :ok
      end

      it 'moved to down', :dox do
        put api_v1_task_path(id: task.id), headers: headers, params: params_down, as: :json

        expect(response).to have_http_status :ok
      end
    end
  end

  describe 'DELETE #destroy' do
    include Docs::V1::Tasks::Destroy

    let(:project) { create(:project, user: user) }
    let(:task) { create(:task, project: project) }
    let(:params) { { task: attributes_for(:task).merge(project_id: project.id) } }

    context 'when success' do
      it 'deletes task', :dox do
        delete api_v1_task_path(id: task.id), headers: headers, params: params, as: :json

        expect(response).to have_http_status :ok
      end
    end

    context 'when failed' do
      it 'delete task with wrong params', :dox do
        allow_any_instance_of(Task).to receive(:destroy).and_return(false)
        delete api_v1_task_path(id: task.id), headers: headers, params: params, as: :json

        expect(response).to have_http_status :unprocessable_entity
      end
    end
  end
end
