describe docker_container("sample-app-container") do
    it { should exist }
    it { should be_running }
    its('repo') { should eq 'sample-app-image' }
    its('ports') { should eq "0.0.0.0:8020->8020/tcp" }
    its('command') { should eq 'java -Dmicronaut.server.port=8020 -jar application.jar' }
end

describe http('http://localhost:8020/helloworld/') do
    its('status') { should cmp 200 }
end

describe docker_image('this-image-should-not-be-used-anymore:latest') do
    it { should_not exist }
end

describe docker.containers do
    its('images') { should_not include 'this-image-should-not-be-used-anymore:latest' }
end

describe docker.images do
    its('repositories') { should_not include 'insecure_image' }
end