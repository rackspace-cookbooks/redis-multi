# encoding: UTF-8

require_relative 'spec_helper'

describe 'redis-multi::_base' do
  let(:chef_run) do
    ChefSpec::Runner.new(platform: 'ubuntu', version: '14.04').converge(described_recipe)
  end

  it 'includes the apt cookbook' do
    expect(chef_run).to include_recipe('apt')
  end

  it 'includes the chef-sugar cookbook' do
    expect(chef_run).to include_recipe('chef-sugar')
  end
end
