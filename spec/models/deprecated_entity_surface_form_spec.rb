=begin
#AYLIEN News API

#The AYLIEN News API is the most powerful way of sourcing, searching and syndicating analyzed and enriched news content. It is accessed by sending HTTP requests to our server, which returns information to your client. 

The version of the OpenAPI document: 3.0
Contact: support@aylien.com
Generated by: https://openapi-generator.tech
OpenAPI Generator version: 5.0.0-SNAPSHOT

=end

require 'spec_helper'
require 'json'
require 'date'

# Unit tests for AylienNewsApi::DeprecatedEntitySurfaceForm
# Automatically generated by openapi-generator (https://openapi-generator.tech)
# Please update as you see appropriate
describe 'DeprecatedEntitySurfaceForm' do
  before do
    # run before each test
    @instance = AylienNewsApi::DeprecatedEntitySurfaceForm.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of DeprecatedEntitySurfaceForm' do
    it 'should create an instance of DeprecatedEntitySurfaceForm' do
      expect(@instance).to be_instance_of(AylienNewsApi::DeprecatedEntitySurfaceForm)
    end
  end
  describe 'test attribute "text"' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  describe 'test attribute "indices"' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  describe 'test attribute "frequency"' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end