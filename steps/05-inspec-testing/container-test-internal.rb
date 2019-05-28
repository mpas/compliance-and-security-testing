describe file('/app/application.jar') do
    it { should exist }
end

describe port('22') do
    it { should_not be_listening }
end

describe command('ps -e') do
    its('stdout') { 
      should_not match(/ssh/)
    }
end
