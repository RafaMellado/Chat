require 'rails_helper'

describe UsersController, type: :controller do
    describe 'GET #index' do
        before :all do
            @users = create_list(:user, 3)
        end

        context 'always will do' do
            describe 'request index' do
                before do
                    get :index
                end

                it 'return 200 http status code' do
                    expect(response).to have_http_status(200)
                end
            end
        end
    end

    
    describe 'request post create' do
        let(:attributes) { attributes_for(:user) }
  
        before do
            post :create, params: {user: attributes}
        end          

        it 'create a resource' do
            expect(response).to have_http_status(201)
        end
    end
end