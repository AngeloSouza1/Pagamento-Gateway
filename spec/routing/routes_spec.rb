require 'rails_helper'

RSpec.describe 'Routes', type: :routing do
  it 'routes /payments/new to payments#new' do
    expect(get: '/payments/new').to route_to('payments#new')
  end

  it 'routes /admin/payments to admin/payments#index' do
    expect(get: '/admin/payments').to route_to('admin/payments#index')
  end
end
