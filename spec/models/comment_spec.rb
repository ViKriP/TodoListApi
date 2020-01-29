require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'database columns' do
    it { is_expected.to have_db_column(:text).of_type(:text).with_options(null: false) }
    it { is_expected.to have_db_column(:attachment).of_type(:string) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }
    it { is_expected.to have_db_index(:task_id) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:task) }
  end

  context 'validations' do
    describe 'presence' do
      it { is_expected.to validate_presence_of(:text) }
    end

    describe 'length' do
      let(:text) { Comment::SIZE[:text] }

      it { is_expected.to validate_length_of(:text).is_at_least(text.min).is_at_most(text.max) }
    end
  end
end
