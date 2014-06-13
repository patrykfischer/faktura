require 'spec_helper.rb'
class FakeController < ApplicationController
  before_filter :require_login

  def index
    raise ActiveRecord::RecordNotFound
  end
end

describe FakeController do
  before do
    @user = User.create(username: 'Test', password: '12345',
              password_confirmation: '12345')
  end
  describe '#before_filter require_login' do
    context 'user has been logged' do
      before do
        session[:user_id] = @user.id
        get :index
      end
      it 'returns user from database' do
        expect(assigns(:user)).to eq(@user)
      end

      it 'renders json with 200 code' do
        expect(response.status).to eq(404)
      end
    end
  end

end
