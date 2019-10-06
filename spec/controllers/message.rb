require 'rails_helper'

describe MessagesController, type: :controller do
    describe 'GET #index' do
        before :all do
            @user = create(:user)
            @room = create(:room)
            @messages = create_list(:message, 10)
        end

        context 'respond with a valid JWT' do
            before do
                @request.headers['Authorization'] = JsonWebToken.encode(user_id: @user.id)
            end

            describe 'request' do
                before do
                    get :index
                end

                it 'return 200 http status code' do
                    expect(response).to have_http_status(200)
                end
            end

            describe 'request post create' do
                let(:params) { attributes_for :message }

                before do
                    post :create, params: {message: params}
                end          

                it 'create a resource' do
                    expect(response).to have_http_status(201)
                end
            end
        end

        context 'not respond with a valid JWT' do
            describe 'request' do
                before do 
                    get :index
                end

                it 'return 401 http status code' do
                    expect(response).to have_http_status(401)
                end
            end

            describe 'request post create' do
                let(:params) { attributes_for :message }

                before do
                    post :create, params: {message: params}
                end          

                it 'create a resource' do
                    expect(response).to have_http_status(401)
                end
            end
        end
    end
end