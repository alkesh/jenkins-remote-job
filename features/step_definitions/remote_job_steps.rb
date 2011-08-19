When /^the remote job is set to pass$/ do
  stub_request(:get, "remote.example.com/job/foo/api/json").
    to_return(:body => %({"lastBuild":{"number":1,"url":"http://remote.example.com/job/foo/1/"}})).times(2).then.
    to_return(:body => %({"lastBuild":{"number":2,"url":"http://remote.example.com/job/foo/2/"}}))
  @remote_build_request = stub_request(:post, "remote.example.com/job/foo/build")
  stub_request(:get, "remote.example.com/job/foo/2/api/json").
    to_return(:body => %({"building":true})).times(2).then.
    to_return(:body => %({"building":false, "result":"SUCCESS"}))
end

When /^the remote job is set to fail$/ do
  stub_request(:get, "remote.example.com/job/foo/api/json").
    to_return(:body => %({"lastBuild":{"number":1,"url":"http://remote.example.com/job/foo/1/"}})).times(2).then.
    to_return(:body => %({"lastBuild":{"number":2,"url":"http://remote.example.com/job/foo/2/"}}))
  @remote_build_request = stub_request(:post, "remote.example.com/job/foo/build")
  stub_request(:get, "remote.example.com/job/foo/2/api/json").
    to_return(:body => %({"building":true})).times(2).then.
    to_return(:body => %({"building":false, "result":"FAILURE"}))
end

When /^the remote job that requires basic authentication is set to pass$/ do
  stub_request(:get, "https://myuser:mypassword@remote.example.com/job/foo/api/json").
    to_return(:body => %({"lastBuild":{"number":1,"url":"https://myuser:mypassword@remote.example.com/job/foo/1/"}})).times(2).then.
    to_return(:body => %({"lastBuild":{"number":2,"url":"https://myuser:mypassword@remote.example.com/job/foo/2/"}}))
  @remote_build_request = stub_request(:post, "https://myuser:mypassword@remote.example.com/job/foo/build")
  stub_request(:get, "https://myuser:mypassword@remote.example.com/job/foo/2/api/json").
    to_return(:body => %({"building":true})).times(2).then.
    to_return(:body => %({"building":false, "result":"SUCCESS"}))
end

Then /^the remote build should be invoked$/ do
  @remote_build_request.should have_been_requested
end

When /^I run remote_jenkins_job with no arguments$/ do
  @out = StringIO.new
  $stdout = @out
  @exit_status = 0
  begin
    RemoteJenkinsJob.new
  rescue SystemExit => e
    @exit_status = e.status
  end
  @result = $?
  $stdout = STDOUT
end

When /^I run remote_jenkins_job with arguments\: (.*)$/ do |args|
  @out = StringIO.new
  $stdout = @out
  @exit_status = 0
  begin
    RemoteJenkinsJob.new args.split(' ')
  rescue SystemExit => e
    @exit_status = e.status
  end
  @result = $?
  $stdout = STDOUT
end

Then /^the output should contain:$/ do |string|
  @out.string.should include(string)
end

Then /^the exit status should be (\d+)$/ do |status|
  @exit_status.should == status.to_i
end
