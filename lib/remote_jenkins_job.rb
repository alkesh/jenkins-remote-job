require 'net/http'
require 'open-uri'
require 'uri'

class RemoteJenkinsJob
  def initialize *params
    if params.empty?
      puts "Usage: remote_jenkins_job [job uri] ([username] [password])"
    else
      @job_uri = params[0]
      @options = {}
      start
    end
  end

  private

  def start
    puts "Running remote job: #{@job_uri}"
    original_last_build = get_last_build
    puts "Last build was: " + original_last_build['url'].to_s
    Net::HTTP.post_form(URI.parse('http://remote.example.com/job/foo/build'),{})

    last_build = original_last_build
    while last_build == original_last_build do
      last_build = get_last_build
      print '.'
      sleep 1
    end

    puts ""
    puts "New build started: #{last_build['url']}"

    while (latest_build = get_new_build(last_build['url']))['building'] do
      print '.'
      sleep 1
    end

    puts ""
    puts "Build result: " + latest_build['result']
  end

  def get_last_build
    json = JSON.parse(open(@job_uri+"/api/json", @options).read)
    json['lastBuild']
  end

  def get_new_build(url)
    JSON.parse(open(url+"api/json", @options).read)
  end
end
