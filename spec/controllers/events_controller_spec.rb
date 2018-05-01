require 'rails_helper'

RSpec.describe EventsController, type: :controller do

  describe 'GET#index' do
    let(:events) { FactoryBot.create_list(:event, 2) }
    before { get :index, params: {}, session: {} }
    it 'has a 200 status code' do
      expect(response).to have_http_status(:ok)
    end
    it 'assigns @events' do
      expect(assigns(:events)).to match_array events
    end
    it 'renders the :index template' do
      expect(response).to render_template :index
    end
  end

end
