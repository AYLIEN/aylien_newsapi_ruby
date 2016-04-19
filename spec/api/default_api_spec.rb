# Copyright 2016 Aylien, Inc. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require 'spec_helper'
require 'json'

# Unit tests for AylienNewsApi::DefaultApi
describe 'DefaultApi' do
  before do
    # run before each test
    @instance = AylienNewsApi::DefaultApi.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of DefaultApi' do
    it 'should create an instact of DefaultApi' do
      @instance.should be_a(AylienNewsApi::DefaultApi)
    end
  end

  # unit tests for list_autocompletes
  # List autocompletes
  # This endpoint is used for getting list of autocompletes by providing a specific term and type.
  # @param type This parameter is used for defining the type of autocompletes.
  # @param term This parameter is used for finding autocomplete objects whose contains the specified value.
  # @param [Hash] opts the optional parameters
  # @option opts [String] :language This parameter is used for autocompletes whose language is the specified value. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes.
  # @option opts [Integer] :per_page This parameter is used for specifying number of the items in each page.
  # @return [Autocompletes]
  describe 'list_autocompletes test' do
    it "should work" do
      # assertion here
      # should be_a()
      # should be_nil
      # should ==
      # should_not ==
    end
  end

  # unit tests for list_coverages
  # List coverages
  # This endpoint is used for finding story coverages based on provided parameters. The number of coverages to return, up to a maximum of 100.
  # @param [Hash] opts the optional parameters
  # @option opts [Array<Integer>] :id This parameter is used for finding stroies by story id.
  # @option opts [String] :title This parameter is used for finding stories whose title contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
  # @option opts [String] :body This parameter is used for finding stories whose body contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
  # @option opts [String] :text This parameter is used for finding stories whose title or body contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
  # @option opts [Array<String>] :language This parameter is used for finding stories whose language is the specified value. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes.
  # @option opts [String] :published_at_start This parameter is used for finding stories whose published at is greater than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates).
  # @option opts [String] :published_at_end This parameter is used for finding stories whose published at is less than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates).
  # @option opts [String] :categories_taxonomy This parameter is used for defining type of the taxonomy for the rest of categories queries.
  # @option opts [BOOLEAN] :categories_confident This parameter is used for finding stories whose categories are confident.
  # @option opts [Array<String>] :categories_id This parameter is used for finding stories whose categories id is the specified value.
  # @option opts [Array<Integer>] :categories_level This parameter is used for finding stories whose categories level is the specified value.
  # @option opts [Array<String>] :entities_title_text This parameter is used for finding stories whose entities text in title is the specified value.
  # @option opts [Array<String>] :entities_title_type This parameter is used for finding stories whose entities type in title is the specified value.
  # @option opts [Array<String>] :entities_title_links_dbpedia This parameter is used for finding stories whose entities dbpedia url in title is the specified value.
  # @option opts [Array<String>] :entities_body_text This parameter is used for finding stories whose entities text in body is the specified value.
  # @option opts [Array<String>] :entities_body_type This parameter is used for finding stories whose entities type in body is the specified value.
  # @option opts [Array<String>] :entities_body_links_dbpedia This parameter is used for finding stories whose entities dbpedia url in body is the specified value.
  # @option opts [String] :sentiment_title_polarity This parameter is used for finding stories whose title sentiment is the specified value.
  # @option opts [String] :sentiment_body_polarity This parameter is used for finding stories whose body sentiment is the specified value.
  # @option opts [Array<Integer>] :author_id This parameter is used for finding stories whose author id is the specified value.
  # @option opts [String] :author_name This parameter is used for finding stories whose author full name contains the specified value.
  # @option opts [Array<Integer>] :source_id This parameter is used for finding stories whose source id is the specified value.
  # @option opts [Array<String>] :source_name This parameter is used for finding stories whose source name contains the specified value.
  # @option opts [Array<String>] :source_domain This parameter is used for finding stories whose source domain is the specified value.
  # @option opts [Array<String>] :source_locations_country This parameter is used for finding stories whose source country is the specified value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes.
  # @option opts [Array<String>] :source_locations_state This parameter is used for finding stories whose source state/province is the specified value.
  # @option opts [Array<String>] :source_locations_city This parameter is used for finding stories whose source city is the specified value.
  # @option opts [Array<String>] :source_scopes_country This parameter is used for finding stories whose source scopes country is the specified value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes.
  # @option opts [Array<String>] :source_scopes_state This parameter is used for finding stories whose source scopes state/province is the specified value.
  # @option opts [Array<String>] :source_scopes_city This parameter is used for finding stories whose source scopes city is the specified value.
  # @option opts [Array<String>] :source_scopes_level This parameter is used for finding stories whose source scopes level is the specified value.
  # @option opts [Integer] :story_id A story id
  # @option opts [String] :story_url An article or webpage
  # @option opts [String] :story_title Title of the article
  # @option opts [String] :story_body Body of the article
  # @option opts [DateTime] :story_published_at Publish date of the article. If you use url or title and body for getting coverages, this parameter is required. The format used is a restricted form of the canonical representation of dateTime in the [XML Schema specification (ISO 8601)](https://www.w3.org/TR/xmlschema-2/#dateTime).
  # @option opts [String] :story_language This parameter is used for setting language of the story. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes.
  # @option opts [Integer] :per_page This parameter is used for specifying number of the items in each page.
  # @return [Coverages]
  describe 'list_coverages test' do
    it "should work" do
      # assertion here
      # should be_a()
      # should be_nil
      # should ==
      # should_not ==
    end
  end

  # unit tests for list_histograms
  # List histograms
  # This endpoint is used for getting histograms based on the field parameter is passed.
  # @param [Hash] opts the optional parameters
  # @option opts [Array<Integer>] :id This parameter is used for finding stroies by story id.
  # @option opts [String] :title This parameter is used for finding stories whose title contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
  # @option opts [String] :body This parameter is used for finding stories whose body contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
  # @option opts [String] :text This parameter is used for finding stories whose title or body contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
  # @option opts [Array<String>] :language This parameter is used for finding stories whose language is the specified value. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes.
  # @option opts [String] :published_at_start This parameter is used for finding stories whose published at is greater than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates).
  # @option opts [String] :published_at_end This parameter is used for finding stories whose published at is less than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates).
  # @option opts [String] :categories_taxonomy This parameter is used for defining type of the taxonomy for the rest of categories queries.
  # @option opts [BOOLEAN] :categories_confident This parameter is used for finding stories whose categories are confident.
  # @option opts [Array<String>] :categories_id This parameter is used for finding stories whose categories id is the specified value.
  # @option opts [Array<Integer>] :categories_level This parameter is used for finding stories whose categories level is the specified value.
  # @option opts [Array<String>] :entities_title_text This parameter is used for finding stories whose entities text in title is the specified value.
  # @option opts [Array<String>] :entities_title_type This parameter is used for finding stories whose entities type in title is the specified value.
  # @option opts [Array<String>] :entities_title_links_dbpedia This parameter is used for finding stories whose entities dbpedia url in title is the specified value.
  # @option opts [Array<String>] :entities_body_text This parameter is used for finding stories whose entities text in body is the specified value.
  # @option opts [Array<String>] :entities_body_type This parameter is used for finding stories whose entities type in body is the specified value.
  # @option opts [Array<String>] :entities_body_links_dbpedia This parameter is used for finding stories whose entities dbpedia url in body is the specified value.
  # @option opts [String] :sentiment_title_polarity This parameter is used for finding stories whose title sentiment is the specified value.
  # @option opts [String] :sentiment_body_polarity This parameter is used for finding stories whose body sentiment is the specified value.
  # @option opts [Array<Integer>] :author_id This parameter is used for finding stories whose author id is the specified value.
  # @option opts [String] :author_name This parameter is used for finding stories whose author full name contains the specified value.
  # @option opts [Array<Integer>] :source_id This parameter is used for finding stories whose source id is the specified value.
  # @option opts [Array<String>] :source_name This parameter is used for finding stories whose source name contains the specified value.
  # @option opts [Array<String>] :source_domain This parameter is used for finding stories whose source domain is the specified value.
  # @option opts [Array<String>] :source_locations_country This parameter is used for finding stories whose source country is the specified value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes.
  # @option opts [Array<String>] :source_locations_state This parameter is used for finding stories whose source state/province is the specified value.
  # @option opts [Array<String>] :source_locations_city This parameter is used for finding stories whose source city is the specified value.
  # @option opts [Array<String>] :source_scopes_country This parameter is used for finding stories whose source scopes country is the specified value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes.
  # @option opts [Array<String>] :source_scopes_state This parameter is used for finding stories whose source scopes state/province is the specified value.
  # @option opts [Array<String>] :source_scopes_city This parameter is used for finding stories whose source scopes city is the specified value.
  # @option opts [Array<String>] :source_scopes_level This parameter is used for finding stories whose source scopes level is the specified value.
  # @option opts [Integer] :interval_start This parameter is used for setting the start data point of histogram intervals.
  # @option opts [Integer] :interval_end This parameter is used for setting the end data point of histogram intervals.
  # @option opts [Integer] :interval_width This parameter is used for setting the width of histogram intervals.
  # @option opts [String] :field This parameter is used for specifying the y-axis variable for the histogram.
  # @return [Histograms]
  describe 'list_histograms test' do
    it "should work" do
      # assertion here
      # should be_a()
      # should be_nil
      # should ==
      # should_not ==
    end
  end

  # unit tests for list_related_stories
  # List related stories
  # This endpoint is used for finding related stories based on provided parameters. The number of related stories to return, up to a maximum of 100.
  # @param [Hash] opts the optional parameters
  # @option opts [Array<Integer>] :id This parameter is used for finding stroies by story id.
  # @option opts [String] :title This parameter is used for finding stories whose title contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
  # @option opts [String] :body This parameter is used for finding stories whose body contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
  # @option opts [String] :text This parameter is used for finding stories whose title or body contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
  # @option opts [Array<String>] :language This parameter is used for finding stories whose language is the specified value. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes.
  # @option opts [String] :published_at_start This parameter is used for finding stories whose published at is greater than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates).
  # @option opts [String] :published_at_end This parameter is used for finding stories whose published at is less than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates).
  # @option opts [String] :categories_taxonomy This parameter is used for defining type of the taxonomy for the rest of categories queries.
  # @option opts [BOOLEAN] :categories_confident This parameter is used for finding stories whose categories are confident.
  # @option opts [Array<String>] :categories_id This parameter is used for finding stories whose categories id is the specified value.
  # @option opts [Array<Integer>] :categories_level This parameter is used for finding stories whose categories level is the specified value.
  # @option opts [Array<String>] :entities_title_text This parameter is used for finding stories whose entities text in title is the specified value.
  # @option opts [Array<String>] :entities_title_type This parameter is used for finding stories whose entities type in title is the specified value.
  # @option opts [Array<String>] :entities_title_links_dbpedia This parameter is used for finding stories whose entities dbpedia url in title is the specified value.
  # @option opts [Array<String>] :entities_body_text This parameter is used for finding stories whose entities text in body is the specified value.
  # @option opts [Array<String>] :entities_body_type This parameter is used for finding stories whose entities type in body is the specified value.
  # @option opts [Array<String>] :entities_body_links_dbpedia This parameter is used for finding stories whose entities dbpedia url in body is the specified value.
  # @option opts [String] :sentiment_title_polarity This parameter is used for finding stories whose title sentiment is the specified value.
  # @option opts [String] :sentiment_body_polarity This parameter is used for finding stories whose body sentiment is the specified value.
  # @option opts [Array<Integer>] :author_id This parameter is used for finding stories whose author id is the specified value.
  # @option opts [String] :author_name This parameter is used for finding stories whose author full name contains the specified value.
  # @option opts [Array<Integer>] :source_id This parameter is used for finding stories whose source id is the specified value.
  # @option opts [Array<String>] :source_name This parameter is used for finding stories whose source name contains the specified value.
  # @option opts [Array<String>] :source_domain This parameter is used for finding stories whose source domain is the specified value.
  # @option opts [Array<String>] :source_locations_country This parameter is used for finding stories whose source country is the specified value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes.
  # @option opts [Array<String>] :source_locations_state This parameter is used for finding stories whose source state/province is the specified value.
  # @option opts [Array<String>] :source_locations_city This parameter is used for finding stories whose source city is the specified value.
  # @option opts [Array<String>] :source_scopes_country This parameter is used for finding stories whose source scopes country is the specified value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes.
  # @option opts [Array<String>] :source_scopes_state This parameter is used for finding stories whose source scopes state/province is the specified value.
  # @option opts [Array<String>] :source_scopes_city This parameter is used for finding stories whose source scopes city is the specified value.
  # @option opts [Array<String>] :source_scopes_level This parameter is used for finding stories whose source scopes level is the specified value.
  # @option opts [Integer] :story_id A story id
  # @option opts [String] :story_url An article or webpage
  # @option opts [String] :story_title Title of the article
  # @option opts [String] :story_body Body of the article
  # @option opts [String] :boost_by This parameter is used for boosting result by the specified value.
  # @option opts [String] :story_language This parameter is used for setting language of the story. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes.
  # @option opts [Integer] :per_page This parameter is used for specifying number of the items in each page.
  # @return [RelatedStories]
  describe 'list_related_stories test' do
    it "should work" do
      # assertion here
      # should be_a()
      # should be_nil
      # should ==
      # should_not ==
    end
  end

  # unit tests for list_stories
  # List Stories
  # This endpoint is used for getting list of stories.
  # @param [Hash] opts the optional parameters
  # @option opts [Array<Integer>] :id This parameter is used for finding stroies by story id.
  # @option opts [String] :title This parameter is used for finding stories whose title contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
  # @option opts [String] :body This parameter is used for finding stories whose body contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
  # @option opts [String] :text This parameter is used for finding stories whose title or body contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
  # @option opts [Array<String>] :language This parameter is used for finding stories whose language is the specified value. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes.
  # @option opts [String] :published_at_start This parameter is used for finding stories whose published at is greater than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates).
  # @option opts [String] :published_at_end This parameter is used for finding stories whose published at is less than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates).
  # @option opts [String] :categories_taxonomy This parameter is used for defining type of the taxonomy for the rest of categories queries.
  # @option opts [BOOLEAN] :categories_confident This parameter is used for finding stories whose categories are confident.
  # @option opts [Array<String>] :categories_id This parameter is used for finding stories whose categories id is the specified value.
  # @option opts [Array<Integer>] :categories_level This parameter is used for finding stories whose categories level is the specified value.
  # @option opts [Array<String>] :entities_title_text This parameter is used for finding stories whose entities text in title is the specified value.
  # @option opts [Array<String>] :entities_title_type This parameter is used for finding stories whose entities type in title is the specified value.
  # @option opts [Array<String>] :entities_title_links_dbpedia This parameter is used for finding stories whose entities dbpedia url in title is the specified value.
  # @option opts [Array<String>] :entities_body_text This parameter is used for finding stories whose entities text in body is the specified value.
  # @option opts [Array<String>] :entities_body_type This parameter is used for finding stories whose entities type in body is the specified value.
  # @option opts [Array<String>] :entities_body_links_dbpedia This parameter is used for finding stories whose entities dbpedia url in body is the specified value.
  # @option opts [String] :sentiment_title_polarity This parameter is used for finding stories whose title sentiment is the specified value.
  # @option opts [String] :sentiment_body_polarity This parameter is used for finding stories whose body sentiment is the specified value.
  # @option opts [Array<Integer>] :author_id This parameter is used for finding stories whose author id is the specified value.
  # @option opts [String] :author_name This parameter is used for finding stories whose author full name contains the specified value.
  # @option opts [Array<Integer>] :source_id This parameter is used for finding stories whose source id is the specified value.
  # @option opts [Array<String>] :source_name This parameter is used for finding stories whose source name contains the specified value.
  # @option opts [Array<String>] :source_domain This parameter is used for finding stories whose source domain is the specified value.
  # @option opts [Array<String>] :source_locations_country This parameter is used for finding stories whose source country is the specified value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes.
  # @option opts [Array<String>] :source_locations_state This parameter is used for finding stories whose source state/province is the specified value.
  # @option opts [Array<String>] :source_locations_city This parameter is used for finding stories whose source city is the specified value.
  # @option opts [Array<String>] :source_scopes_country This parameter is used for finding stories whose source scopes country is the specified value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes.
  # @option opts [Array<String>] :source_scopes_state This parameter is used for finding stories whose source scopes state/province is the specified value.
  # @option opts [Array<String>] :source_scopes_city This parameter is used for finding stories whose source scopes city is the specified value.
  # @option opts [Array<String>] :source_scopes_level This parameter is used for finding stories whose source scopes level is the specified value.
  # @option opts [BOOLEAN] :cluster This parameter enables clustering for the returned stories.
  # @option opts [String] :cluster_algorithm This parameter is used for specifying the clustering algorithm. It supprts STC, Lingo and [k-means](https://en.wikipedia.org/wiki/K-means_clustering) algorithms.
  # @option opts [Array<String>] :_return This parameter is used for specifying return fields.
  # @option opts [String] :sort_by This parameter is used for changing the order column of the result.
  # @option opts [String] :sort_direction This parameter is used for changing the order direction of the result.
  # @option opts [String] :cursor This parameter is used for finding a specific page.
  # @option opts [Integer] :per_page This parameter is used for specifying number of the items in each page.
  # @return [Stories]
  describe 'list_stories test' do
    it "should work" do
      # assertion here
      # should be_a()
      # should be_nil
      # should ==
      # should_not ==
    end
  end

  # unit tests for list_time_series
  # List time series
  # This endpoint is used for getting time series by stories.
  # @param [Hash] opts the optional parameters
  # @option opts [Array<Integer>] :id This parameter is used for finding stroies by story id.
  # @option opts [String] :title This parameter is used for finding stories whose title contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
  # @option opts [String] :body This parameter is used for finding stories whose body contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
  # @option opts [String] :text This parameter is used for finding stories whose title or body contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
  # @option opts [Array<String>] :language This parameter is used for finding stories whose language is the specified value. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes.
  # @option opts [String] :categories_taxonomy This parameter is used for defining type of the taxonomy for the rest of categories queries.
  # @option opts [BOOLEAN] :categories_confident This parameter is used for finding stories whose categories are confident.
  # @option opts [Array<String>] :categories_id This parameter is used for finding stories whose categories id is the specified value.
  # @option opts [Array<Integer>] :categories_level This parameter is used for finding stories whose categories level is the specified value.
  # @option opts [Array<String>] :entities_title_text This parameter is used for finding stories whose entities text in title is the specified value.
  # @option opts [Array<String>] :entities_title_type This parameter is used for finding stories whose entities type in title is the specified value.
  # @option opts [Array<String>] :entities_title_links_dbpedia This parameter is used for finding stories whose entities dbpedia url in title is the specified value.
  # @option opts [Array<String>] :entities_body_text This parameter is used for finding stories whose entities text in body is the specified value.
  # @option opts [Array<String>] :entities_body_type This parameter is used for finding stories whose entities type in body is the specified value.
  # @option opts [Array<String>] :entities_body_links_dbpedia This parameter is used for finding stories whose entities dbpedia url in body is the specified value.
  # @option opts [String] :sentiment_title_polarity This parameter is used for finding stories whose title sentiment is the specified value.
  # @option opts [String] :sentiment_body_polarity This parameter is used for finding stories whose body sentiment is the specified value.
  # @option opts [Array<Integer>] :author_id This parameter is used for finding stories whose author id is the specified value.
  # @option opts [String] :author_name This parameter is used for finding stories whose author full name contains the specified value.
  # @option opts [Array<Integer>] :source_id This parameter is used for finding stories whose source id is the specified value.
  # @option opts [Array<String>] :source_name This parameter is used for finding stories whose source name contains the specified value.
  # @option opts [Array<String>] :source_domain This parameter is used for finding stories whose source domain is the specified value.
  # @option opts [Array<String>] :source_locations_country This parameter is used for finding stories whose source country is the specified value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes.
  # @option opts [Array<String>] :source_locations_state This parameter is used for finding stories whose source state/province is the specified value.
  # @option opts [Array<String>] :source_locations_city This parameter is used for finding stories whose source city is the specified value.
  # @option opts [Array<String>] :source_scopes_country This parameter is used for finding stories whose source scopes country is the specified value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes.
  # @option opts [Array<String>] :source_scopes_state This parameter is used for finding stories whose source scopes state/province is the specified value.
  # @option opts [Array<String>] :source_scopes_city This parameter is used for finding stories whose source scopes city is the specified value.
  # @option opts [Array<String>] :source_scopes_level This parameter is used for finding stories whose source scopes level is the specified value.
  # @option opts [String] :published_at_start This parameter is used for finding stories whose published at is less than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates).
  # @option opts [String] :published_at_end This parameter is used for finding stories whose published at is greater than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates).
  # @option opts [String] :period The size of each date range expressed as an interval to be added to the lower bound. It supports Date Math Syntax. Valid options are &#x60;+&#x60; following an integer number greater than 0 and one of the Date Math keywords. e.g. &#x60;+1DAY&#x60;, &#x60;+2MINUTES&#x60; and &#x60;+1MONTH&#x60;. Here are [Supported keywords](https://newsapi.aylien.com/docs/working-with-dates#date-math).
  # @return [TimeSeriesList]
  describe 'list_time_series test' do
    it "should work" do
      # assertion here
      # should be_a()
      # should be_nil
      # should ==
      # should_not ==
    end
  end

  # unit tests for list_trends
  # List trends
  # This endpoint is used for finding news trendings based on stories resource.
  # @param [Hash] opts the optional parameters
  # @option opts [Array<Integer>] :id This parameter is used for finding stroies by story id.
  # @option opts [String] :title This parameter is used for finding stories whose title contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
  # @option opts [String] :body This parameter is used for finding stories whose body contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
  # @option opts [String] :text This parameter is used for finding stories whose title or body contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
  # @option opts [Array<String>] :language This parameter is used for finding stories whose language is the specified value. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes.
  # @option opts [String] :published_at_start This parameter is used for finding stories whose published at is greater than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates).
  # @option opts [String] :published_at_end This parameter is used for finding stories whose published at is less than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates).
  # @option opts [String] :categories_taxonomy This parameter is used for defining type of the taxonomy for the rest of categories queries.
  # @option opts [BOOLEAN] :categories_confident This parameter is used for finding stories whose categories are confident.
  # @option opts [Array<String>] :categories_id This parameter is used for finding stories whose categories id is the specified value.
  # @option opts [Array<Integer>] :categories_level This parameter is used for finding stories whose categories level is the specified value.
  # @option opts [Array<String>] :entities_title_text This parameter is used for finding stories whose entities text in title is the specified value.
  # @option opts [Array<String>] :entities_title_type This parameter is used for finding stories whose entities type in title is the specified value.
  # @option opts [Array<String>] :entities_title_links_dbpedia This parameter is used for finding stories whose entities dbpedia url in title is the specified value.
  # @option opts [Array<String>] :entities_body_text This parameter is used for finding stories whose entities text in body is the specified value.
  # @option opts [Array<String>] :entities_body_type This parameter is used for finding stories whose entities type in body is the specified value.
  # @option opts [Array<String>] :entities_body_links_dbpedia This parameter is used for finding stories whose entities dbpedia url in body is the specified value.
  # @option opts [String] :sentiment_title_polarity This parameter is used for finding stories whose title sentiment is the specified value.
  # @option opts [String] :sentiment_body_polarity This parameter is used for finding stories whose body sentiment is the specified value.
  # @option opts [Array<Integer>] :author_id This parameter is used for finding stories whose author id is the specified value.
  # @option opts [String] :author_name This parameter is used for finding stories whose author full name contains the specified value.
  # @option opts [Array<Integer>] :source_id This parameter is used for finding stories whose source id is the specified value.
  # @option opts [Array<String>] :source_name This parameter is used for finding stories whose source name contains the specified value.
  # @option opts [Array<String>] :source_domain This parameter is used for finding stories whose source domain is the specified value.
  # @option opts [Array<String>] :source_locations_country This parameter is used for finding stories whose source country is the specified value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes.
  # @option opts [Array<String>] :source_locations_state This parameter is used for finding stories whose source state/province is the specified value.
  # @option opts [Array<String>] :source_locations_city This parameter is used for finding stories whose source city is the specified value.
  # @option opts [Array<String>] :source_scopes_country This parameter is used for finding stories whose source scopes country is the specified value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes.
  # @option opts [Array<String>] :source_scopes_state This parameter is used for finding stories whose source scopes state/province is the specified value.
  # @option opts [Array<String>] :source_scopes_city This parameter is used for finding stories whose source scopes city is the specified value.
  # @option opts [Array<String>] :source_scopes_level This parameter is used for finding stories whose source scopes level is the specified value.
  # @option opts [String] :field This parameter is used to specify the trend field.
  # @return [Trends]
  describe 'list_trends test' do
    it "should work" do
      # assertion here
      # should be_a()
      # should be_nil
      # should ==
      # should_not ==
    end
  end

end
