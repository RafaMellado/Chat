require 'rails_helper'

describe Message, type: :model do
    describe 'Fields' do
        it { is_expected.to have_field(:text).of_type(String) }
    end

    describe 'Relations' do
        it { is_expected.to belong_to :user }
        it { is_expected.to belong_to :room }
    end
    
    describe 'Validations' do
        it { is_expected.to validate_presence_of(:text) }
        it { is_expected.to validate_length_of(:text).with_maximum(200) }
    end
end