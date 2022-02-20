require 'rails_helper'

RSpec.describe "GET /api/v1/big_mac_indices", type: :request do
  it 'returns a list of all indexes' do
    create(:big_mac_index)
    create(:big_mac_index, :argentina)

    get '/api/v1/big_mac_indices'

    expect(response).to have_http_status(:ok)
    expect(JSON.parse(response.body).count).to eq(2)
  end
end
