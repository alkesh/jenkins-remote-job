Remote Jenkins Job
==================

This script allows a job on a local instance of [Jenkins](http://jenkins-ci.org) to invoke a job on a remote instance of Jenkins.
The local job will only pass when the remote job passes.

Installation
------------

On the server that Jenkins is installed on, and as the jenkins user, run:
`gem install remote_jenkins_job`

Usage
-----

Create a new free-style software project.
Add a build step, and enter the following command:
`remote_jenkins_job <remote-job-url> <username> <password>`
(username and password are optional - only required if your remote jenkins is password protected using HTTP Basic Authentication)
