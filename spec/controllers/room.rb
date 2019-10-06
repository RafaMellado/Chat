require 'rails_helper'

describe RoomsController, type: :controller do
    describe 'GET #index' do
        before :all do
            @user = create(:user)
            @rooms = create_list(:room, 5)
        end

        context 'respond with a valid JWT' do
            describe 'request' do
                before do
                    @request.headers['Authorization'] = JsonWebToken.encode(user_id: @user.id)
                    get :index
                end

                it 'return 200 http status code' do
                    expect(response).to have_http_status(200)
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
        end
    end
end