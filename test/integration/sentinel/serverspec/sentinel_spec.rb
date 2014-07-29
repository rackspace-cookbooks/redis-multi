# encoding: UTF-8

require_relative 'spec_helper'

describe service('redis_sentinel_46379-sentinel') do
  it { should be_enabled }
end

case os[:family]
when 'Ubuntu'
  describe process('redis-server') do
    # must use process here as serverspec expects init scripts to return stdout
    # "running" and falls back to a bad 'ps aux'
    it { should be_running }
  end
else
  describe service('redis_sentinel_46379-sentinel') do
    it { should be_running }
  end
end

describe port(46379) do
  it { should be_listening }
end

redis_query = 'redis-cli -p 46379 INFO'
describe command(redis_query) do
  it { should return_stdout(/^# Sentinel/) }
  it { should return_stdout(/^sentinel_masters:/) }
  it { should return_stdout(/^master0:name=sentinel_46379-sentinel,status=sdown,address=192.168.0.23:6379,slaves=0,sentinels=1/) }
  it { should return_stdout(/^tcp_port:46379/) }
end

describe file('/etc/redis') do
  it { should be_directory }
end

describe file('/etc/redis/sentinel_46379-sentinel.conf') do
  it { should contain('port 46379') }
  it { should contain('sentinel monitor sentinel_46379-sentinel 192.168.0.23 6379 2') }

end
