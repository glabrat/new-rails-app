require 'rails_helper'

RSpec.describe "Heros", type: :request do

  let!(:heros) { create_list(:hero, 10)}
  let(:hero_id) { heros.first.id }

  describe "GET /heros" do

    before { get '/heros'}

    it 'return heros' do
      expect(json).not_to be_empty
      expect(json["data"].count).to eq(10)
    end

    it "works! (now write some real specs)" do
      get heros_path
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for POST /heros
  describe 'POST /heros' do

    let(:valid_attributes) { { hero: { name: 'Protón', status: 'inactive' } } }

    context 'when the request is valid' do
      before { post '/heros', params: valid_attributes }

      it 'creates a hero' do
        expect(json["data"]["attributes"]["name"]).to eq('Protón')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do

      let(:valid_attributes) { { hero: { status: 'inactive' } } }

      before { post '/heros', params: valid_attributes }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body.to_s)
          .to match(/name/)
      end
    end
  end

  # Test suite for PUT /heros/:id
  describe 'PUT /heros/:id' do
    let(:valid_attributes) { { hero: { name: 'Shopping-man' } } }

    context 'when the record exists' do
      before { put "/heros/#{hero_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /heros/:id
  describe 'DELETE /heros/:id' do
    before { delete "/heros/#{hero_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
