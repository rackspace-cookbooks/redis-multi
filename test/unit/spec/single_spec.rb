# encoding: UTF-8

require_relative 'spec_helper'

describe 'redis-multi::single' do
  let(:chef_run) do
    ChefSpec::Runner.new.converge(described_recipe)
  end

  it 'includes the _base recipe' do
    expect(chef_run).to include_recipe('redis-multi::_base')
  end
end
