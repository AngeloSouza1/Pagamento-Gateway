require 'rails_helper'

RSpec.describe Admin::PaymentsController, type: :controller do
  let(:admin) { create(:admin) }
  let!(:payments) { create_list(:payment, 3) }

  before do
    sign_in admin
  end

  describe 'GET #index' do
    it 'assigns @payments and renders the index template' do
      get :index
      expect(assigns(:payments)).to match_array(payments)
      expect(response).to render_template(:index)
    end
  end
end
