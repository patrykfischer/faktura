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

    it 'check number of user' do
      count = User.count
      user = User.new(username: 'asdf', password_confirmation: 'qwer', password: 'qwer')
      expect(user.save).to eql(true)
      expect(User.count).to eql(count+1)
    end

  end
end
