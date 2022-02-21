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

  describe 'GET /api/v1/big_mac_indices/:id' do
    it 'returns one specific index' do
      index = create(:big_mac_index)

      get "/api/v1/big_mac_indices/#{index.id}"

      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)['id']).to eq(index.id)
    end
  end

  describe 'POST /api/v1/big_mac_indices' do
    it 'creates a new index' do
      expect {
        post '/api/v1/big_mac_indices',
        params: { big_mac_index: attributes_for(:big_mac_index) }
      }.to change(BigMacIndex, :count).by(1)
    end
  end

  describe 'PATCH /api/v1/big_mac_indices/:id' do
    it 'Update a index' do
      index = create(:big_mac_index)

      patch "/api/v1/big_mac_indices/#{index.id}",
        params: { big_mac_index: { name: 'Brasil 2' } }

      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)['name']).to eq('Brasil 2')
    end
  end

  describe 'DELETE /api/v1/big_mac_indices/:id' do
    it 'Delete a index' do
      index = create(:big_mac_index)

      expect {
        delete "/api/v1/big_mac_indices/#{index.id}"
      }.to change(BigMacIndex, :count).by(-1)
    end
  end
end
