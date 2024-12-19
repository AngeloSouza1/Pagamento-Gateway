require 'rails_helper'

RSpec.describe PaymentsController, type: :controller do
  let(:valid_attributes) do
    {
      name: 'Angelo Souza',
      email: 'angelo@example.com',
      cpf: '12345678909',
      amount: 100.0,
      payment_method: 'pix'
    }
  end

  let(:invalid_attributes) do
    valid_attributes.merge(name: '', email: '')
  end

  describe 'GET #new' do
    it 'assigns a new payment as @payment' do
      get :new
      expect(assigns(:payment)).to be_a_new(Payment)
    end

    it 'renders the new template' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      before do
        allow_any_instance_of(MercadoPagoService).to receive(:create_payment).and_return(double('Response', code: 201, parsed_response: { 'id' => '123', 'status' => 'approved' }))
        allow_any_instance_of(MercadoPagoService).to receive(:handle_response).and_return({ success: true, status: 'approved', transaction_id: '123', boleto_link: nil, ticket_url: nil })
      end

      it 'creates a new payment' do
        expect {
          post :create, params: { payment: valid_attributes }
        }.to change(Payment, :count).by(1)
      end

      it 'redirects to the success page' do
        post :create, params: { payment: valid_attributes }
        expect(response).to redirect_to(success_payments_path)
      end
    end

    context 'with invalid attributes' do
      it 'does not create a new payment' do
        expect {
          post :create, params: { payment: invalid_attributes }
        }.not_to change(Payment, :count)
      end

      it 're-renders the new template' do
        post :create, params: { payment: invalid_attributes }
        expect(response).to render_template(:new)
      end
    end

    context 'when MercadoPagoService returns an error' do
      before do
        allow_any_instance_of(MercadoPagoService).to receive(:create_payment).and_return(double('Response', code: 400, parsed_response: { 'message' => 'Bad Request' }))
        allow_any_instance_of(MercadoPagoService).to receive(:handle_response).and_return({ success: false, error: 'Bad Request' })
      end

      it 'does not create a new payment' do
        expect {
          post :create, params: { payment: valid_attributes }
        }.not_to change(Payment, :count)
      end

      it 're-renders the new template with an error message' do
        post :create, params: { payment: valid_attributes }
        expect(response).to render_template(:new)
        expect(flash[:alert]).to eq('Falha no pagamento: Bad Request')
      end
    end
  end
end
