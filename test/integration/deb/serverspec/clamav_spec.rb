require 'serverspec'

set :backend, :exec

describe package('clamav') do
  it { should be_installed }
end

describe 'clamav service' do

  case os[:family]
  when 'redhat'
    service = 'freshclam'
  when 'debian', 'ubuntu'
    service = 'clamav-freshclam'
  else
    # No other supported ATM
  end

  describe service(service) do
  it { should be_enabled }
  end
end
