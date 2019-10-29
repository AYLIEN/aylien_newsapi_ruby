=begin
#AYLIEN News API

#The AYLIEN News API is the most powerful way of sourcing, searching and syndicating analyzed and enriched news content. It is accessed by sending HTTP requests to our server, which returns information to your client. 

The version of the OpenAPI document: 2.0
Contact: support@aylien.com
Generated by: https://openapi-generator.tech
OpenAPI Generator version: 4.1.3-SNAPSHOT

=end

require 'spec_helper'
require 'json'
require 'date'

# Unit tests for AylienNewsApi::RelatedStories
# Automatically generated by openapi-generator (https://openapi-generator.tech)
# Please update as you see appropriate
describe 'RelatedStories' do
  before do
    # run before each test
    @instance = AylienNewsApi::RelatedStories.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of RelatedStories' do
    it 'should create an instance of RelatedStories' do
      expect(@instance).to be_instance_of(AylienNewsApi::RelatedStories)
    end
  end
  describe 'test attribute "related_stories"' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  describe 'test attribute "story_body"' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  describe 'test attribute "story_language"' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  describe 'test attribute "story_title"' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end
