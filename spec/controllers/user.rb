require 'rails_helper'

describe UsersController, type: :controller do
    describe 'GET #index' do
        before :all do
            @users = create_list(:user, 5)
        end

        context 'always will do' do
            describe 'request' do
                before do
                    get :index
                end

                it 'return 200 http status code' do
                    expect(response).to have_http_status(200)
                end
            end
        end
    end
end