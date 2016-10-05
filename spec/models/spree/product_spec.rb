require 'spec_helper'

RSpec.describe Spree::Product, type: :model do
  describe 'Associations' do
    it { is_expected.to have_many :content_fragments }
  end
end
