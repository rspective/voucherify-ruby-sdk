require 'spec_helper'
require 'rest-client'

describe 'Async actions API' do

  let(:application_id) { 'application_id' }
  let(:client_secret_key) { 'client_secret_key' }
  let(:voucherify) { Voucherify::Client.new({:applicationId => application_id, :clientSecretKey => client_secret_key}) }
  let(:headers) { {
      'X-App-Id' => application_id,
      'X-App-Token' => client_secret_key,
      'X-Voucherify-Channel' => 'Ruby-SDK',
      :accept => 'application/json'
  } }

  let(:id) { 'test-id' }

  it 'should get async action by id' do
    stub_request(:get, "https://api.voucherify.io/v1/async-actions/#{id}")
        .with(body: {}, headers: headers)
        .to_return(:status => 200, :body => '{}', :headers => {})

    voucherify.async_actions.get(id)
  end

  it 'should list async actions' do
    query = {
        :limit => 10,
        :end_date => '2021-07-16T13:58:45Z'
    }

    stub_request(:get, "https://api.voucherify.io/v1/async-actions?limit=#{query[:limit]}&end_date=#{query[:end_date]}")
        .with(body: {}, headers: headers)
        .to_return(:status => 200, :body => '[]', :headers => {})

    voucherify.async_actions.list query
  end

end
