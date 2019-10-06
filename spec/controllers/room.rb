require 'rails_helper'

describe RoomsController, type: :controller do
    before :all do
        @user = create(:user)
        @rooms = create_list(:room, 5)
        @messages = create_list(:message, 5)
    end
    describe 'requests' do
        context 'respond with a valid JWT' do
            before do
                @request.headers['Authorization'] = JsonWebToken.encode(user_id: @user.id)
            end
            describe 'request index' do
                before do
                    get :index
                end

                it 'return 200 http status code' do
                    expect(response).to have_http_status(200)
                end
            end

            describe 'request post create' do
                let(:params) { attributes_for :room }

                before do
                    post :create, params: {room: params}
                end          

                it 'create a resource' do
                    expect(response).to have_http_status(201)
                end
            end
        end

        context 'not respond with a valid JWT' do
            describe 'request index' do
                before do 
                    get :index
                end

                it 'return 401 http status code' do
                    expect(response).to have_http_status(401)
                end
            end

            describe 'request post create' do
                let(:params) { attributes_for :room }

                before do
                    post :create, params: {room: params}
                end          

                it 'create a resource' do
                    expect(response).to have_http_status(401)
                end
            end
        end
    end
end