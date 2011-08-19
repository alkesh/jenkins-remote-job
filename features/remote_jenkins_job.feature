Feature: Remote Jenkins Job script
  Scenario: Display usage
    When I run remote_jenkins_job with no arguments
    Then the output should contain:
      """
      Usage: remote_jenkins_job [job uri] ([username] [password])
      """
    And the exit status should be 0

  Scenario: Remote Job passes
    When the remote job is set to pass
    And I run remote_jenkins_job with arguments: http://remote.example.com/job/foo
    Then the remote build should be invoked
    And the output should contain:
      """
      Running remote job: http://remote.example.com/job/foo
      Last build was: http://remote.example.com/job/foo/1/
      ..
      New build started: http://remote.example.com/job/foo/2/
      ..
      Build result: SUCCESS
      """
    And the exit status should be 0

  Scenario: Remote Job fails
    When the remote job is set to fail
    And I run remote_jenkins_job with arguments: http://remote.example.com/job/foo
    Then the remote build should be invoked
    And the output should contain:
      """
      Running remote job: http://remote.example.com/job/foo
      Last build was: http://remote.example.com/job/foo/1/
      ..
      New build started: http://remote.example.com/job/foo/2/
      ..
      Build result: FAILURE
      """
    And the exit status should be 1

  Scenario: Passing basic authentication credentials
    When the remote job that requires basic authentication is set to pass
    And I run remote_jenkins_job with arguments: https://remote.example.com/job/foo myuser mypassword
    Then the remote build should be invoked
    And the output should contain:
      """
      Running remote job: https://remote.example.com/job/foo
      Last build was: https://remote.example.com/job/foo/1/
      ..
      New build started: https://remote.example.com/job/foo/2/
      ..
      Build result: SUCCESS
      """
    And the exit status should be 0
