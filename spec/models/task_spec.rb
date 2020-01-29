require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'database columns' do
    it { is_expected.to have_db_column(:name).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:deadline).of_type(:datetime) }
    it { is_expected.to have_db_column(:position).of_type(:integer) }
    it { is_expected.to have_db_column(:completed).of_type(:boolean).with_options(null: false, default: false) }
    it { is_expected.to have_db_index(:project_id) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:project) }
  end

  context 'validations' do
    describe 'presence' do
      it { is_expected.to validate_presence_of(:name) }
    end
  end
end
