require 'rails_helper'

RSpec.describe 'User Login Endpoint', type: :request do
  it 'can login a user' do
    body = {
      "email": "whatever@example.com",
      "password": "password"
    }

    headers = {
      'Content-Type' => 'application/json',
      'Accept' => 'application/json'
    }

    User.create!(body)
    post '/api/v1/sessions', headers: headers, params: body.to_json

    expect(response).to be_successful

    user = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(user).to have_key(:id)
    expect(user[:id]).to be_a String
    expect(user).to have_key(:type)
    expect(user[:type]).to eq('user')
    expect(user).to have_key(:attributes)
    expect(user[:attributes]).to be_a(Hash)

    attributes = user[:attributes]

    expect(attributes).to have_key(:email)
    expect(attributes[:email]).to be_a(String)
    expect(attributes).to have_key(:api_key)
    expect(attributes[:api_key]).to be_a(String)
  end
  it "Won't create a session with a bad email" do
    user_params = {
      "email": "test@",
      "password": "password",
    }
    headers = {"CONTENT_TYPE" => "application/json", "ACCEPT" => "application/json"}
    post "/api/v1/sessions", headers: headers, params: user_params.to_json

    error = JSON.parse(response.body, symbolize_names:true)
    error_message = "invalid credentials"

    expect(response).to have_http_status(:bad_request)
    expect(error).to have_key(:error)
    expect(error[:error]).to eq("#{error_message}")
  end

  it "Won't create a new session with missing email" do
    user_params = {
      "password": "password",
    }
    headers = {"CONTENT_TYPE" => "application/json", "ACCEPT" => "application/json"}
    post "/api/v1/sessions", headers: headers, params: user_params.to_json

    error = JSON.parse(response.body, symbolize_names:true)
    error_message = "invalid credentials"

    expect(response).to have_http_status(:bad_request)
    expect(error).to have_key(:error)
    expect(error[:error]).to eq("#{error_message}")
  end

  it "Won't create a new session with missing password" do
    user_params = ({
      "email": "whatever@example.com"
    })

    headers = {"CONTENT_TYPE" => "application/json", "ACCEPT" => "application/json"}
    post "/api/v1/sessions", headers: headers, params: user_params.to_json

    error = JSON.parse(response.body, symbolize_names:true)
    error_message = "invalid credentials"

    expect(response).to have_http_status(:bad_request)
    expect(error).to have_key(:error)
    expect(error[:error]).to eq("#{error_message}")
  end

  it "Won't create a new session with the wrong email and password" do
    user_params = ({
      "email": "whatever@example.com",
      "password": "test_password"
    })

    headers = {"CONTENT_TYPE" => "application/json", "ACCEPT" => "application/json"}
    post "/api/v1/sessions", headers: headers, params: user_params.to_json

    error = JSON.parse(response.body, symbolize_names:true)
    error_message = "invalid credentials"

    expect(response).to have_http_status(:bad_request)
    expect(error).to have_key(:error)
    expect(error[:error]).to eq("#{error_message}")
  end

  it "won't create a new session with no request body" do
    headers = {"CONTENT_TYPE" => "application/json", "ACCEPT" => "application/json"}
    post "/api/v1/sessions", headers: headers

    error = JSON.parse(response.body, symbolize_names:true)
    error_message = "invalid credentials"

    expect(response).to have_http_status(400)
    expect(error).to have_key(:error)
    expect(error[:error]).to eq("#{error_message}")
  end
end
