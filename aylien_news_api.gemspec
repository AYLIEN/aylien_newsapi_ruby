# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "aylien_news_api/version"

Gem::Specification.new do |s|
  s.name        = "aylien_news_api"
  s.version     = AylienNewsApi::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["AYLIEN Inc.", "Hamed Ramezanian Nik"]
  s.email       = ["support@aylien.com", "hamed.r.nik@gmail.com"]
  s.homepage    = "https://newsapi.aylien.com/"
  s.summary     = "AYLIEN News API is the most powerful way of sourcing, searching and syndicating analyzed and enriched news content"
  s.description = "AYLIEN News API is the most powerful way of sourcing, searching and syndicating analyzed and enriched news content."
  s.license     = "Apache-2.0"


  s.add_runtime_dependency 'typhoeus', '~> 1.0', '>= 1.0.1'
  s.add_runtime_dependency 'json', '~> 1.4', '>= 1.4.6'

  s.add_development_dependency 'rake', '~> 11.1', '>= 11.1.2'
  s.add_development_dependency 'rspec', '~> 3.2', '>= 3.2.0'
  s.add_development_dependency 'vcr', '~> 2.9', '>= 2.9.3'
  s.add_development_dependency 'webmock', '~> 1.6', '>= 1.6.2'
  s.add_development_dependency 'autotest', '~> 4.4', '>= 4.4.6'
  s.add_development_dependency 'autotest-rails-pure', '~> 4.1', '>= 4.1.2'
  s.add_development_dependency 'autotest-growl', '~> 0.2', '>= 0.2.16'
  s.add_development_dependency 'autotest-fsevent', '~> 0.2', '>= 0.2.11'

  s.files         = `find *`.split("\n").uniq.sort.select{|f| !f.empty? }
  s.test_files    = `find spec/*`.split("\n")
  s.executables   = []
  s.require_paths = ["lib"]
end
