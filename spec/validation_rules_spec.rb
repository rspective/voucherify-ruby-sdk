require 'spec_helper'
require 'rest-client'

describe 'Validation Rules API' do

  let(:application_id) { 'application_id' }
  let(:client_secret_key) { 'client_secret_key' }

  let(:voucherify) { Voucherify::Client.new({:applicationId => application_id, :clientSecretKey => client_secret_key}) }
  let(:headers) { {
      'X-App-Id' => application_id,
      'X-App-Token' => client_secret_key,
      'X-Voucherify-Channel' => 'Ruby-SDK',
      :accept => 'application/json'
  } }

  let(:validation_rule) { {
      :id => 'id',
      :voucher_code => 'test_val_rules',
      :orders => {
        :total_amount => {
          :more_than => [10000]
        }
      }
  } }

  let(:validation_rule_assignment) { {
      :id => 'id',
      :campaign => 'campaign',
      :voucher => 'voucher_code',
      :promotion_tier => 'promotion_tier'
  } }

  it 'should create validation rule' do
    stub_request(:post, 'https://api.voucherify.io/v1/validation-rules')
        .with(body: validation_rule.to_json, headers: headers)
        .to_return(:status => 200, :body => validation_rule.to_json, :headers => {})

    voucherify.validation_rules.create(validation_rule)
  end

  it 'should list validation rules' do
    query = {
        :limit => 10,
        :skip => 20
    }

    stub_request(:get, "https://api.voucherify.io/v1/validation-rules?limit=#{query[:limit]}&skip=#{query[:skip]}")
        .to_return(:status => 200, :body => '[]', :headers => {})

    voucherify.validation_rules.list query
  end

  it 'should get validation rule by id' do
    stub_request(:get, "https://api.voucherify.io/v1/validation-rules/#{validation_rule[:id]}")
        .to_return(:status => 200, :body => validation_rule.to_json, :headers => {})

    voucherify.validation_rules.get validation_rule[:id]
  end

  it 'should update validation rule' do
    stub_request(:put, "https://api.voucherify.io/v1/validation-rules/#{validation_rule[:id]}")
        .to_return(:status => 200, :body => validation_rule.to_json, :headers => {})
    validation_rule[:junction] = 'AND'

    voucherify.validation_rules.update validation_rule
  end

  it 'should delete validation rule by id' do
    stub_request(:delete, "https://api.voucherify.io/v1/validation-rules/#{validation_rule[:id]}")
        .to_return(:status => 200, :body => '', :headers => {})

    voucherify.validation_rules.delete validation_rule[:id]
  end

  it 'should create validation rule assignment' do
    stub_request(:post, "https://api.voucherify.io/v1/validation-rules/#{validation_rule[:id]}/assignments")
        .with(body: validation_rule_assignment.to_json, headers: headers)
        .to_return(:status => 200, :body => validation_rule_assignment.to_json, :headers => {})

    voucherify.validation_rules.createAssignment(validation_rule[:id], validation_rule_assignment)
  end

  it 'should delete validation rule assignment by id' do
    stub_request(:delete, "https://api.voucherify.io/v1/validation-rules/#{validation_rule[:id]}/assignments/#{validation_rule_assignment[:id]}")
        .to_return(:status => 200, :body => '', :headers => {})

    voucherify.validation_rules.deleteAssignment(validation_rule[:id], validation_rule_assignment[:id])
  end

  it 'should list validation rule assignments' do
    query = {
        :limit => 10,
        :skip => 20
    }

    stub_request(:get, "https://api.voucherify.io/v1/validation-rules/#{validation_rule[:id]}/assignments?limit=#{query[:limit]}&skip=#{query[:skip]}")
        .to_return(:status => 200, :body => '[]', :headers => {})

    voucherify.validation_rules.listAssignments(validation_rule[:id], query)
  end
end
