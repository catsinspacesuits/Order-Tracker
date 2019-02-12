require 'rails_helper'

describe OrdersController, type: :controller do
  context 'GET #index' do
    it 'renders the index template' do
      get :index
      expect(response).to be_ok
      expect(response).to render_template('index')
    end
  end
 
  let(:order) { Order.create!(restaurant: 'test', start_point: '0.0, 0.0', 
  restaurant_location: '0.0, 0.0', customer_location: '0.0, 0.0', fee: '5.55', user_id: 1) }
  context 'GET #show' do
    it 'renders the show template' do
      get :show, params: { id: order.id }
      expect(response).to be_ok
      expect(response).to render_template('show')
    end
  end

end

