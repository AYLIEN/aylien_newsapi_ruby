# -*- encoding: utf-8 -*-

=begin
#AYLIEN News API

#The AYLIEN News API is the most powerful way of sourcing, searching and syndicating analyzed and enriched news content. It is accessed by sending HTTP requests to our server, which returns information to your client. 

The version of the OpenAPI document: 4.7.2
Contact: support@aylien.com
Generated by: https://openapi-generator.tech
OpenAPI Generator version: 5.0.0-SNAPSHOT

=end

$:.push File.expand_path("../lib", __FILE__)
require "aylien_news_api/version"

Gem::Specification.new do |s|
  s.name        = "aylien_news_api"
  s.version     = AylienNewsApi::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["AYLIEN"]
  s.email       = ["info@aylien.com"]
  s.homepage    = "https://newsapi.aylien.com/"
  s.summary     = "AYLIEN&amp;#39;s officially supported Ruby client library for accessing News API"
  s.description = "AYLIEN&amp;#39;s officially supported Ruby client library for accessing News API"
  s.license     = 'Apache-2.0'
  s.required_ruby_version = ">= 1.9"

  s.add_runtime_dependency 'faraday', '>= 0.14.0'

  s.add_development_dependency 'rspec', '~> 3.6', '>= 3.6.0'

  s.files         = `find *`.split("\n").uniq.sort.select { |f| !f.empty? }
  s.test_files    = `find spec/*`.split("\n")
  s.executables   = []
  s.require_paths = ["lib"]
end
