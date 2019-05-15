require 'serverspec'

set :backend, :exec

describe package('clamav') do
  it { should be_installed }
end

describe service('clamav-freshclam') do
  it { should be_enabled }
end

describe service('clamav-clamd') do
  it { should be_enabled }
end
