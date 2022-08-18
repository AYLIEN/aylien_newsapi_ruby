=begin
#AYLIEN News API

#The AYLIEN News API is the most powerful way of sourcing, searching and syndicating analyzed and enriched news content. It is accessed by sending HTTP requests to our server, which returns information to your client. 

The version of the OpenAPI document: 5.2.3
Contact: support@aylien.com
Generated by: https://openapi-generator.tech
OpenAPI Generator version: 5.0.0-SNAPSHOT

=end

require 'spec_helper'
require 'json'
require 'date'

# Unit tests for AylienNewsApi::SentimentPolarity
# Automatically generated by openapi-generator (https://openapi-generator.tech)
# Please update as you see appropriate
describe 'SentimentPolarity' do
  before do
    # run before each test
    @instance = AylienNewsApi::SentimentPolarity.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of SentimentPolarity' do
    it 'should create an instance of SentimentPolarity' do
      expect(@instance).to be_instance_of(AylienNewsApi::SentimentPolarity)
    end
  end
end
