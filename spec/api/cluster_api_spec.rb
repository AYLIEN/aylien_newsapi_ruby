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

# Unit tests for AylienNewsApi::ClusterApi
# Automatically generated by openapi-generator (https://openapi-generator.tech)
# Please update as you see appropriate
describe 'ClusterApi' do
  before do
    # run before each test
    @api_instance = AylienNewsApi::ClusterApi.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of ClusterApi' do
    it 'should create an instance of ClusterApi' do
      expect(@api_instance).to be_instance_of(AylienNewsApi::ClusterApi)
    end
  end

  # unit tests for list_clusters
  # List Clusters
  # The clusters endpoint is used to return clusters based on parameters you set in your query. 
  # @param [Hash] opts the optional parameters
  # @option opts [Array<Integer>] :id This parameter is used for finding clusters by cluster id. 
  # @option opts [Array<Integer>] :id2 This parameter is used for excluding clusters by cluster id. 
  # @option opts [Integer] :story_count_min This parameter is used for finding clusters with more than or equal to a specific amount of stories associated with them. 
  # @option opts [Integer] :story_count_max This parameter is used for finding clusters with less than or equal to a specific amount of stories associated with them. 
  # @option opts [String] :time_start This parameter is used for finding clusters whose creation time is greater than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates). 
  # @option opts [String] :time_end This parameter is used for finding clusters whose creation time is less than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates). 
  # @option opts [String] :earliest_story_start This parameter is used for finding clusters whose publication date of its earliest story is greater than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates). 
  # @option opts [String] :earliest_story_end This parameter is used for finding clusters whose publication date of its earliest story is less than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates). 
  # @option opts [String] :latest_story_start This parameter is used for finding clusters whose publication date of its latest story is greater than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates). 
  # @option opts [String] :latest_story_end This parameter is used for finding clusters whose publication date of its latest story is less than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates). 
  # @option opts [Array<String>] :location_country This parameter is used for finding clusters belonging to a specific country. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  # @option opts [Array<String>] :location_country2 This parameter is used for excluding clusters belonging to a specific country. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  # @return [Clusters]
  describe 'list_clusters test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end
