require 'spec_helper'

describe UsersController do
  describe '#create user' do
    let!(:user){create(:user)}
    before do
      session[:user_id] = user.id
    end

    it 'returns 200 code' do
      expect(response.status).to eq(200)
    end

    it "check created last user" do
      expect(User.last).to eq(user)
    end

    it "check right session[user_id]" do
      expect(User.last.id).to eq(session[:user_id])
    end
  end
  describe 'POST #create' do
    it 'create new user' do
      expect { post :create, user: create(:user).attributes }.to change(User, :count).by(1)
    end
  end
end
