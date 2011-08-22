# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{remote_jenkins_job}
  s.version = "1.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Alkesh Vaghmaria"]
  s.date = %q{2011-08-22}
  s.default_executable = %q{remote_jenkins_job}
  s.description = %q{Inovkes a job on a remote jenkins server}
  s.email = %q{alkesh.vaghmaria@bt.com}
  s.executables = ["remote_jenkins_job"]
  s.extra_rdoc_files = ["README.md"]
  s.files = ["README.md", "lib/remote_jenkins_job.rb", "bin/remote_jenkins_job"]
  s.homepage = %q{https://github.com/alkesh/jenkins-remote-job}
  s.rdoc_options = ["--main", "README.md"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Inovkes a job on a remote jenkins server}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
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
