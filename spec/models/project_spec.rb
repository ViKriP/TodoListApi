require 'rails_helper'

RSpec.describe Project, type: :model do
  describe 'database columns' do
    it { is_expected.to have_db_column(:name).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }
    it { is_expected.to have_db_index(:user_id) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
  end

  context 'validations' do
    describe 'presence' do
      it { is_expected.to validate_presence_of(:name) }
    end
  end
end
