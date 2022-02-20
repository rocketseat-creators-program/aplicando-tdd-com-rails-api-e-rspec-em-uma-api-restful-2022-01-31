require 'rails_helper'

RSpec.describe "GET /api/v1/big_mac_indices", type: :request do
  it 'returns a list of all indexes' do
    create(:big_mac_index)
    create(:big_mac_index, :argentina)

    get '/api/v1/big_mac_indices'

    expect(response).to have_http_status(:ok)
    expect(JSON.parse(response.body).count).to eq(2)
  end

  describe 'GET /api/v1/big_mac_indices/latest' do
    it 'returns the latest data' do
      create(:big_mac_index, date: '2020-01-01')
      create(:big_mac_index, :argentina, date: '2022-01-01')
      
      get '/api/v1/big_mac_indices/latest'

      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body).count).to eq(1)
      expect(JSON.parse(response.body).first['date']).to eq('2022-01-01')
    end
  end
end
