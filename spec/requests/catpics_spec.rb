require 'rails_helper'

RSpec.describe 'Catpics API', type: :request do

  let!(:catpic) { Catpic.create!(image: Rack::Test::UploadedFile.new("#{Rails.root}/test_pic/test_pic.jpg")) }
  let(:catpic_id) { catpic.id }

  describe 'GET /catpics' do
    before { get '/catpics' }

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end

    it 'returns catpics' do
      json = JSON.parse(response.body)
      expect(json).not_to be_empty
      expect(json.size).to eq(1)
    end

  end

  describe 'GET /catpics/:id' do
    before { get "/catpics/#{catpic_id}" }

    context 'when the record exists' do

      it 'returns the catpic' do
        json = JSON.parse(response.body)
        expect(json).not_to be_empty
        expect(json['id']).to eq(catpic_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

    end

    context 'when the record does not exist' do
      let(:catpic_id) { 999 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it "returns 'Couldn't find Catpic with id'" do
        expect(response.body).to match(/Couldn't find Catpic/)
      end

    end

  end

  describe 'POST /catpics' do

    let(:valid_attributes) { { image: Rack::Test::UploadedFile.new("#{Rails.root}/test_pic/test_pic.jpg") } }

    context 'when the request is valid' do
      before { post '/catpics', params: valid_attributes }

      it 'creates a catpic' do
        json = JSON.parse(response.body)
        expect(json['image']['url']).to match(/test_pic.jpg/)
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end

    end

    context 'when the request is invalid' do
      before { post '/catpics', params: { image: 'notavalidimage' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body).to match(/Validation failed: Image can't be blank/)
      end

    end

  end

  describe 'PUT /catpics/:id' do
    
    let(:valid_attributes) { { image: Rack::Test::UploadedFile.new("#{Rails.root}/test_pic/test_pic.jpg") } }

    context 'when the record exists' do
      before { put "/catpics/#{catpic_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

    end

  end

  describe 'DELETE /catpics/:id' do
    before { delete "/catpics/#{catpic_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end

  end

end