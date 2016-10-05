require 'spec_helper'

RSpec.describe Spree::ContentFragment, type: :model do
  describe 'Associations' do
    it { is_expected.to belong_to :parent }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_presence_of :position }
  end
end
