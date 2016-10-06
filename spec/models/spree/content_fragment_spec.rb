require 'spec_helper'

RSpec.describe Spree::ContentFragment, type: :model do
  describe 'Associations' do
    it { is_expected.to belong_to :parent }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_presence_of :position }
  end

  describe 'Concerns' do
    it { is_expected.to have_attached_file :background_image }
    it 'acts_as_list' do
      expect(described_class).to respond_to :acts_as_list
    end
  end
end
