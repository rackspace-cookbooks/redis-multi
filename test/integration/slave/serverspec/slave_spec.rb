# encoding: UTF-8

require_relative 'spec_helper'

describe service('redis6379-slave') do
  it { should be_enabled }
end

describe service('redis6379-slave') do
  it { should be_running }
end

describe port(6379) do
  it { should be_listening }
end

redis_query = 'redis-cli -p 6379 INFO'
describe command(redis_query) do
  it { should return_stdout(/^# Server/) }
  it { should return_stdout(/^uptime_in_seconds:/) }
  it { should return_stdout(/^role:slave/) }
  it { should return_stdout(/^master_host:192.168.0.23/) }
  it { should return_stdout(/^master_port:6379/) }
end

describe file('/etc/redis') do
  it { should be_directory }
end

describe file('/etc/redis/6379-slave.conf') do
  it { should contain('port 6379') }
  it { should contain('slaveof 192.168.0.23 6379') }

end
