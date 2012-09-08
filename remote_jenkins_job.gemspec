# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "remote_jenkins_job"
  s.version = "1.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Alkesh Vaghmaria"]
  s.date = "2012-09-08"
  s.description = "Inovkes a job on a remote jenkins server"
  s.email = "alkesh.vaghmaria@bt.com"
  s.executables = ["remote_jenkins_job"]
  s.extra_rdoc_files = ["README.md"]
  s.files = ["README.md", "lib/remote_jenkins_job.rb", "bin/remote_jenkins_job"]
  s.homepage = "https://github.com/alkesh/jenkins-remote-job"
  s.rdoc_options = ["--main", "README.md"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.10"
  s.summary = "Inovkes a job on a remote jenkins server"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<json>, [">= 0"])
    else
      s.add_dependency(%q<json>, [">= 0"])
    end
  else
    s.add_dependency(%q<json>, [">= 0"])
  end
end
