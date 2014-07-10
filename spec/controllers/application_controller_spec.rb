require 'spec_helper'
class FakeController < ApplicationController
end

describe FakeController do
  controller do
    before_filter :require_login

    def index
      render text: 'Test'
    end
  end

  describe '#before_filter' do
    context 'unlogged user' do
      before {get :index}

      it 'redirects unlogged user to login page' do
        expect(response).to redirect_to(new_session_path)
      end
    end
    context 'logged user' do
      let!(:user) {create(:user)}
      before do
        session[:user_id] = user.id
        get :index
      end

      it 'renders valid text' do
        expect(response.body).to eq('Test')
      end

      it 'returns 200 code' do
        expect(response.status).to eq(200)
      end
    end
  end
end
