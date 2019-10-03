require 'rails_helper'

describe User, type: :model do
    describe 'Fields' do
        it { is_expected.to have_field(:name).of_type(String) }
    end

    describe 'Relations' do
        it { is_expected.to have_many :messages }
    end
    
    describe 'Validations' do
        it { is_expected.to validate_presence_of(:name) }
        it { is_expected.to validate_uniqueness_of(:name) }
        it { is_expected.to validate_length_of(:name).with_minimum(4) }
        it { is_expected.to validate_length_of(:name).with_maximum(40) }
    end
end