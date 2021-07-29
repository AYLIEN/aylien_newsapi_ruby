=begin
#AYLIEN News API

#The AYLIEN News API is the most powerful way of sourcing, searching and syndicating analyzed and enriched news content. It is accessed by sending HTTP requests to our server, which returns information to your client. 

The version of the OpenAPI document: 3.0
Contact: support@aylien.com
Generated by: https://openapi-generator.tech
OpenAPI Generator version: 4.1.3-SNAPSHOT

=end

require 'spec_helper'
require 'json'
require 'date'

# Unit tests for AylienNewsApi::EntityMention
# Automatically generated by openapi-generator (https://openapi-generator.tech)
# Please update as you see appropriate
describe 'EntityMention' do
  before do
    # run before each test
    @instance = AylienNewsApi::EntityMention.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of EntityMention' do
    it 'should create an instance of EntityMention' do
      expect(@instance).to be_instance_of(AylienNewsApi::EntityMention)
    end
  end
  describe 'test attribute "index"' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  describe 'test attribute "sentiment"' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end
