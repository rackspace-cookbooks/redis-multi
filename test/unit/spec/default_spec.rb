# encoding: UTF-8

require_relative 'spec_helper'

describe 'redis-multi::redis_single' do
  let(:chef_run) {
    ChefSpec::Runner.new(log_level: :debug).converge(described_recipe)
  }

  it 'starts the default redis service' do
    expect(chef_run).to start_service('redis6379-single')
  end

  # can't test configuration, as it is in an LWRP

end
