=begin
Copyright 2017 Aylien, Inc. All Rights Reserved.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
=end

require "uri"

module AylienNewsApi
  class DefaultApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end

    # List autocompletes
    # This endpoint is used for getting list of autocompletes by providing a specific term and type.
    # @param type This parameter is used for defining the type of autocompletes.
    # @param term This parameter is used for finding autocomplete objects that contain the specified value.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :language This parameter is used for autocompletes whose language is the specified value. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes. (default to en)
    # @option opts [Integer] :per_page This parameter is used for specifying number of items in each page. (default to 3)
    # @return [Autocompletes]
    def list_autocompletes(type, term, opts = {})
      data, _status_code, _headers = list_autocompletes_with_http_info(type, term, opts)
      return data
    end

    # List autocompletes
    # This endpoint is used for getting list of autocompletes by providing a specific term and type.
    # @param type This parameter is used for defining the type of autocompletes.
    # @param term This parameter is used for finding autocomplete objects that contain the specified value.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :language This parameter is used for autocompletes whose language is the specified value. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes.
    # @option opts [Integer] :per_page This parameter is used for specifying number of items in each page.
    # @return [Array<(Autocompletes, Fixnum, Hash)>] Autocompletes data, response status code and response headers
    def list_autocompletes_with_http_info(type, term, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: DefaultApi.list_autocompletes ..."
      end
      # verify the required parameter 'type' is set
      fail ArgumentError, "Missing the required parameter 'type' when calling DefaultApi.list_autocompletes" if type.nil?
      # verify enum value
      unless ['source_names', 'source_domains', 'entity_types', 'dbpedia_resources'].include?(type)
        fail ArgumentError, "invalid value for 'type', must be one of source_names, source_domains, entity_types, dbpedia_resources"
      end
      # verify the required parameter 'term' is set
      fail ArgumentError, "Missing the required parameter 'term' when calling DefaultApi.list_autocompletes" if term.nil?
      if term.to_s.length < 1
        fail ArgumentError, 'invalid value for "term" when calling DefaultApi.list_autocompletes, the character length must be great than or equal to 1.'
      end

      if opts[:'language'] && !['en', 'de', 'fr', 'it', 'es', 'pt'].include?(opts[:'language'])
        fail ArgumentError, 'invalid value for "language", must be one of en, de, fr, it, es, pt'
      end
      if !opts[:'per_page'].nil? && opts[:'per_page'] > 100
        fail ArgumentError, 'invalid value for "opts[:"per_page"]" when calling DefaultApi.list_autocompletes, must be smaller than or equal to 100.'
      end

      if !opts[:'per_page'].nil? && opts[:'per_page'] < 1
        fail ArgumentError, 'invalid value for "opts[:"per_page"]" when calling DefaultApi.list_autocompletes, must be greater than or equal to 1.'
      end

      # resource path
      local_var_path = "/autocompletes".sub('{format}','json')

      # query parameters
      query_params = {}
      query_params[:'type'] = type
      query_params[:'term'] = term
      query_params[:'language'] = opts[:'language'] if !opts[:'language'].nil?
      query_params[:'per_page'] = opts[:'per_page'] if !opts[:'per_page'].nil?

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json', 'text/xml'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/x-www-form-urlencoded'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = ['app_key', 'app_id']
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'Autocompletes')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: DefaultApi#list_autocompletes\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # List coverages
    # This endpoint is used for finding story coverages based on the parameters provided. The maximum number of related stories returned is 100.
    # @param [Hash] opts the optional parameters
    # @option opts [Array<Integer>] :id This parameter is used for finding stories by story id.
    # @option opts [Array<Integer>] :not_id This parameter is used for excluding stories by story id.
    # @option opts [String] :title This parameter is used for finding stories whose title contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
    # @option opts [String] :body This parameter is used for finding stories whose body contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
    # @option opts [String] :text This parameter is used for finding stories whose title or body contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
    # @option opts [Array<String>] :language This parameter is used for finding stories whose language is the specified value. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes.
    # @option opts [Array<String>] :not_language This parameter is used for excluding stories whose language is the specified value. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes.
    # @option opts [String] :published_at_start This parameter is used for finding stories whose published at time is greater than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates).
    # @option opts [String] :published_at_end This parameter is used for finding stories whose published at time is less than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates).
    # @option opts [String] :categories_taxonomy This parameter is used for defining the type of the taxonomy for the rest of the categories queries. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).
    # @option opts [BOOLEAN] :categories_confident This parameter is used for finding stories whose categories are confident. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories). (default to true)
    # @option opts [Array<String>] :categories_id This parameter is used for finding stories by categories id. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).
    # @option opts [Array<String>] :not_categories_id This parameter is used for excluding stories by categories id. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).
    # @option opts [Array<Integer>] :categories_level This parameter is used for finding stories by categories level. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).
    # @option opts [Array<Integer>] :not_categories_level This parameter is used for excluding stories by categories level. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).
    # @option opts [Array<String>] :entities_title_text This parameter is used to find stories based on the specified entities &#x60;text&#x60; in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :not_entities_title_text This parameter is used to exclude stories based on the specified entities &#x60;text&#x60; in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :entities_title_type This parameter is used to find stories based on the specified entities &#x60;type&#x60; in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :not_entities_title_type This parameter is used to exclude stories based on the specified entities &#x60;type&#x60; in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :entities_title_links_dbpedia This parameter is used to find stories based on the specified entities dbpedia URL in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :not_entities_title_links_dbpedia This parameter is used to exclude stories based on the specified entities dbpedia URL in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :entities_body_text This parameter is used to find stories based on the specified entities &#x60;text&#x60; in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :not_entities_body_text This parameter is used to exclude stories based on the specified entities &#x60;text&#x60; in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :entities_body_type This parameter is used to find stories based on the specified entities &#x60;type&#x60; in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :not_entities_body_type This parameter is used to exclude stories based on the specified entities &#x60;type&#x60; in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :entities_body_links_dbpedia This parameter is used to find stories based on the specified entities dbpedia URL in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :not_entities_body_links_dbpedia This parameter is used to exclude stories based on the specified entities dbpedia URL in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [String] :sentiment_title_polarity This parameter is used for finding stories whose title sentiment is the specified value.
    # @option opts [String] :not_sentiment_title_polarity This parameter is used for excluding stories whose title sentiment is the specified value.
    # @option opts [String] :sentiment_body_polarity This parameter is used for finding stories whose body sentiment is the specified value.
    # @option opts [String] :not_sentiment_body_polarity This parameter is used for excluding stories whose body sentiment is the specified value.
    # @option opts [Integer] :media_images_count_min This parameter is used for finding stories whose number of images is greater than or equal to the specified value.
    # @option opts [Integer] :media_images_count_max This parameter is used for finding stories whose number of images is less than or equal to the specified value.
    # @option opts [Integer] :media_images_width_min This parameter is used for finding stories whose width of images are greater than or equal to the specified value.
    # @option opts [Integer] :media_images_width_max This parameter is used for finding stories whose width of images are less than or equal to the specified value.
    # @option opts [Integer] :media_images_height_min This parameter is used for finding stories whose height of images are greater than or equal to the specified value.
    # @option opts [Integer] :media_images_height_max This parameter is used for finding stories whose height of images are less than or equal to the specified value.
    # @option opts [Integer] :media_images_content_length_min This parameter is used for finding stories whose images content length are greater than or equal to the specified value.
    # @option opts [Integer] :media_images_content_length_max This parameter is used for finding stories whose images content length are less than or equal to the specified value.
    # @option opts [Array<String>] :media_images_format This parameter is used for finding stories whose images format are the specified value.
    # @option opts [Array<String>] :not_media_images_format This parameter is used for excluding stories whose images format are the specified value.
    # @option opts [Integer] :media_videos_count_min This parameter is used for finding stories whose number of videos is greater than or equal to the specified value.
    # @option opts [Integer] :media_videos_count_max This parameter is used for finding stories whose number of videos is less than or equal to the specified value.
    # @option opts [Array<Integer>] :author_id This parameter is used for finding stories whose author id is the specified value.
    # @option opts [Array<Integer>] :not_author_id This parameter is used for excluding stories whose author id is the specified value.
    # @option opts [String] :author_name This parameter is used for finding stories whose author full name contains the specified value.
    # @option opts [String] :not_author_name This parameter is used for excluding stories whose author full name contains the specified value.
    # @option opts [Array<Integer>] :source_id This parameter is used for finding stories whose source id is the specified value.
    # @option opts [Array<Integer>] :not_source_id This parameter is used for excluding stories whose source id is the specified value.
    # @option opts [Array<String>] :source_name This parameter is used for finding stories whose source name contains the specified value.
    # @option opts [Array<String>] :not_source_name This parameter is used for excluding stories whose source name contains the specified value.
    # @option opts [Array<String>] :source_domain This parameter is used for finding stories whose source domain is the specified value.
    # @option opts [Array<String>] :not_source_domain This parameter is used for excluding stories whose source domain is the specified value.
    # @option opts [Array<String>] :source_locations_country This parameter is used for finding stories whose source country is the specified value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :not_source_locations_country This parameter is used for excluding stories whose source country is the specified value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_locations_state This parameter is used for finding stories whose source state/province is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :not_source_locations_state This parameter is used for excluding stories whose source state/province is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_locations_city This parameter is used for finding stories whose source city is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :not_source_locations_city This parameter is used for excluding stories whose source city is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_scopes_country This parameter is used for finding stories whose source scopes  is the specified country value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :not_source_scopes_country This parameter is used for excluding stories whose source scopes  is the specified country value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_scopes_state This parameter is used for finding stories whose source scopes is the specified state/province value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :not_source_scopes_state This parameter is used for excluding stories whose source scopes is the specified state/province value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_scopes_city This parameter is used for finding stories whose source scopes is the specified city value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :not_source_scopes_city This parameter is used for excluding stories whose source scopes is the specified city value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_scopes_level This parameter is used for finding stories whose source scopes  is the specified level value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :not_source_scopes_level This parameter is used for excluding stories whose source scopes  is the specified level value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Integer] :source_links_in_count_min This parameter is used for finding stories from sources whose Links in count is greater than or equal to the specified value. You can read more about working with Links in count [here](https://newsapi.aylien.com/docs/working-with-links-in-count).
    # @option opts [Integer] :source_links_in_count_max This parameter is used for finding stories from sources whose Links in count is less than or equal to the specified value. You can read more about working with Links in count [here](https://newsapi.aylien.com/docs/working-with-links-in-count).
    # @option opts [Integer] :source_rankings_alexa_rank_min This parameter is used for finding stories from sources whose Alexa rank is greater than or equal to the specified value. You can read more about working with Alexa ranks [here](https://newsapi.aylien.com/docs/working-with-alexa-ranks).
    # @option opts [Integer] :source_rankings_alexa_rank_max This parameter is used for finding stories from sources whose Alexa rank is less than or equal to the specified value. You can read more about working with Alexa ranks [here](https://newsapi.aylien.com/docs/working-with-alexa-ranks).
    # @option opts [Array<String>] :source_rankings_alexa_country This parameter is used for finding stories from sources whose Alexa rank is in the specified country value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. You can read more about working with Alexa ranks [here](https://newsapi.aylien.com/docs/working-with-alexa-ranks).
    # @option opts [Integer] :social_shares_count_facebook_min This parameter is used for finding stories whose Facebook social shares count is greater than or equal to the specified value.
    # @option opts [Integer] :social_shares_count_facebook_max This parameter is used for finding stories whose Facebook social shares count is less than or equal to the specified value.
    # @option opts [Integer] :social_shares_count_google_plus_min This parameter is used for finding stories whose Google+ social shares count is greater than or equal to the specified value.
    # @option opts [Integer] :social_shares_count_google_plus_max This parameter is used for finding stories whose Google+ social shares count is less than or equal to the specified value.
    # @option opts [Integer] :social_shares_count_linkedin_min This parameter is used for finding stories whose LinkedIn social shares count is greater than or equal to the specified value.
    # @option opts [Integer] :social_shares_count_linkedin_max This parameter is used for finding stories whose LinkedIn social shares count is less than or equal to the specified value.
    # @option opts [Integer] :social_shares_count_reddit_min This parameter is used for finding stories whose Reddit social shares count is greater than or equal to the specified value.
    # @option opts [Integer] :social_shares_count_reddit_max This parameter is used for finding stories whose Reddit social shares count is less than or equal to the specified value.
    # @option opts [BOOLEAN] :cluster This parameter enables clustering for the returned stories. You can read more about working with clustering [here](https://newsapi.aylien.com/docs/working-with-clustering). (default to false)
    # @option opts [String] :cluster_algorithm This parameter is used for specifying the clustering algorithm you wish to use. It supprts STC, Lingo and [k-means](https://en.wikipedia.org/wiki/K-means_clustering) algorithms. You can read more about working with clustering [here](https://newsapi.aylien.com/docs/working-with-clustering). (default to lingo)
    # @option opts [Array<String>] :_return This parameter is used for specifying return fields.
    # @option opts [Integer] :story_id A story id
    # @option opts [String] :story_url An article or webpage
    # @option opts [String] :story_title Title of the article
    # @option opts [String] :story_body Body of the article
    # @option opts [DateTime] :story_published_at Publish date of the article. If you use a url or title and body of an article for getting coverages, this parameter is required. The format used is a restricted form of the canonical representation of dateTime in the [XML Schema specification (ISO 8601)](https://www.w3.org/TR/xmlschema-2/#dateTime).
    # @option opts [String] :story_language This parameter is used for setting the language of the story. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes. (default to auto)
    # @option opts [Integer] :per_page This parameter is used for specifying number of items in each page. (default to 3)
    # @return [Coverages]
    def list_coverages(opts = {})
      data, _status_code, _headers = list_coverages_with_http_info(opts)
      return data
    end

    # List coverages
    # This endpoint is used for finding story coverages based on the parameters provided. The maximum number of related stories returned is 100.
    # @param [Hash] opts the optional parameters
    # @option opts [Array<Integer>] :id This parameter is used for finding stories by story id.
    # @option opts [Array<Integer>] :not_id This parameter is used for excluding stories by story id.
    # @option opts [String] :title This parameter is used for finding stories whose title contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
    # @option opts [String] :body This parameter is used for finding stories whose body contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
    # @option opts [String] :text This parameter is used for finding stories whose title or body contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
    # @option opts [Array<String>] :language This parameter is used for finding stories whose language is the specified value. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes.
    # @option opts [Array<String>] :not_language This parameter is used for excluding stories whose language is the specified value. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes.
    # @option opts [String] :published_at_start This parameter is used for finding stories whose published at time is greater than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates).
    # @option opts [String] :published_at_end This parameter is used for finding stories whose published at time is less than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates).
    # @option opts [String] :categories_taxonomy This parameter is used for defining the type of the taxonomy for the rest of the categories queries. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).
    # @option opts [BOOLEAN] :categories_confident This parameter is used for finding stories whose categories are confident. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).
    # @option opts [Array<String>] :categories_id This parameter is used for finding stories by categories id. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).
    # @option opts [Array<String>] :not_categories_id This parameter is used for excluding stories by categories id. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).
    # @option opts [Array<Integer>] :categories_level This parameter is used for finding stories by categories level. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).
    # @option opts [Array<Integer>] :not_categories_level This parameter is used for excluding stories by categories level. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).
    # @option opts [Array<String>] :entities_title_text This parameter is used to find stories based on the specified entities &#x60;text&#x60; in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :not_entities_title_text This parameter is used to exclude stories based on the specified entities &#x60;text&#x60; in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :entities_title_type This parameter is used to find stories based on the specified entities &#x60;type&#x60; in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :not_entities_title_type This parameter is used to exclude stories based on the specified entities &#x60;type&#x60; in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :entities_title_links_dbpedia This parameter is used to find stories based on the specified entities dbpedia URL in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :not_entities_title_links_dbpedia This parameter is used to exclude stories based on the specified entities dbpedia URL in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :entities_body_text This parameter is used to find stories based on the specified entities &#x60;text&#x60; in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :not_entities_body_text This parameter is used to exclude stories based on the specified entities &#x60;text&#x60; in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :entities_body_type This parameter is used to find stories based on the specified entities &#x60;type&#x60; in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :not_entities_body_type This parameter is used to exclude stories based on the specified entities &#x60;type&#x60; in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :entities_body_links_dbpedia This parameter is used to find stories based on the specified entities dbpedia URL in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :not_entities_body_links_dbpedia This parameter is used to exclude stories based on the specified entities dbpedia URL in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [String] :sentiment_title_polarity This parameter is used for finding stories whose title sentiment is the specified value.
    # @option opts [String] :not_sentiment_title_polarity This parameter is used for excluding stories whose title sentiment is the specified value.
    # @option opts [String] :sentiment_body_polarity This parameter is used for finding stories whose body sentiment is the specified value.
    # @option opts [String] :not_sentiment_body_polarity This parameter is used for excluding stories whose body sentiment is the specified value.
    # @option opts [Integer] :media_images_count_min This parameter is used for finding stories whose number of images is greater than or equal to the specified value.
    # @option opts [Integer] :media_images_count_max This parameter is used for finding stories whose number of images is less than or equal to the specified value.
    # @option opts [Integer] :media_images_width_min This parameter is used for finding stories whose width of images are greater than or equal to the specified value.
    # @option opts [Integer] :media_images_width_max This parameter is used for finding stories whose width of images are less than or equal to the specified value.
    # @option opts [Integer] :media_images_height_min This parameter is used for finding stories whose height of images are greater than or equal to the specified value.
    # @option opts [Integer] :media_images_height_max This parameter is used for finding stories whose height of images are less than or equal to the specified value.
    # @option opts [Integer] :media_images_content_length_min This parameter is used for finding stories whose images content length are greater than or equal to the specified value.
    # @option opts [Integer] :media_images_content_length_max This parameter is used for finding stories whose images content length are less than or equal to the specified value.
    # @option opts [Array<String>] :media_images_format This parameter is used for finding stories whose images format are the specified value.
    # @option opts [Array<String>] :not_media_images_format This parameter is used for excluding stories whose images format are the specified value.
    # @option opts [Integer] :media_videos_count_min This parameter is used for finding stories whose number of videos is greater than or equal to the specified value.
    # @option opts [Integer] :media_videos_count_max This parameter is used for finding stories whose number of videos is less than or equal to the specified value.
    # @option opts [Array<Integer>] :author_id This parameter is used for finding stories whose author id is the specified value.
    # @option opts [Array<Integer>] :not_author_id This parameter is used for excluding stories whose author id is the specified value.
    # @option opts [String] :author_name This parameter is used for finding stories whose author full name contains the specified value.
    # @option opts [String] :not_author_name This parameter is used for excluding stories whose author full name contains the specified value.
    # @option opts [Array<Integer>] :source_id This parameter is used for finding stories whose source id is the specified value.
    # @option opts [Array<Integer>] :not_source_id This parameter is used for excluding stories whose source id is the specified value.
    # @option opts [Array<String>] :source_name This parameter is used for finding stories whose source name contains the specified value.
    # @option opts [Array<String>] :not_source_name This parameter is used for excluding stories whose source name contains the specified value.
    # @option opts [Array<String>] :source_domain This parameter is used for finding stories whose source domain is the specified value.
    # @option opts [Array<String>] :not_source_domain This parameter is used for excluding stories whose source domain is the specified value.
    # @option opts [Array<String>] :source_locations_country This parameter is used for finding stories whose source country is the specified value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :not_source_locations_country This parameter is used for excluding stories whose source country is the specified value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_locations_state This parameter is used for finding stories whose source state/province is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :not_source_locations_state This parameter is used for excluding stories whose source state/province is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_locations_city This parameter is used for finding stories whose source city is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :not_source_locations_city This parameter is used for excluding stories whose source city is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_scopes_country This parameter is used for finding stories whose source scopes  is the specified country value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :not_source_scopes_country This parameter is used for excluding stories whose source scopes  is the specified country value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_scopes_state This parameter is used for finding stories whose source scopes is the specified state/province value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :not_source_scopes_state This parameter is used for excluding stories whose source scopes is the specified state/province value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_scopes_city This parameter is used for finding stories whose source scopes is the specified city value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :not_source_scopes_city This parameter is used for excluding stories whose source scopes is the specified city value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_scopes_level This parameter is used for finding stories whose source scopes  is the specified level value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :not_source_scopes_level This parameter is used for excluding stories whose source scopes  is the specified level value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Integer] :source_links_in_count_min This parameter is used for finding stories from sources whose Links in count is greater than or equal to the specified value. You can read more about working with Links in count [here](https://newsapi.aylien.com/docs/working-with-links-in-count).
    # @option opts [Integer] :source_links_in_count_max This parameter is used for finding stories from sources whose Links in count is less than or equal to the specified value. You can read more about working with Links in count [here](https://newsapi.aylien.com/docs/working-with-links-in-count).
    # @option opts [Integer] :source_rankings_alexa_rank_min This parameter is used for finding stories from sources whose Alexa rank is greater than or equal to the specified value. You can read more about working with Alexa ranks [here](https://newsapi.aylien.com/docs/working-with-alexa-ranks).
    # @option opts [Integer] :source_rankings_alexa_rank_max This parameter is used for finding stories from sources whose Alexa rank is less than or equal to the specified value. You can read more about working with Alexa ranks [here](https://newsapi.aylien.com/docs/working-with-alexa-ranks).
    # @option opts [Array<String>] :source_rankings_alexa_country This parameter is used for finding stories from sources whose Alexa rank is in the specified country value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. You can read more about working with Alexa ranks [here](https://newsapi.aylien.com/docs/working-with-alexa-ranks).
    # @option opts [Integer] :social_shares_count_facebook_min This parameter is used for finding stories whose Facebook social shares count is greater than or equal to the specified value.
    # @option opts [Integer] :social_shares_count_facebook_max This parameter is used for finding stories whose Facebook social shares count is less than or equal to the specified value.
    # @option opts [Integer] :social_shares_count_google_plus_min This parameter is used for finding stories whose Google+ social shares count is greater than or equal to the specified value.
    # @option opts [Integer] :social_shares_count_google_plus_max This parameter is used for finding stories whose Google+ social shares count is less than or equal to the specified value.
    # @option opts [Integer] :social_shares_count_linkedin_min This parameter is used for finding stories whose LinkedIn social shares count is greater than or equal to the specified value.
    # @option opts [Integer] :social_shares_count_linkedin_max This parameter is used for finding stories whose LinkedIn social shares count is less than or equal to the specified value.
    # @option opts [Integer] :social_shares_count_reddit_min This parameter is used for finding stories whose Reddit social shares count is greater than or equal to the specified value.
    # @option opts [Integer] :social_shares_count_reddit_max This parameter is used for finding stories whose Reddit social shares count is less than or equal to the specified value.
    # @option opts [BOOLEAN] :cluster This parameter enables clustering for the returned stories. You can read more about working with clustering [here](https://newsapi.aylien.com/docs/working-with-clustering).
    # @option opts [String] :cluster_algorithm This parameter is used for specifying the clustering algorithm you wish to use. It supprts STC, Lingo and [k-means](https://en.wikipedia.org/wiki/K-means_clustering) algorithms. You can read more about working with clustering [here](https://newsapi.aylien.com/docs/working-with-clustering).
    # @option opts [Array<String>] :_return This parameter is used for specifying return fields.
    # @option opts [Integer] :story_id A story id
    # @option opts [String] :story_url An article or webpage
    # @option opts [String] :story_title Title of the article
    # @option opts [String] :story_body Body of the article
    # @option opts [DateTime] :story_published_at Publish date of the article. If you use a url or title and body of an article for getting coverages, this parameter is required. The format used is a restricted form of the canonical representation of dateTime in the [XML Schema specification (ISO 8601)](https://www.w3.org/TR/xmlschema-2/#dateTime).
    # @option opts [String] :story_language This parameter is used for setting the language of the story. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes.
    # @option opts [Integer] :per_page This parameter is used for specifying number of items in each page.
    # @return [Array<(Coverages, Fixnum, Hash)>] Coverages data, response status code and response headers
    def list_coverages_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: DefaultApi.list_coverages ..."
      end
      if opts[:'language'] && !opts[:'language'].all?{|item| ['en', 'de', 'fr', 'it', 'es', 'pt'].include?(item)}
        fail ArgumentError, 'invalid value for "language", must include one of en, de, fr, it, es, pt'
      end
      if opts[:'not_language'] && !opts[:'not_language'].all?{|item| ['en', 'de', 'fr', 'it', 'es', 'pt'].include?(item)}
        fail ArgumentError, 'invalid value for "not_language", must include one of en, de, fr, it, es, pt'
      end
      if opts[:'categories_taxonomy'] && !['iab-qag', 'iptc-subjectcode'].include?(opts[:'categories_taxonomy'])
        fail ArgumentError, 'invalid value for "categories_taxonomy", must be one of iab-qag, iptc-subjectcode'
      end
      if opts[:'sentiment_title_polarity'] && !['positive', 'neutral', 'negative'].include?(opts[:'sentiment_title_polarity'])
        fail ArgumentError, 'invalid value for "sentiment_title_polarity", must be one of positive, neutral, negative'
      end
      if opts[:'not_sentiment_title_polarity'] && !['positive', 'neutral', 'negative'].include?(opts[:'not_sentiment_title_polarity'])
        fail ArgumentError, 'invalid value for "not_sentiment_title_polarity", must be one of positive, neutral, negative'
      end
      if opts[:'sentiment_body_polarity'] && !['positive', 'neutral', 'negative'].include?(opts[:'sentiment_body_polarity'])
        fail ArgumentError, 'invalid value for "sentiment_body_polarity", must be one of positive, neutral, negative'
      end
      if opts[:'not_sentiment_body_polarity'] && !['positive', 'neutral', 'negative'].include?(opts[:'not_sentiment_body_polarity'])
        fail ArgumentError, 'invalid value for "not_sentiment_body_polarity", must be one of positive, neutral, negative'
      end
      if !opts[:'media_images_count_min'].nil? && opts[:'media_images_count_min'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"media_images_count_min"]" when calling DefaultApi.list_coverages, must be greater than 0.'
      end

      if !opts[:'media_images_count_max'].nil? && opts[:'media_images_count_max'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"media_images_count_max"]" when calling DefaultApi.list_coverages, must be greater than 0.'
      end

      if !opts[:'media_images_width_min'].nil? && opts[:'media_images_width_min'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"media_images_width_min"]" when calling DefaultApi.list_coverages, must be greater than 0.'
      end

      if !opts[:'media_images_width_max'].nil? && opts[:'media_images_width_max'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"media_images_width_max"]" when calling DefaultApi.list_coverages, must be greater than 0.'
      end

      if !opts[:'media_images_height_min'].nil? && opts[:'media_images_height_min'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"media_images_height_min"]" when calling DefaultApi.list_coverages, must be greater than 0.'
      end

      if !opts[:'media_images_height_max'].nil? && opts[:'media_images_height_max'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"media_images_height_max"]" when calling DefaultApi.list_coverages, must be greater than 0.'
      end

      if !opts[:'media_images_content_length_min'].nil? && opts[:'media_images_content_length_min'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"media_images_content_length_min"]" when calling DefaultApi.list_coverages, must be greater than 0.'
      end

      if !opts[:'media_images_content_length_max'].nil? && opts[:'media_images_content_length_max'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"media_images_content_length_max"]" when calling DefaultApi.list_coverages, must be greater than 0.'
      end

      if opts[:'media_images_format'] && !opts[:'media_images_format'].all?{|item| ['BMP', 'GIF', 'JPEG', 'PNG', 'TIFF', 'PSD', 'ICO', 'CUR', 'WEBP', 'SVG'].include?(item)}
        fail ArgumentError, 'invalid value for "media_images_format", must include one of BMP, GIF, JPEG, PNG, TIFF, PSD, ICO, CUR, WEBP, SVG'
      end
      if opts[:'not_media_images_format'] && !opts[:'not_media_images_format'].all?{|item| ['BMP', 'GIF', 'JPEG', 'PNG', 'TIFF', 'PSD', 'ICO', 'CUR', 'WEBP', 'SVG'].include?(item)}
        fail ArgumentError, 'invalid value for "not_media_images_format", must include one of BMP, GIF, JPEG, PNG, TIFF, PSD, ICO, CUR, WEBP, SVG'
      end
      if !opts[:'media_videos_count_min'].nil? && opts[:'media_videos_count_min'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"media_videos_count_min"]" when calling DefaultApi.list_coverages, must be greater than 0.'
      end

      if !opts[:'media_videos_count_max'].nil? && opts[:'media_videos_count_max'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"media_videos_count_max"]" when calling DefaultApi.list_coverages, must be greater than 0.'
      end

      if opts[:'source_scopes_level'] && !opts[:'source_scopes_level'].all?{|item| ['international', 'national', 'local'].include?(item)}
        fail ArgumentError, 'invalid value for "source_scopes_level", must include one of international, national, local'
      end
      if opts[:'not_source_scopes_level'] && !opts[:'not_source_scopes_level'].all?{|item| ['international', 'national', 'local'].include?(item)}
        fail ArgumentError, 'invalid value for "not_source_scopes_level", must include one of international, national, local'
      end
      if !opts[:'source_links_in_count_min'].nil? && opts[:'source_links_in_count_min'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"source_links_in_count_min"]" when calling DefaultApi.list_coverages, must be greater than 0.'
      end

      if !opts[:'source_links_in_count_max'].nil? && opts[:'source_links_in_count_max'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"source_links_in_count_max"]" when calling DefaultApi.list_coverages, must be greater than 0.'
      end

      if !opts[:'source_rankings_alexa_rank_min'].nil? && opts[:'source_rankings_alexa_rank_min'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"source_rankings_alexa_rank_min"]" when calling DefaultApi.list_coverages, must be greater than 0.'
      end

      if !opts[:'source_rankings_alexa_rank_max'].nil? && opts[:'source_rankings_alexa_rank_max'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"source_rankings_alexa_rank_max"]" when calling DefaultApi.list_coverages, must be greater than 0.'
      end

      if !opts[:'social_shares_count_facebook_min'].nil? && opts[:'social_shares_count_facebook_min'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"social_shares_count_facebook_min"]" when calling DefaultApi.list_coverages, must be greater than 0.'
      end

      if !opts[:'social_shares_count_facebook_max'].nil? && opts[:'social_shares_count_facebook_max'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"social_shares_count_facebook_max"]" when calling DefaultApi.list_coverages, must be greater than 0.'
      end

      if !opts[:'social_shares_count_google_plus_min'].nil? && opts[:'social_shares_count_google_plus_min'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"social_shares_count_google_plus_min"]" when calling DefaultApi.list_coverages, must be greater than 0.'
      end

      if !opts[:'social_shares_count_google_plus_max'].nil? && opts[:'social_shares_count_google_plus_max'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"social_shares_count_google_plus_max"]" when calling DefaultApi.list_coverages, must be greater than 0.'
      end

      if !opts[:'social_shares_count_linkedin_min'].nil? && opts[:'social_shares_count_linkedin_min'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"social_shares_count_linkedin_min"]" when calling DefaultApi.list_coverages, must be greater than 0.'
      end

      if !opts[:'social_shares_count_linkedin_max'].nil? && opts[:'social_shares_count_linkedin_max'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"social_shares_count_linkedin_max"]" when calling DefaultApi.list_coverages, must be greater than 0.'
      end

      if !opts[:'social_shares_count_reddit_min'].nil? && opts[:'social_shares_count_reddit_min'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"social_shares_count_reddit_min"]" when calling DefaultApi.list_coverages, must be greater than 0.'
      end

      if !opts[:'social_shares_count_reddit_max'].nil? && opts[:'social_shares_count_reddit_max'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"social_shares_count_reddit_max"]" when calling DefaultApi.list_coverages, must be greater than 0.'
      end

      if opts[:'cluster_algorithm'] && !['stc', 'lingo', 'kmeans'].include?(opts[:'cluster_algorithm'])
        fail ArgumentError, 'invalid value for "cluster_algorithm", must be one of stc, lingo, kmeans'
      end
      if opts[:'_return'] && !opts[:'_return'].all?{|item| ['id', 'title', 'body', 'summary', 'source', 'author', 'entities', 'keywords', 'hashtags', 'characters_count', 'words_count', 'sentences_count', 'paragraphs_count', 'categories', 'social_shares_count', 'media', 'sentiment', 'language', 'published_at', 'links'].include?(item)}
        fail ArgumentError, 'invalid value for "_return", must include one of id, title, body, summary, source, author, entities, keywords, hashtags, characters_count, words_count, sentences_count, paragraphs_count, categories, social_shares_count, media, sentiment, language, published_at, links'
      end
      if opts[:'story_language'] && !['auto', 'en', 'de', 'fr', 'it', 'es', 'pt'].include?(opts[:'story_language'])
        fail ArgumentError, 'invalid value for "story_language", must be one of auto, en, de, fr, it, es, pt'
      end
      if !opts[:'per_page'].nil? && opts[:'per_page'] > 100
        fail ArgumentError, 'invalid value for "opts[:"per_page"]" when calling DefaultApi.list_coverages, must be smaller than or equal to 100.'
      end

      if !opts[:'per_page'].nil? && opts[:'per_page'] < 1
        fail ArgumentError, 'invalid value for "opts[:"per_page"]" when calling DefaultApi.list_coverages, must be greater than or equal to 1.'
      end

      # resource path
      local_var_path = "/coverages".sub('{format}','json')

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json', 'text/xml'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/x-www-form-urlencoded'])

      # form parameters
      form_params = {}
      form_params["id[]"] = @api_client.build_collection_param(opts[:'id'], :multi) if !opts[:'id'].nil?
      form_params["!id[]"] = @api_client.build_collection_param(opts[:'not_id'], :multi) if !opts[:'not_id'].nil?
      form_params["title"] = opts[:'title'] if !opts[:'title'].nil?
      form_params["body"] = opts[:'body'] if !opts[:'body'].nil?
      form_params["text"] = opts[:'text'] if !opts[:'text'].nil?
      form_params["language[]"] = @api_client.build_collection_param(opts[:'language'], :multi) if !opts[:'language'].nil?
      form_params["!language[]"] = @api_client.build_collection_param(opts[:'not_language'], :multi) if !opts[:'not_language'].nil?
      form_params["published_at.start"] = opts[:'published_at_start'] if !opts[:'published_at_start'].nil?
      form_params["published_at.end"] = opts[:'published_at_end'] if !opts[:'published_at_end'].nil?
      form_params["categories.taxonomy"] = opts[:'categories_taxonomy'] if !opts[:'categories_taxonomy'].nil?
      form_params["categories.confident"] = opts[:'categories_confident'] if !opts[:'categories_confident'].nil?
      form_params["categories.id[]"] = @api_client.build_collection_param(opts[:'categories_id'], :multi) if !opts[:'categories_id'].nil?
      form_params["!categories.id[]"] = @api_client.build_collection_param(opts[:'not_categories_id'], :multi) if !opts[:'not_categories_id'].nil?
      form_params["categories.level[]"] = @api_client.build_collection_param(opts[:'categories_level'], :multi) if !opts[:'categories_level'].nil?
      form_params["!categories.level[]"] = @api_client.build_collection_param(opts[:'not_categories_level'], :multi) if !opts[:'not_categories_level'].nil?
      form_params["entities.title.text[]"] = @api_client.build_collection_param(opts[:'entities_title_text'], :multi) if !opts[:'entities_title_text'].nil?
      form_params["!entities.title.text[]"] = @api_client.build_collection_param(opts[:'not_entities_title_text'], :multi) if !opts[:'not_entities_title_text'].nil?
      form_params["entities.title.type[]"] = @api_client.build_collection_param(opts[:'entities_title_type'], :multi) if !opts[:'entities_title_type'].nil?
      form_params["!entities.title.type[]"] = @api_client.build_collection_param(opts[:'not_entities_title_type'], :multi) if !opts[:'not_entities_title_type'].nil?
      form_params["entities.title.links.dbpedia[]"] = @api_client.build_collection_param(opts[:'entities_title_links_dbpedia'], :multi) if !opts[:'entities_title_links_dbpedia'].nil?
      form_params["!entities.title.links.dbpedia[]"] = @api_client.build_collection_param(opts[:'not_entities_title_links_dbpedia'], :multi) if !opts[:'not_entities_title_links_dbpedia'].nil?
      form_params["entities.body.text[]"] = @api_client.build_collection_param(opts[:'entities_body_text'], :multi) if !opts[:'entities_body_text'].nil?
      form_params["!entities.body.text[]"] = @api_client.build_collection_param(opts[:'not_entities_body_text'], :multi) if !opts[:'not_entities_body_text'].nil?
      form_params["entities.body.type[]"] = @api_client.build_collection_param(opts[:'entities_body_type'], :multi) if !opts[:'entities_body_type'].nil?
      form_params["!entities.body.type[]"] = @api_client.build_collection_param(opts[:'not_entities_body_type'], :multi) if !opts[:'not_entities_body_type'].nil?
      form_params["entities.body.links.dbpedia[]"] = @api_client.build_collection_param(opts[:'entities_body_links_dbpedia'], :multi) if !opts[:'entities_body_links_dbpedia'].nil?
      form_params["!entities.body.links.dbpedia[]"] = @api_client.build_collection_param(opts[:'not_entities_body_links_dbpedia'], :multi) if !opts[:'not_entities_body_links_dbpedia'].nil?
      form_params["sentiment.title.polarity"] = opts[:'sentiment_title_polarity'] if !opts[:'sentiment_title_polarity'].nil?
      form_params["!sentiment.title.polarity"] = opts[:'not_sentiment_title_polarity'] if !opts[:'not_sentiment_title_polarity'].nil?
      form_params["sentiment.body.polarity"] = opts[:'sentiment_body_polarity'] if !opts[:'sentiment_body_polarity'].nil?
      form_params["!sentiment.body.polarity"] = opts[:'not_sentiment_body_polarity'] if !opts[:'not_sentiment_body_polarity'].nil?
      form_params["media.images.count.min"] = opts[:'media_images_count_min'] if !opts[:'media_images_count_min'].nil?
      form_params["media.images.count.max"] = opts[:'media_images_count_max'] if !opts[:'media_images_count_max'].nil?
      form_params["media.images.width.min"] = opts[:'media_images_width_min'] if !opts[:'media_images_width_min'].nil?
      form_params["media.images.width.max"] = opts[:'media_images_width_max'] if !opts[:'media_images_width_max'].nil?
      form_params["media.images.height.min"] = opts[:'media_images_height_min'] if !opts[:'media_images_height_min'].nil?
      form_params["media.images.height.max"] = opts[:'media_images_height_max'] if !opts[:'media_images_height_max'].nil?
      form_params["media.images.content_length.min"] = opts[:'media_images_content_length_min'] if !opts[:'media_images_content_length_min'].nil?
      form_params["media.images.content_length.max"] = opts[:'media_images_content_length_max'] if !opts[:'media_images_content_length_max'].nil?
      form_params["media.images.format[]"] = @api_client.build_collection_param(opts[:'media_images_format'], :multi) if !opts[:'media_images_format'].nil?
      form_params["!media.images.format[]"] = @api_client.build_collection_param(opts[:'not_media_images_format'], :multi) if !opts[:'not_media_images_format'].nil?
      form_params["media.videos.count.min"] = opts[:'media_videos_count_min'] if !opts[:'media_videos_count_min'].nil?
      form_params["media.videos.count.max"] = opts[:'media_videos_count_max'] if !opts[:'media_videos_count_max'].nil?
      form_params["author.id[]"] = @api_client.build_collection_param(opts[:'author_id'], :multi) if !opts[:'author_id'].nil?
      form_params["!author.id[]"] = @api_client.build_collection_param(opts[:'not_author_id'], :multi) if !opts[:'not_author_id'].nil?
      form_params["author.name"] = opts[:'author_name'] if !opts[:'author_name'].nil?
      form_params["!author.name"] = opts[:'not_author_name'] if !opts[:'not_author_name'].nil?
      form_params["source.id[]"] = @api_client.build_collection_param(opts[:'source_id'], :multi) if !opts[:'source_id'].nil?
      form_params["!source.id[]"] = @api_client.build_collection_param(opts[:'not_source_id'], :multi) if !opts[:'not_source_id'].nil?
      form_params["source.name[]"] = @api_client.build_collection_param(opts[:'source_name'], :multi) if !opts[:'source_name'].nil?
      form_params["!source.name[]"] = @api_client.build_collection_param(opts[:'not_source_name'], :multi) if !opts[:'not_source_name'].nil?
      form_params["source.domain[]"] = @api_client.build_collection_param(opts[:'source_domain'], :multi) if !opts[:'source_domain'].nil?
      form_params["!source.domain[]"] = @api_client.build_collection_param(opts[:'not_source_domain'], :multi) if !opts[:'not_source_domain'].nil?
      form_params["source.locations.country[]"] = @api_client.build_collection_param(opts[:'source_locations_country'], :multi) if !opts[:'source_locations_country'].nil?
      form_params["!source.locations.country[]"] = @api_client.build_collection_param(opts[:'not_source_locations_country'], :multi) if !opts[:'not_source_locations_country'].nil?
      form_params["source.locations.state[]"] = @api_client.build_collection_param(opts[:'source_locations_state'], :multi) if !opts[:'source_locations_state'].nil?
      form_params["!source.locations.state[]"] = @api_client.build_collection_param(opts[:'not_source_locations_state'], :multi) if !opts[:'not_source_locations_state'].nil?
      form_params["source.locations.city[]"] = @api_client.build_collection_param(opts[:'source_locations_city'], :multi) if !opts[:'source_locations_city'].nil?
      form_params["!source.locations.city[]"] = @api_client.build_collection_param(opts[:'not_source_locations_city'], :multi) if !opts[:'not_source_locations_city'].nil?
      form_params["source.scopes.country[]"] = @api_client.build_collection_param(opts[:'source_scopes_country'], :multi) if !opts[:'source_scopes_country'].nil?
      form_params["!source.scopes.country[]"] = @api_client.build_collection_param(opts[:'not_source_scopes_country'], :multi) if !opts[:'not_source_scopes_country'].nil?
      form_params["source.scopes.state[]"] = @api_client.build_collection_param(opts[:'source_scopes_state'], :multi) if !opts[:'source_scopes_state'].nil?
      form_params["!source.scopes.state[]"] = @api_client.build_collection_param(opts[:'not_source_scopes_state'], :multi) if !opts[:'not_source_scopes_state'].nil?
      form_params["source.scopes.city[]"] = @api_client.build_collection_param(opts[:'source_scopes_city'], :multi) if !opts[:'source_scopes_city'].nil?
      form_params["!source.scopes.city[]"] = @api_client.build_collection_param(opts[:'not_source_scopes_city'], :multi) if !opts[:'not_source_scopes_city'].nil?
      form_params["source.scopes.level[]"] = @api_client.build_collection_param(opts[:'source_scopes_level'], :multi) if !opts[:'source_scopes_level'].nil?
      form_params["!source.scopes.level[]"] = @api_client.build_collection_param(opts[:'not_source_scopes_level'], :multi) if !opts[:'not_source_scopes_level'].nil?
      form_params["source.links_in_count.min"] = opts[:'source_links_in_count_min'] if !opts[:'source_links_in_count_min'].nil?
      form_params["source.links_in_count.max"] = opts[:'source_links_in_count_max'] if !opts[:'source_links_in_count_max'].nil?
      form_params["source.rankings.alexa.rank.min"] = opts[:'source_rankings_alexa_rank_min'] if !opts[:'source_rankings_alexa_rank_min'].nil?
      form_params["source.rankings.alexa.rank.max"] = opts[:'source_rankings_alexa_rank_max'] if !opts[:'source_rankings_alexa_rank_max'].nil?
      form_params["source.rankings.alexa.country[]"] = @api_client.build_collection_param(opts[:'source_rankings_alexa_country'], :multi) if !opts[:'source_rankings_alexa_country'].nil?
      form_params["social_shares_count.facebook.min"] = opts[:'social_shares_count_facebook_min'] if !opts[:'social_shares_count_facebook_min'].nil?
      form_params["social_shares_count.facebook.max"] = opts[:'social_shares_count_facebook_max'] if !opts[:'social_shares_count_facebook_max'].nil?
      form_params["social_shares_count.google_plus.min"] = opts[:'social_shares_count_google_plus_min'] if !opts[:'social_shares_count_google_plus_min'].nil?
      form_params["social_shares_count.google_plus.max"] = opts[:'social_shares_count_google_plus_max'] if !opts[:'social_shares_count_google_plus_max'].nil?
      form_params["social_shares_count.linkedin.min"] = opts[:'social_shares_count_linkedin_min'] if !opts[:'social_shares_count_linkedin_min'].nil?
      form_params["social_shares_count.linkedin.max"] = opts[:'social_shares_count_linkedin_max'] if !opts[:'social_shares_count_linkedin_max'].nil?
      form_params["social_shares_count.reddit.min"] = opts[:'social_shares_count_reddit_min'] if !opts[:'social_shares_count_reddit_min'].nil?
      form_params["social_shares_count.reddit.max"] = opts[:'social_shares_count_reddit_max'] if !opts[:'social_shares_count_reddit_max'].nil?
      form_params["cluster"] = opts[:'cluster'] if !opts[:'cluster'].nil?
      form_params["cluster.algorithm"] = opts[:'cluster_algorithm'] if !opts[:'cluster_algorithm'].nil?
      form_params["return[]"] = @api_client.build_collection_param(opts[:'_return'], :multi) if !opts[:'_return'].nil?
      form_params["story_id"] = opts[:'story_id'] if !opts[:'story_id'].nil?
      form_params["story_url"] = opts[:'story_url'] if !opts[:'story_url'].nil?
      form_params["story_title"] = opts[:'story_title'] if !opts[:'story_title'].nil?
      form_params["story_body"] = opts[:'story_body'] if !opts[:'story_body'].nil?
      form_params["story_published_at"] = opts[:'story_published_at'] if !opts[:'story_published_at'].nil?
      form_params["story_language"] = opts[:'story_language'] if !opts[:'story_language'].nil?
      form_params["per_page"] = opts[:'per_page'] if !opts[:'per_page'].nil?

      # http body (model)
      post_body = nil
      auth_names = ['app_key', 'app_id']
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'Coverages')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: DefaultApi#list_coverages\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # List histograms
    # This endpoint is used for getting histograms based on the `field` parameter passed to the API.
    # @param [Hash] opts the optional parameters
    # @option opts [Array<Integer>] :id This parameter is used for finding stories by story id.
    # @option opts [Array<Integer>] :not_id This parameter is used for excluding stories by story id.
    # @option opts [String] :title This parameter is used for finding stories whose title contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
    # @option opts [String] :body This parameter is used for finding stories whose body contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
    # @option opts [String] :text This parameter is used for finding stories whose title or body contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
    # @option opts [Array<String>] :language This parameter is used for finding stories whose language is the specified value. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes.
    # @option opts [Array<String>] :not_language This parameter is used for excluding stories whose language is the specified value. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes.
    # @option opts [String] :published_at_start This parameter is used for finding stories whose published at time is greater than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates).
    # @option opts [String] :published_at_end This parameter is used for finding stories whose published at time is less than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates).
    # @option opts [String] :categories_taxonomy This parameter is used for defining the type of the taxonomy for the rest of the categories queries. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).
    # @option opts [BOOLEAN] :categories_confident This parameter is used for finding stories whose categories are confident. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories). (default to true)
    # @option opts [Array<String>] :categories_id This parameter is used for finding stories by categories id. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).
    # @option opts [Array<String>] :not_categories_id This parameter is used for excluding stories by categories id. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).
    # @option opts [Array<Integer>] :categories_level This parameter is used for finding stories by categories level. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).
    # @option opts [Array<Integer>] :not_categories_level This parameter is used for excluding stories by categories level. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).
    # @option opts [Array<String>] :entities_title_text This parameter is used to find stories based on the specified entities &#x60;text&#x60; in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :not_entities_title_text This parameter is used to exclude stories based on the specified entities &#x60;text&#x60; in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :entities_title_type This parameter is used to find stories based on the specified entities &#x60;type&#x60; in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :not_entities_title_type This parameter is used to exclude stories based on the specified entities &#x60;type&#x60; in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :entities_title_links_dbpedia This parameter is used to find stories based on the specified entities dbpedia URL in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :not_entities_title_links_dbpedia This parameter is used to exclude stories based on the specified entities dbpedia URL in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :entities_body_text This parameter is used to find stories based on the specified entities &#x60;text&#x60; in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :not_entities_body_text This parameter is used to exclude stories based on the specified entities &#x60;text&#x60; in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :entities_body_type This parameter is used to find stories based on the specified entities &#x60;type&#x60; in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :not_entities_body_type This parameter is used to exclude stories based on the specified entities &#x60;type&#x60; in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :entities_body_links_dbpedia This parameter is used to find stories based on the specified entities dbpedia URL in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :not_entities_body_links_dbpedia This parameter is used to exclude stories based on the specified entities dbpedia URL in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [String] :sentiment_title_polarity This parameter is used for finding stories whose title sentiment is the specified value.
    # @option opts [String] :not_sentiment_title_polarity This parameter is used for excluding stories whose title sentiment is the specified value.
    # @option opts [String] :sentiment_body_polarity This parameter is used for finding stories whose body sentiment is the specified value.
    # @option opts [String] :not_sentiment_body_polarity This parameter is used for excluding stories whose body sentiment is the specified value.
    # @option opts [Integer] :media_images_count_min This parameter is used for finding stories whose number of images is greater than or equal to the specified value.
    # @option opts [Integer] :media_images_count_max This parameter is used for finding stories whose number of images is less than or equal to the specified value.
    # @option opts [Integer] :media_images_width_min This parameter is used for finding stories whose width of images are greater than or equal to the specified value.
    # @option opts [Integer] :media_images_width_max This parameter is used for finding stories whose width of images are less than or equal to the specified value.
    # @option opts [Integer] :media_images_height_min This parameter is used for finding stories whose height of images are greater than or equal to the specified value.
    # @option opts [Integer] :media_images_height_max This parameter is used for finding stories whose height of images are less than or equal to the specified value.
    # @option opts [Integer] :media_images_content_length_min This parameter is used for finding stories whose images content length are greater than or equal to the specified value.
    # @option opts [Integer] :media_images_content_length_max This parameter is used for finding stories whose images content length are less than or equal to the specified value.
    # @option opts [Array<String>] :media_images_format This parameter is used for finding stories whose images format are the specified value.
    # @option opts [Array<String>] :not_media_images_format This parameter is used for excluding stories whose images format are the specified value.
    # @option opts [Integer] :media_videos_count_min This parameter is used for finding stories whose number of videos is greater than or equal to the specified value.
    # @option opts [Integer] :media_videos_count_max This parameter is used for finding stories whose number of videos is less than or equal to the specified value.
    # @option opts [Array<Integer>] :author_id This parameter is used for finding stories whose author id is the specified value.
    # @option opts [Array<Integer>] :not_author_id This parameter is used for excluding stories whose author id is the specified value.
    # @option opts [String] :author_name This parameter is used for finding stories whose author full name contains the specified value.
    # @option opts [String] :not_author_name This parameter is used for excluding stories whose author full name contains the specified value.
    # @option opts [Array<Integer>] :source_id This parameter is used for finding stories whose source id is the specified value.
    # @option opts [Array<Integer>] :not_source_id This parameter is used for excluding stories whose source id is the specified value.
    # @option opts [Array<String>] :source_name This parameter is used for finding stories whose source name contains the specified value.
    # @option opts [Array<String>] :not_source_name This parameter is used for excluding stories whose source name contains the specified value.
    # @option opts [Array<String>] :source_domain This parameter is used for finding stories whose source domain is the specified value.
    # @option opts [Array<String>] :not_source_domain This parameter is used for excluding stories whose source domain is the specified value.
    # @option opts [Array<String>] :source_locations_country This parameter is used for finding stories whose source country is the specified value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :not_source_locations_country This parameter is used for excluding stories whose source country is the specified value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_locations_state This parameter is used for finding stories whose source state/province is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :not_source_locations_state This parameter is used for excluding stories whose source state/province is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_locations_city This parameter is used for finding stories whose source city is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :not_source_locations_city This parameter is used for excluding stories whose source city is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_scopes_country This parameter is used for finding stories whose source scopes is the specified country value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :not_source_scopes_country This parameter is used for excluding stories whose source scopes is the specified country value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_scopes_state This parameter is used for finding stories whose source scopes is the specified state/province value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :not_source_scopes_state This parameter is used for excluding stories whose source scopes is the specified state/province value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_scopes_city This parameter is used for finding stories whose source scopes is the specified city value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :not_source_scopes_city This parameter is used for excluding stories whose source scopes is the specified city value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_scopes_level This parameter is used for finding stories whose source scopes is the specified level value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :not_source_scopes_level This parameter is used for excluding stories whose source scopes is the specified level value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Integer] :source_links_in_count_min This parameter is used for finding stories from sources whose Links in count is greater than or equal to the specified value. You can read more about working with Links in count [here](https://newsapi.aylien.com/docs/working-with-links-in-count).
    # @option opts [Integer] :source_links_in_count_max This parameter is used for finding stories from sources whose Links in count is less than or equal to the specified value. You can read more about working with Links in count [here](https://newsapi.aylien.com/docs/working-with-links-in-count).
    # @option opts [Integer] :source_rankings_alexa_rank_min This parameter is used for finding stories from sources whose Alexa rank is greater than or equal to the specified value. You can read more about working with Alexa ranks [here](https://newsapi.aylien.com/docs/working-with-alexa-ranks).
    # @option opts [Integer] :source_rankings_alexa_rank_max This parameter is used for finding stories from sources whose Alexa rank is less than or equal to the specified value. You can read more about working with Alexa ranks [here](https://newsapi.aylien.com/docs/working-with-alexa-ranks).
    # @option opts [Array<String>] :source_rankings_alexa_country This parameter is used for finding stories from sources whose Alexa rank is in the specified country value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. You can read more about working with Alexa ranks [here](https://newsapi.aylien.com/docs/working-with-alexa-ranks).
    # @option opts [Integer] :social_shares_count_facebook_min This parameter is used for finding stories whose Facebook social shares count is greater than or equal to the specified value.
    # @option opts [Integer] :social_shares_count_facebook_max This parameter is used for finding stories whose Facebook social shares count is less than or equal to the specified value.
    # @option opts [Integer] :social_shares_count_google_plus_min This parameter is used for finding stories whose Google+ social shares count is greater than or equal to the specified value.
    # @option opts [Integer] :social_shares_count_google_plus_max This parameter is used for finding stories whose Google+ social shares count is less than or equal to the specified value.
    # @option opts [Integer] :social_shares_count_linkedin_min This parameter is used for finding stories whose LinkedIn social shares count is greater than or equal to the specified value.
    # @option opts [Integer] :social_shares_count_linkedin_max This parameter is used for finding stories whose LinkedIn social shares count is less than or equal to the specified value.
    # @option opts [Integer] :social_shares_count_reddit_min This parameter is used for finding stories whose Reddit social shares count is greater than or equal to the specified value.
    # @option opts [Integer] :social_shares_count_reddit_max This parameter is used for finding stories whose Reddit social shares count is less than or equal to the specified value.
    # @option opts [Integer] :interval_start This parameter is used for setting the start data point of histogram intervals.
    # @option opts [Integer] :interval_end This parameter is used for setting the end data point of histogram intervals.
    # @option opts [Integer] :interval_width This parameter is used for setting the width of histogram intervals.
    # @option opts [String] :field This parameter is used for specifying the y-axis variable for the histogram. (default to social_shares_count)
    # @return [Histograms]
    def list_histograms(opts = {})
      data, _status_code, _headers = list_histograms_with_http_info(opts)
      return data
    end

    # List histograms
    # This endpoint is used for getting histograms based on the &#x60;field&#x60; parameter passed to the API.
    # @param [Hash] opts the optional parameters
    # @option opts [Array<Integer>] :id This parameter is used for finding stories by story id.
    # @option opts [Array<Integer>] :not_id This parameter is used for excluding stories by story id.
    # @option opts [String] :title This parameter is used for finding stories whose title contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
    # @option opts [String] :body This parameter is used for finding stories whose body contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
    # @option opts [String] :text This parameter is used for finding stories whose title or body contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
    # @option opts [Array<String>] :language This parameter is used for finding stories whose language is the specified value. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes.
    # @option opts [Array<String>] :not_language This parameter is used for excluding stories whose language is the specified value. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes.
    # @option opts [String] :published_at_start This parameter is used for finding stories whose published at time is greater than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates).
    # @option opts [String] :published_at_end This parameter is used for finding stories whose published at time is less than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates).
    # @option opts [String] :categories_taxonomy This parameter is used for defining the type of the taxonomy for the rest of the categories queries. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).
    # @option opts [BOOLEAN] :categories_confident This parameter is used for finding stories whose categories are confident. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).
    # @option opts [Array<String>] :categories_id This parameter is used for finding stories by categories id. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).
    # @option opts [Array<String>] :not_categories_id This parameter is used for excluding stories by categories id. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).
    # @option opts [Array<Integer>] :categories_level This parameter is used for finding stories by categories level. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).
    # @option opts [Array<Integer>] :not_categories_level This parameter is used for excluding stories by categories level. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).
    # @option opts [Array<String>] :entities_title_text This parameter is used to find stories based on the specified entities &#x60;text&#x60; in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :not_entities_title_text This parameter is used to exclude stories based on the specified entities &#x60;text&#x60; in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :entities_title_type This parameter is used to find stories based on the specified entities &#x60;type&#x60; in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :not_entities_title_type This parameter is used to exclude stories based on the specified entities &#x60;type&#x60; in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :entities_title_links_dbpedia This parameter is used to find stories based on the specified entities dbpedia URL in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :not_entities_title_links_dbpedia This parameter is used to exclude stories based on the specified entities dbpedia URL in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :entities_body_text This parameter is used to find stories based on the specified entities &#x60;text&#x60; in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :not_entities_body_text This parameter is used to exclude stories based on the specified entities &#x60;text&#x60; in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :entities_body_type This parameter is used to find stories based on the specified entities &#x60;type&#x60; in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :not_entities_body_type This parameter is used to exclude stories based on the specified entities &#x60;type&#x60; in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :entities_body_links_dbpedia This parameter is used to find stories based on the specified entities dbpedia URL in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :not_entities_body_links_dbpedia This parameter is used to exclude stories based on the specified entities dbpedia URL in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [String] :sentiment_title_polarity This parameter is used for finding stories whose title sentiment is the specified value.
    # @option opts [String] :not_sentiment_title_polarity This parameter is used for excluding stories whose title sentiment is the specified value.
    # @option opts [String] :sentiment_body_polarity This parameter is used for finding stories whose body sentiment is the specified value.
    # @option opts [String] :not_sentiment_body_polarity This parameter is used for excluding stories whose body sentiment is the specified value.
    # @option opts [Integer] :media_images_count_min This parameter is used for finding stories whose number of images is greater than or equal to the specified value.
    # @option opts [Integer] :media_images_count_max This parameter is used for finding stories whose number of images is less than or equal to the specified value.
    # @option opts [Integer] :media_images_width_min This parameter is used for finding stories whose width of images are greater than or equal to the specified value.
    # @option opts [Integer] :media_images_width_max This parameter is used for finding stories whose width of images are less than or equal to the specified value.
    # @option opts [Integer] :media_images_height_min This parameter is used for finding stories whose height of images are greater than or equal to the specified value.
    # @option opts [Integer] :media_images_height_max This parameter is used for finding stories whose height of images are less than or equal to the specified value.
    # @option opts [Integer] :media_images_content_length_min This parameter is used for finding stories whose images content length are greater than or equal to the specified value.
    # @option opts [Integer] :media_images_content_length_max This parameter is used for finding stories whose images content length are less than or equal to the specified value.
    # @option opts [Array<String>] :media_images_format This parameter is used for finding stories whose images format are the specified value.
    # @option opts [Array<String>] :not_media_images_format This parameter is used for excluding stories whose images format are the specified value.
    # @option opts [Integer] :media_videos_count_min This parameter is used for finding stories whose number of videos is greater than or equal to the specified value.
    # @option opts [Integer] :media_videos_count_max This parameter is used for finding stories whose number of videos is less than or equal to the specified value.
    # @option opts [Array<Integer>] :author_id This parameter is used for finding stories whose author id is the specified value.
    # @option opts [Array<Integer>] :not_author_id This parameter is used for excluding stories whose author id is the specified value.
    # @option opts [String] :author_name This parameter is used for finding stories whose author full name contains the specified value.
    # @option opts [String] :not_author_name This parameter is used for excluding stories whose author full name contains the specified value.
    # @option opts [Array<Integer>] :source_id This parameter is used for finding stories whose source id is the specified value.
    # @option opts [Array<Integer>] :not_source_id This parameter is used for excluding stories whose source id is the specified value.
    # @option opts [Array<String>] :source_name This parameter is used for finding stories whose source name contains the specified value.
    # @option opts [Array<String>] :not_source_name This parameter is used for excluding stories whose source name contains the specified value.
    # @option opts [Array<String>] :source_domain This parameter is used for finding stories whose source domain is the specified value.
    # @option opts [Array<String>] :not_source_domain This parameter is used for excluding stories whose source domain is the specified value.
    # @option opts [Array<String>] :source_locations_country This parameter is used for finding stories whose source country is the specified value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :not_source_locations_country This parameter is used for excluding stories whose source country is the specified value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_locations_state This parameter is used for finding stories whose source state/province is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :not_source_locations_state This parameter is used for excluding stories whose source state/province is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_locations_city This parameter is used for finding stories whose source city is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :not_source_locations_city This parameter is used for excluding stories whose source city is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_scopes_country This parameter is used for finding stories whose source scopes is the specified country value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :not_source_scopes_country This parameter is used for excluding stories whose source scopes is the specified country value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_scopes_state This parameter is used for finding stories whose source scopes is the specified state/province value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :not_source_scopes_state This parameter is used for excluding stories whose source scopes is the specified state/province value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_scopes_city This parameter is used for finding stories whose source scopes is the specified city value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :not_source_scopes_city This parameter is used for excluding stories whose source scopes is the specified city value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_scopes_level This parameter is used for finding stories whose source scopes is the specified level value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :not_source_scopes_level This parameter is used for excluding stories whose source scopes is the specified level value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Integer] :source_links_in_count_min This parameter is used for finding stories from sources whose Links in count is greater than or equal to the specified value. You can read more about working with Links in count [here](https://newsapi.aylien.com/docs/working-with-links-in-count).
    # @option opts [Integer] :source_links_in_count_max This parameter is used for finding stories from sources whose Links in count is less than or equal to the specified value. You can read more about working with Links in count [here](https://newsapi.aylien.com/docs/working-with-links-in-count).
    # @option opts [Integer] :source_rankings_alexa_rank_min This parameter is used for finding stories from sources whose Alexa rank is greater than or equal to the specified value. You can read more about working with Alexa ranks [here](https://newsapi.aylien.com/docs/working-with-alexa-ranks).
    # @option opts [Integer] :source_rankings_alexa_rank_max This parameter is used for finding stories from sources whose Alexa rank is less than or equal to the specified value. You can read more about working with Alexa ranks [here](https://newsapi.aylien.com/docs/working-with-alexa-ranks).
    # @option opts [Array<String>] :source_rankings_alexa_country This parameter is used for finding stories from sources whose Alexa rank is in the specified country value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. You can read more about working with Alexa ranks [here](https://newsapi.aylien.com/docs/working-with-alexa-ranks).
    # @option opts [Integer] :social_shares_count_facebook_min This parameter is used for finding stories whose Facebook social shares count is greater than or equal to the specified value.
    # @option opts [Integer] :social_shares_count_facebook_max This parameter is used for finding stories whose Facebook social shares count is less than or equal to the specified value.
    # @option opts [Integer] :social_shares_count_google_plus_min This parameter is used for finding stories whose Google+ social shares count is greater than or equal to the specified value.
    # @option opts [Integer] :social_shares_count_google_plus_max This parameter is used for finding stories whose Google+ social shares count is less than or equal to the specified value.
    # @option opts [Integer] :social_shares_count_linkedin_min This parameter is used for finding stories whose LinkedIn social shares count is greater than or equal to the specified value.
    # @option opts [Integer] :social_shares_count_linkedin_max This parameter is used for finding stories whose LinkedIn social shares count is less than or equal to the specified value.
    # @option opts [Integer] :social_shares_count_reddit_min This parameter is used for finding stories whose Reddit social shares count is greater than or equal to the specified value.
    # @option opts [Integer] :social_shares_count_reddit_max This parameter is used for finding stories whose Reddit social shares count is less than or equal to the specified value.
    # @option opts [Integer] :interval_start This parameter is used for setting the start data point of histogram intervals.
    # @option opts [Integer] :interval_end This parameter is used for setting the end data point of histogram intervals.
    # @option opts [Integer] :interval_width This parameter is used for setting the width of histogram intervals.
    # @option opts [String] :field This parameter is used for specifying the y-axis variable for the histogram.
    # @return [Array<(Histograms, Fixnum, Hash)>] Histograms data, response status code and response headers
    def list_histograms_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: DefaultApi.list_histograms ..."
      end
      if opts[:'language'] && !opts[:'language'].all?{|item| ['en', 'de', 'fr', 'it', 'es', 'pt'].include?(item)}
        fail ArgumentError, 'invalid value for "language", must include one of en, de, fr, it, es, pt'
      end
      if opts[:'not_language'] && !opts[:'not_language'].all?{|item| ['en', 'de', 'fr', 'it', 'es', 'pt'].include?(item)}
        fail ArgumentError, 'invalid value for "not_language", must include one of en, de, fr, it, es, pt'
      end
      if opts[:'categories_taxonomy'] && !['iab-qag', 'iptc-subjectcode'].include?(opts[:'categories_taxonomy'])
        fail ArgumentError, 'invalid value for "categories_taxonomy", must be one of iab-qag, iptc-subjectcode'
      end
      if opts[:'sentiment_title_polarity'] && !['positive', 'neutral', 'negative'].include?(opts[:'sentiment_title_polarity'])
        fail ArgumentError, 'invalid value for "sentiment_title_polarity", must be one of positive, neutral, negative'
      end
      if opts[:'not_sentiment_title_polarity'] && !['positive', 'neutral', 'negative'].include?(opts[:'not_sentiment_title_polarity'])
        fail ArgumentError, 'invalid value for "not_sentiment_title_polarity", must be one of positive, neutral, negative'
      end
      if opts[:'sentiment_body_polarity'] && !['positive', 'neutral', 'negative'].include?(opts[:'sentiment_body_polarity'])
        fail ArgumentError, 'invalid value for "sentiment_body_polarity", must be one of positive, neutral, negative'
      end
      if opts[:'not_sentiment_body_polarity'] && !['positive', 'neutral', 'negative'].include?(opts[:'not_sentiment_body_polarity'])
        fail ArgumentError, 'invalid value for "not_sentiment_body_polarity", must be one of positive, neutral, negative'
      end
      if !opts[:'media_images_count_min'].nil? && opts[:'media_images_count_min'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"media_images_count_min"]" when calling DefaultApi.list_histograms, must be greater than 0.'
      end

      if !opts[:'media_images_count_max'].nil? && opts[:'media_images_count_max'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"media_images_count_max"]" when calling DefaultApi.list_histograms, must be greater than 0.'
      end

      if !opts[:'media_images_width_min'].nil? && opts[:'media_images_width_min'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"media_images_width_min"]" when calling DefaultApi.list_histograms, must be greater than 0.'
      end

      if !opts[:'media_images_width_max'].nil? && opts[:'media_images_width_max'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"media_images_width_max"]" when calling DefaultApi.list_histograms, must be greater than 0.'
      end

      if !opts[:'media_images_height_min'].nil? && opts[:'media_images_height_min'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"media_images_height_min"]" when calling DefaultApi.list_histograms, must be greater than 0.'
      end

      if !opts[:'media_images_height_max'].nil? && opts[:'media_images_height_max'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"media_images_height_max"]" when calling DefaultApi.list_histograms, must be greater than 0.'
      end

      if !opts[:'media_images_content_length_min'].nil? && opts[:'media_images_content_length_min'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"media_images_content_length_min"]" when calling DefaultApi.list_histograms, must be greater than 0.'
      end

      if !opts[:'media_images_content_length_max'].nil? && opts[:'media_images_content_length_max'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"media_images_content_length_max"]" when calling DefaultApi.list_histograms, must be greater than 0.'
      end

      if opts[:'media_images_format'] && !opts[:'media_images_format'].all?{|item| ['BMP', 'GIF', 'JPEG', 'PNG', 'TIFF', 'PSD', 'ICO', 'CUR', 'WEBP', 'SVG'].include?(item)}
        fail ArgumentError, 'invalid value for "media_images_format", must include one of BMP, GIF, JPEG, PNG, TIFF, PSD, ICO, CUR, WEBP, SVG'
      end
      if opts[:'not_media_images_format'] && !opts[:'not_media_images_format'].all?{|item| ['BMP', 'GIF', 'JPEG', 'PNG', 'TIFF', 'PSD', 'ICO', 'CUR', 'WEBP', 'SVG'].include?(item)}
        fail ArgumentError, 'invalid value for "not_media_images_format", must include one of BMP, GIF, JPEG, PNG, TIFF, PSD, ICO, CUR, WEBP, SVG'
      end
      if !opts[:'media_videos_count_min'].nil? && opts[:'media_videos_count_min'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"media_videos_count_min"]" when calling DefaultApi.list_histograms, must be greater than 0.'
      end

      if !opts[:'media_videos_count_max'].nil? && opts[:'media_videos_count_max'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"media_videos_count_max"]" when calling DefaultApi.list_histograms, must be greater than 0.'
      end

      if opts[:'source_scopes_level'] && !opts[:'source_scopes_level'].all?{|item| ['international', 'national', 'local'].include?(item)}
        fail ArgumentError, 'invalid value for "source_scopes_level", must include one of international, national, local'
      end
      if opts[:'not_source_scopes_level'] && !opts[:'not_source_scopes_level'].all?{|item| ['international', 'national', 'local'].include?(item)}
        fail ArgumentError, 'invalid value for "not_source_scopes_level", must include one of international, national, local'
      end
      if !opts[:'source_links_in_count_min'].nil? && opts[:'source_links_in_count_min'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"source_links_in_count_min"]" when calling DefaultApi.list_histograms, must be greater than 0.'
      end

      if !opts[:'source_links_in_count_max'].nil? && opts[:'source_links_in_count_max'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"source_links_in_count_max"]" when calling DefaultApi.list_histograms, must be greater than 0.'
      end

      if !opts[:'source_rankings_alexa_rank_min'].nil? && opts[:'source_rankings_alexa_rank_min'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"source_rankings_alexa_rank_min"]" when calling DefaultApi.list_histograms, must be greater than 0.'
      end

      if !opts[:'source_rankings_alexa_rank_max'].nil? && opts[:'source_rankings_alexa_rank_max'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"source_rankings_alexa_rank_max"]" when calling DefaultApi.list_histograms, must be greater than 0.'
      end

      if !opts[:'social_shares_count_facebook_min'].nil? && opts[:'social_shares_count_facebook_min'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"social_shares_count_facebook_min"]" when calling DefaultApi.list_histograms, must be greater than 0.'
      end

      if !opts[:'social_shares_count_facebook_max'].nil? && opts[:'social_shares_count_facebook_max'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"social_shares_count_facebook_max"]" when calling DefaultApi.list_histograms, must be greater than 0.'
      end

      if !opts[:'social_shares_count_google_plus_min'].nil? && opts[:'social_shares_count_google_plus_min'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"social_shares_count_google_plus_min"]" when calling DefaultApi.list_histograms, must be greater than 0.'
      end

      if !opts[:'social_shares_count_google_plus_max'].nil? && opts[:'social_shares_count_google_plus_max'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"social_shares_count_google_plus_max"]" when calling DefaultApi.list_histograms, must be greater than 0.'
      end

      if !opts[:'social_shares_count_linkedin_min'].nil? && opts[:'social_shares_count_linkedin_min'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"social_shares_count_linkedin_min"]" when calling DefaultApi.list_histograms, must be greater than 0.'
      end

      if !opts[:'social_shares_count_linkedin_max'].nil? && opts[:'social_shares_count_linkedin_max'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"social_shares_count_linkedin_max"]" when calling DefaultApi.list_histograms, must be greater than 0.'
      end

      if !opts[:'social_shares_count_reddit_min'].nil? && opts[:'social_shares_count_reddit_min'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"social_shares_count_reddit_min"]" when calling DefaultApi.list_histograms, must be greater than 0.'
      end

      if !opts[:'social_shares_count_reddit_max'].nil? && opts[:'social_shares_count_reddit_max'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"social_shares_count_reddit_max"]" when calling DefaultApi.list_histograms, must be greater than 0.'
      end

      if opts[:'field'] && !['social_shares_count', 'social_shares_count.facebook', 'social_shares_count.linkedin', 'social_shares_count.reddit', 'social_shares_count.google_plus', 'characters_count', 'words_count', 'sentences_count', 'paragraphs_count', 'media.images.count', 'media.videos.count', 'source.links_in_count', 'source.rankings.alexa.rank', 'source.rankings.alexa.rank.AF', 'source.rankings.alexa.rank.AX', 'source.rankings.alexa.rank.AL', 'source.rankings.alexa.rank.DZ', 'source.rankings.alexa.rank.AS', 'source.rankings.alexa.rank.AD', 'source.rankings.alexa.rank.AO', 'source.rankings.alexa.rank.AI', 'source.rankings.alexa.rank.AQ', 'source.rankings.alexa.rank.AG', 'source.rankings.alexa.rank.AR', 'source.rankings.alexa.rank.AM', 'source.rankings.alexa.rank.AW', 'source.rankings.alexa.rank.AU', 'source.rankings.alexa.rank.AT', 'source.rankings.alexa.rank.AZ', 'source.rankings.alexa.rank.BS', 'source.rankings.alexa.rank.BH', 'source.rankings.alexa.rank.BD', 'source.rankings.alexa.rank.BB', 'source.rankings.alexa.rank.BY', 'source.rankings.alexa.rank.BE', 'source.rankings.alexa.rank.BZ', 'source.rankings.alexa.rank.BJ', 'source.rankings.alexa.rank.BM', 'source.rankings.alexa.rank.BT', 'source.rankings.alexa.rank.BO', 'source.rankings.alexa.rank.BQ', 'source.rankings.alexa.rank.BA', 'source.rankings.alexa.rank.BW', 'source.rankings.alexa.rank.BV', 'source.rankings.alexa.rank.BR', 'source.rankings.alexa.rank.IO', 'source.rankings.alexa.rank.BN', 'source.rankings.alexa.rank.BG', 'source.rankings.alexa.rank.BF', 'source.rankings.alexa.rank.BI', 'source.rankings.alexa.rank.KH', 'source.rankings.alexa.rank.CM', 'source.rankings.alexa.rank.CA', 'source.rankings.alexa.rank.CV', 'source.rankings.alexa.rank.KY', 'source.rankings.alexa.rank.CF', 'source.rankings.alexa.rank.TD', 'source.rankings.alexa.rank.CL', 'source.rankings.alexa.rank.CN', 'source.rankings.alexa.rank.CX', 'source.rankings.alexa.rank.CC', 'source.rankings.alexa.rank.CO', 'source.rankings.alexa.rank.KM', 'source.rankings.alexa.rank.CG', 'source.rankings.alexa.rank.CD', 'source.rankings.alexa.rank.CK', 'source.rankings.alexa.rank.CR', 'source.rankings.alexa.rank.CI', 'source.rankings.alexa.rank.HR', 'source.rankings.alexa.rank.CU', 'source.rankings.alexa.rank.CW', 'source.rankings.alexa.rank.CY', 'source.rankings.alexa.rank.CZ', 'source.rankings.alexa.rank.DK', 'source.rankings.alexa.rank.DJ', 'source.rankings.alexa.rank.DM', 'source.rankings.alexa.rank.DO', 'source.rankings.alexa.rank.EC', 'source.rankings.alexa.rank.EG', 'source.rankings.alexa.rank.SV', 'source.rankings.alexa.rank.GQ', 'source.rankings.alexa.rank.ER', 'source.rankings.alexa.rank.EE', 'source.rankings.alexa.rank.ET', 'source.rankings.alexa.rank.FK', 'source.rankings.alexa.rank.FO', 'source.rankings.alexa.rank.FJ', 'source.rankings.alexa.rank.FI', 'source.rankings.alexa.rank.FR', 'source.rankings.alexa.rank.GF', 'source.rankings.alexa.rank.PF', 'source.rankings.alexa.rank.TF', 'source.rankings.alexa.rank.GA', 'source.rankings.alexa.rank.GM', 'source.rankings.alexa.rank.GE', 'source.rankings.alexa.rank.DE', 'source.rankings.alexa.rank.GH', 'source.rankings.alexa.rank.GI', 'source.rankings.alexa.rank.GR', 'source.rankings.alexa.rank.GL', 'source.rankings.alexa.rank.GD', 'source.rankings.alexa.rank.GP', 'source.rankings.alexa.rank.GU', 'source.rankings.alexa.rank.GT', 'source.rankings.alexa.rank.GG', 'source.rankings.alexa.rank.GN', 'source.rankings.alexa.rank.GW', 'source.rankings.alexa.rank.GY', 'source.rankings.alexa.rank.HT', 'source.rankings.alexa.rank.HM', 'source.rankings.alexa.rank.VA', 'source.rankings.alexa.rank.HN', 'source.rankings.alexa.rank.HK', 'source.rankings.alexa.rank.HU', 'source.rankings.alexa.rank.IS', 'source.rankings.alexa.rank.IN', 'source.rankings.alexa.rank.ID', 'source.rankings.alexa.rank.IR', 'source.rankings.alexa.rank.IQ', 'source.rankings.alexa.rank.IE', 'source.rankings.alexa.rank.IM', 'source.rankings.alexa.rank.IL', 'source.rankings.alexa.rank.IT', 'source.rankings.alexa.rank.JM', 'source.rankings.alexa.rank.JP', 'source.rankings.alexa.rank.JE', 'source.rankings.alexa.rank.JO', 'source.rankings.alexa.rank.KZ', 'source.rankings.alexa.rank.KE', 'source.rankings.alexa.rank.KI', 'source.rankings.alexa.rank.KP', 'source.rankings.alexa.rank.KR', 'source.rankings.alexa.rank.KW', 'source.rankings.alexa.rank.KG', 'source.rankings.alexa.rank.LA', 'source.rankings.alexa.rank.LV', 'source.rankings.alexa.rank.LB', 'source.rankings.alexa.rank.LS', 'source.rankings.alexa.rank.LR', 'source.rankings.alexa.rank.LY', 'source.rankings.alexa.rank.LI', 'source.rankings.alexa.rank.LT', 'source.rankings.alexa.rank.LU', 'source.rankings.alexa.rank.MO', 'source.rankings.alexa.rank.MK', 'source.rankings.alexa.rank.MG', 'source.rankings.alexa.rank.MW', 'source.rankings.alexa.rank.MY', 'source.rankings.alexa.rank.MV', 'source.rankings.alexa.rank.ML', 'source.rankings.alexa.rank.MT', 'source.rankings.alexa.rank.MH', 'source.rankings.alexa.rank.MQ', 'source.rankings.alexa.rank.MR', 'source.rankings.alexa.rank.MU', 'source.rankings.alexa.rank.YT', 'source.rankings.alexa.rank.MX', 'source.rankings.alexa.rank.FM', 'source.rankings.alexa.rank.MD', 'source.rankings.alexa.rank.MC', 'source.rankings.alexa.rank.MN', 'source.rankings.alexa.rank.ME', 'source.rankings.alexa.rank.MS', 'source.rankings.alexa.rank.MA', 'source.rankings.alexa.rank.MZ', 'source.rankings.alexa.rank.MM', 'source.rankings.alexa.rank.NA', 'source.rankings.alexa.rank.NR', 'source.rankings.alexa.rank.NP', 'source.rankings.alexa.rank.NL', 'source.rankings.alexa.rank.NC', 'source.rankings.alexa.rank.NZ', 'source.rankings.alexa.rank.NI', 'source.rankings.alexa.rank.NE', 'source.rankings.alexa.rank.NG', 'source.rankings.alexa.rank.NU', 'source.rankings.alexa.rank.NF', 'source.rankings.alexa.rank.MP', 'source.rankings.alexa.rank.NO', 'source.rankings.alexa.rank.OM', 'source.rankings.alexa.rank.PK', 'source.rankings.alexa.rank.PW', 'source.rankings.alexa.rank.PS', 'source.rankings.alexa.rank.PA', 'source.rankings.alexa.rank.PG', 'source.rankings.alexa.rank.PY', 'source.rankings.alexa.rank.PE', 'source.rankings.alexa.rank.PH', 'source.rankings.alexa.rank.PN', 'source.rankings.alexa.rank.PL', 'source.rankings.alexa.rank.PT', 'source.rankings.alexa.rank.PR', 'source.rankings.alexa.rank.QA', 'source.rankings.alexa.rank.RE', 'source.rankings.alexa.rank.RO', 'source.rankings.alexa.rank.RU', 'source.rankings.alexa.rank.RW', 'source.rankings.alexa.rank.BL', 'source.rankings.alexa.rank.SH', 'source.rankings.alexa.rank.KN', 'source.rankings.alexa.rank.LC', 'source.rankings.alexa.rank.MF', 'source.rankings.alexa.rank.PM', 'source.rankings.alexa.rank.VC', 'source.rankings.alexa.rank.WS', 'source.rankings.alexa.rank.SM', 'source.rankings.alexa.rank.ST', 'source.rankings.alexa.rank.SA', 'source.rankings.alexa.rank.SN', 'source.rankings.alexa.rank.RS', 'source.rankings.alexa.rank.SC', 'source.rankings.alexa.rank.SL', 'source.rankings.alexa.rank.SG', 'source.rankings.alexa.rank.SX', 'source.rankings.alexa.rank.SK', 'source.rankings.alexa.rank.SI', 'source.rankings.alexa.rank.SB', 'source.rankings.alexa.rank.SO', 'source.rankings.alexa.rank.ZA', 'source.rankings.alexa.rank.GS', 'source.rankings.alexa.rank.SS', 'source.rankings.alexa.rank.ES', 'source.rankings.alexa.rank.LK', 'source.rankings.alexa.rank.SD', 'source.rankings.alexa.rank.SR', 'source.rankings.alexa.rank.SJ', 'source.rankings.alexa.rank.SZ', 'source.rankings.alexa.rank.SE', 'source.rankings.alexa.rank.CH', 'source.rankings.alexa.rank.SY', 'source.rankings.alexa.rank.TW', 'source.rankings.alexa.rank.TJ', 'source.rankings.alexa.rank.TZ', 'source.rankings.alexa.rank.TH', 'source.rankings.alexa.rank.TL', 'source.rankings.alexa.rank.TG', 'source.rankings.alexa.rank.TK', 'source.rankings.alexa.rank.TO', 'source.rankings.alexa.rank.TT', 'source.rankings.alexa.rank.TN', 'source.rankings.alexa.rank.TR', 'source.rankings.alexa.rank.TM', 'source.rankings.alexa.rank.TC', 'source.rankings.alexa.rank.TV', 'source.rankings.alexa.rank.UG', 'source.rankings.alexa.rank.UA', 'source.rankings.alexa.rank.AE', 'source.rankings.alexa.rank.GB', 'source.rankings.alexa.rank.US', 'source.rankings.alexa.rank.UM', 'source.rankings.alexa.rank.UY', 'source.rankings.alexa.rank.UZ', 'source.rankings.alexa.rank.VU', 'source.rankings.alexa.rank.VE', 'source.rankings.alexa.rank.VN', 'source.rankings.alexa.rank.VG', 'source.rankings.alexa.rank.VI', 'source.rankings.alexa.rank.WF', 'source.rankings.alexa.rank.EH', 'source.rankings.alexa.rank.YE', 'source.rankings.alexa.rank.ZM', 'source.rankings.alexa.rank.ZW'].include?(opts[:'field'])
        fail ArgumentError, 'invalid value for "field", must be one of social_shares_count, social_shares_count.facebook, social_shares_count.linkedin, social_shares_count.reddit, social_shares_count.google_plus, characters_count, words_count, sentences_count, paragraphs_count, media.images.count, media.videos.count, source.links_in_count, source.rankings.alexa.rank, source.rankings.alexa.rank.AF, source.rankings.alexa.rank.AX, source.rankings.alexa.rank.AL, source.rankings.alexa.rank.DZ, source.rankings.alexa.rank.AS, source.rankings.alexa.rank.AD, source.rankings.alexa.rank.AO, source.rankings.alexa.rank.AI, source.rankings.alexa.rank.AQ, source.rankings.alexa.rank.AG, source.rankings.alexa.rank.AR, source.rankings.alexa.rank.AM, source.rankings.alexa.rank.AW, source.rankings.alexa.rank.AU, source.rankings.alexa.rank.AT, source.rankings.alexa.rank.AZ, source.rankings.alexa.rank.BS, source.rankings.alexa.rank.BH, source.rankings.alexa.rank.BD, source.rankings.alexa.rank.BB, source.rankings.alexa.rank.BY, source.rankings.alexa.rank.BE, source.rankings.alexa.rank.BZ, source.rankings.alexa.rank.BJ, source.rankings.alexa.rank.BM, source.rankings.alexa.rank.BT, source.rankings.alexa.rank.BO, source.rankings.alexa.rank.BQ, source.rankings.alexa.rank.BA, source.rankings.alexa.rank.BW, source.rankings.alexa.rank.BV, source.rankings.alexa.rank.BR, source.rankings.alexa.rank.IO, source.rankings.alexa.rank.BN, source.rankings.alexa.rank.BG, source.rankings.alexa.rank.BF, source.rankings.alexa.rank.BI, source.rankings.alexa.rank.KH, source.rankings.alexa.rank.CM, source.rankings.alexa.rank.CA, source.rankings.alexa.rank.CV, source.rankings.alexa.rank.KY, source.rankings.alexa.rank.CF, source.rankings.alexa.rank.TD, source.rankings.alexa.rank.CL, source.rankings.alexa.rank.CN, source.rankings.alexa.rank.CX, source.rankings.alexa.rank.CC, source.rankings.alexa.rank.CO, source.rankings.alexa.rank.KM, source.rankings.alexa.rank.CG, source.rankings.alexa.rank.CD, source.rankings.alexa.rank.CK, source.rankings.alexa.rank.CR, source.rankings.alexa.rank.CI, source.rankings.alexa.rank.HR, source.rankings.alexa.rank.CU, source.rankings.alexa.rank.CW, source.rankings.alexa.rank.CY, source.rankings.alexa.rank.CZ, source.rankings.alexa.rank.DK, source.rankings.alexa.rank.DJ, source.rankings.alexa.rank.DM, source.rankings.alexa.rank.DO, source.rankings.alexa.rank.EC, source.rankings.alexa.rank.EG, source.rankings.alexa.rank.SV, source.rankings.alexa.rank.GQ, source.rankings.alexa.rank.ER, source.rankings.alexa.rank.EE, source.rankings.alexa.rank.ET, source.rankings.alexa.rank.FK, source.rankings.alexa.rank.FO, source.rankings.alexa.rank.FJ, source.rankings.alexa.rank.FI, source.rankings.alexa.rank.FR, source.rankings.alexa.rank.GF, source.rankings.alexa.rank.PF, source.rankings.alexa.rank.TF, source.rankings.alexa.rank.GA, source.rankings.alexa.rank.GM, source.rankings.alexa.rank.GE, source.rankings.alexa.rank.DE, source.rankings.alexa.rank.GH, source.rankings.alexa.rank.GI, source.rankings.alexa.rank.GR, source.rankings.alexa.rank.GL, source.rankings.alexa.rank.GD, source.rankings.alexa.rank.GP, source.rankings.alexa.rank.GU, source.rankings.alexa.rank.GT, source.rankings.alexa.rank.GG, source.rankings.alexa.rank.GN, source.rankings.alexa.rank.GW, source.rankings.alexa.rank.GY, source.rankings.alexa.rank.HT, source.rankings.alexa.rank.HM, source.rankings.alexa.rank.VA, source.rankings.alexa.rank.HN, source.rankings.alexa.rank.HK, source.rankings.alexa.rank.HU, source.rankings.alexa.rank.IS, source.rankings.alexa.rank.IN, source.rankings.alexa.rank.ID, source.rankings.alexa.rank.IR, source.rankings.alexa.rank.IQ, source.rankings.alexa.rank.IE, source.rankings.alexa.rank.IM, source.rankings.alexa.rank.IL, source.rankings.alexa.rank.IT, source.rankings.alexa.rank.JM, source.rankings.alexa.rank.JP, source.rankings.alexa.rank.JE, source.rankings.alexa.rank.JO, source.rankings.alexa.rank.KZ, source.rankings.alexa.rank.KE, source.rankings.alexa.rank.KI, source.rankings.alexa.rank.KP, source.rankings.alexa.rank.KR, source.rankings.alexa.rank.KW, source.rankings.alexa.rank.KG, source.rankings.alexa.rank.LA, source.rankings.alexa.rank.LV, source.rankings.alexa.rank.LB, source.rankings.alexa.rank.LS, source.rankings.alexa.rank.LR, source.rankings.alexa.rank.LY, source.rankings.alexa.rank.LI, source.rankings.alexa.rank.LT, source.rankings.alexa.rank.LU, source.rankings.alexa.rank.MO, source.rankings.alexa.rank.MK, source.rankings.alexa.rank.MG, source.rankings.alexa.rank.MW, source.rankings.alexa.rank.MY, source.rankings.alexa.rank.MV, source.rankings.alexa.rank.ML, source.rankings.alexa.rank.MT, source.rankings.alexa.rank.MH, source.rankings.alexa.rank.MQ, source.rankings.alexa.rank.MR, source.rankings.alexa.rank.MU, source.rankings.alexa.rank.YT, source.rankings.alexa.rank.MX, source.rankings.alexa.rank.FM, source.rankings.alexa.rank.MD, source.rankings.alexa.rank.MC, source.rankings.alexa.rank.MN, source.rankings.alexa.rank.ME, source.rankings.alexa.rank.MS, source.rankings.alexa.rank.MA, source.rankings.alexa.rank.MZ, source.rankings.alexa.rank.MM, source.rankings.alexa.rank.NA, source.rankings.alexa.rank.NR, source.rankings.alexa.rank.NP, source.rankings.alexa.rank.NL, source.rankings.alexa.rank.NC, source.rankings.alexa.rank.NZ, source.rankings.alexa.rank.NI, source.rankings.alexa.rank.NE, source.rankings.alexa.rank.NG, source.rankings.alexa.rank.NU, source.rankings.alexa.rank.NF, source.rankings.alexa.rank.MP, source.rankings.alexa.rank.NO, source.rankings.alexa.rank.OM, source.rankings.alexa.rank.PK, source.rankings.alexa.rank.PW, source.rankings.alexa.rank.PS, source.rankings.alexa.rank.PA, source.rankings.alexa.rank.PG, source.rankings.alexa.rank.PY, source.rankings.alexa.rank.PE, source.rankings.alexa.rank.PH, source.rankings.alexa.rank.PN, source.rankings.alexa.rank.PL, source.rankings.alexa.rank.PT, source.rankings.alexa.rank.PR, source.rankings.alexa.rank.QA, source.rankings.alexa.rank.RE, source.rankings.alexa.rank.RO, source.rankings.alexa.rank.RU, source.rankings.alexa.rank.RW, source.rankings.alexa.rank.BL, source.rankings.alexa.rank.SH, source.rankings.alexa.rank.KN, source.rankings.alexa.rank.LC, source.rankings.alexa.rank.MF, source.rankings.alexa.rank.PM, source.rankings.alexa.rank.VC, source.rankings.alexa.rank.WS, source.rankings.alexa.rank.SM, source.rankings.alexa.rank.ST, source.rankings.alexa.rank.SA, source.rankings.alexa.rank.SN, source.rankings.alexa.rank.RS, source.rankings.alexa.rank.SC, source.rankings.alexa.rank.SL, source.rankings.alexa.rank.SG, source.rankings.alexa.rank.SX, source.rankings.alexa.rank.SK, source.rankings.alexa.rank.SI, source.rankings.alexa.rank.SB, source.rankings.alexa.rank.SO, source.rankings.alexa.rank.ZA, source.rankings.alexa.rank.GS, source.rankings.alexa.rank.SS, source.rankings.alexa.rank.ES, source.rankings.alexa.rank.LK, source.rankings.alexa.rank.SD, source.rankings.alexa.rank.SR, source.rankings.alexa.rank.SJ, source.rankings.alexa.rank.SZ, source.rankings.alexa.rank.SE, source.rankings.alexa.rank.CH, source.rankings.alexa.rank.SY, source.rankings.alexa.rank.TW, source.rankings.alexa.rank.TJ, source.rankings.alexa.rank.TZ, source.rankings.alexa.rank.TH, source.rankings.alexa.rank.TL, source.rankings.alexa.rank.TG, source.rankings.alexa.rank.TK, source.rankings.alexa.rank.TO, source.rankings.alexa.rank.TT, source.rankings.alexa.rank.TN, source.rankings.alexa.rank.TR, source.rankings.alexa.rank.TM, source.rankings.alexa.rank.TC, source.rankings.alexa.rank.TV, source.rankings.alexa.rank.UG, source.rankings.alexa.rank.UA, source.rankings.alexa.rank.AE, source.rankings.alexa.rank.GB, source.rankings.alexa.rank.US, source.rankings.alexa.rank.UM, source.rankings.alexa.rank.UY, source.rankings.alexa.rank.UZ, source.rankings.alexa.rank.VU, source.rankings.alexa.rank.VE, source.rankings.alexa.rank.VN, source.rankings.alexa.rank.VG, source.rankings.alexa.rank.VI, source.rankings.alexa.rank.WF, source.rankings.alexa.rank.EH, source.rankings.alexa.rank.YE, source.rankings.alexa.rank.ZM, source.rankings.alexa.rank.ZW'
      end
      # resource path
      local_var_path = "/histograms".sub('{format}','json')

      # query parameters
      query_params = {}
      query_params[:'id[]'] = @api_client.build_collection_param(opts[:'id'], :multi) if !opts[:'id'].nil?
      query_params[:'!id[]'] = @api_client.build_collection_param(opts[:'not_id'], :multi) if !opts[:'not_id'].nil?
      query_params[:'title'] = opts[:'title'] if !opts[:'title'].nil?
      query_params[:'body'] = opts[:'body'] if !opts[:'body'].nil?
      query_params[:'text'] = opts[:'text'] if !opts[:'text'].nil?
      query_params[:'language[]'] = @api_client.build_collection_param(opts[:'language'], :multi) if !opts[:'language'].nil?
      query_params[:'!language[]'] = @api_client.build_collection_param(opts[:'not_language'], :multi) if !opts[:'not_language'].nil?
      query_params[:'published_at.start'] = opts[:'published_at_start'] if !opts[:'published_at_start'].nil?
      query_params[:'published_at.end'] = opts[:'published_at_end'] if !opts[:'published_at_end'].nil?
      query_params[:'categories.taxonomy'] = opts[:'categories_taxonomy'] if !opts[:'categories_taxonomy'].nil?
      query_params[:'categories.confident'] = opts[:'categories_confident'] if !opts[:'categories_confident'].nil?
      query_params[:'categories.id[]'] = @api_client.build_collection_param(opts[:'categories_id'], :multi) if !opts[:'categories_id'].nil?
      query_params[:'!categories.id[]'] = @api_client.build_collection_param(opts[:'not_categories_id'], :multi) if !opts[:'not_categories_id'].nil?
      query_params[:'categories.level[]'] = @api_client.build_collection_param(opts[:'categories_level'], :multi) if !opts[:'categories_level'].nil?
      query_params[:'!categories.level[]'] = @api_client.build_collection_param(opts[:'not_categories_level'], :multi) if !opts[:'not_categories_level'].nil?
      query_params[:'entities.title.text[]'] = @api_client.build_collection_param(opts[:'entities_title_text'], :multi) if !opts[:'entities_title_text'].nil?
      query_params[:'!entities.title.text[]'] = @api_client.build_collection_param(opts[:'not_entities_title_text'], :multi) if !opts[:'not_entities_title_text'].nil?
      query_params[:'entities.title.type[]'] = @api_client.build_collection_param(opts[:'entities_title_type'], :multi) if !opts[:'entities_title_type'].nil?
      query_params[:'!entities.title.type[]'] = @api_client.build_collection_param(opts[:'not_entities_title_type'], :multi) if !opts[:'not_entities_title_type'].nil?
      query_params[:'entities.title.links.dbpedia[]'] = @api_client.build_collection_param(opts[:'entities_title_links_dbpedia'], :multi) if !opts[:'entities_title_links_dbpedia'].nil?
      query_params[:'!entities.title.links.dbpedia[]'] = @api_client.build_collection_param(opts[:'not_entities_title_links_dbpedia'], :multi) if !opts[:'not_entities_title_links_dbpedia'].nil?
      query_params[:'entities.body.text[]'] = @api_client.build_collection_param(opts[:'entities_body_text'], :multi) if !opts[:'entities_body_text'].nil?
      query_params[:'!entities.body.text[]'] = @api_client.build_collection_param(opts[:'not_entities_body_text'], :multi) if !opts[:'not_entities_body_text'].nil?
      query_params[:'entities.body.type[]'] = @api_client.build_collection_param(opts[:'entities_body_type'], :multi) if !opts[:'entities_body_type'].nil?
      query_params[:'!entities.body.type[]'] = @api_client.build_collection_param(opts[:'not_entities_body_type'], :multi) if !opts[:'not_entities_body_type'].nil?
      query_params[:'entities.body.links.dbpedia[]'] = @api_client.build_collection_param(opts[:'entities_body_links_dbpedia'], :multi) if !opts[:'entities_body_links_dbpedia'].nil?
      query_params[:'!entities.body.links.dbpedia[]'] = @api_client.build_collection_param(opts[:'not_entities_body_links_dbpedia'], :multi) if !opts[:'not_entities_body_links_dbpedia'].nil?
      query_params[:'sentiment.title.polarity'] = opts[:'sentiment_title_polarity'] if !opts[:'sentiment_title_polarity'].nil?
      query_params[:'!sentiment.title.polarity'] = opts[:'not_sentiment_title_polarity'] if !opts[:'not_sentiment_title_polarity'].nil?
      query_params[:'sentiment.body.polarity'] = opts[:'sentiment_body_polarity'] if !opts[:'sentiment_body_polarity'].nil?
      query_params[:'!sentiment.body.polarity'] = opts[:'not_sentiment_body_polarity'] if !opts[:'not_sentiment_body_polarity'].nil?
      query_params[:'media.images.count.min'] = opts[:'media_images_count_min'] if !opts[:'media_images_count_min'].nil?
      query_params[:'media.images.count.max'] = opts[:'media_images_count_max'] if !opts[:'media_images_count_max'].nil?
      query_params[:'media.images.width.min'] = opts[:'media_images_width_min'] if !opts[:'media_images_width_min'].nil?
      query_params[:'media.images.width.max'] = opts[:'media_images_width_max'] if !opts[:'media_images_width_max'].nil?
      query_params[:'media.images.height.min'] = opts[:'media_images_height_min'] if !opts[:'media_images_height_min'].nil?
      query_params[:'media.images.height.max'] = opts[:'media_images_height_max'] if !opts[:'media_images_height_max'].nil?
      query_params[:'media.images.content_length.min'] = opts[:'media_images_content_length_min'] if !opts[:'media_images_content_length_min'].nil?
      query_params[:'media.images.content_length.max'] = opts[:'media_images_content_length_max'] if !opts[:'media_images_content_length_max'].nil?
      query_params[:'media.images.format[]'] = @api_client.build_collection_param(opts[:'media_images_format'], :multi) if !opts[:'media_images_format'].nil?
      query_params[:'!media.images.format[]'] = @api_client.build_collection_param(opts[:'not_media_images_format'], :multi) if !opts[:'not_media_images_format'].nil?
      query_params[:'media.videos.count.min'] = opts[:'media_videos_count_min'] if !opts[:'media_videos_count_min'].nil?
      query_params[:'media.videos.count.max'] = opts[:'media_videos_count_max'] if !opts[:'media_videos_count_max'].nil?
      query_params[:'author.id[]'] = @api_client.build_collection_param(opts[:'author_id'], :multi) if !opts[:'author_id'].nil?
      query_params[:'!author.id[]'] = @api_client.build_collection_param(opts[:'not_author_id'], :multi) if !opts[:'not_author_id'].nil?
      query_params[:'author.name'] = opts[:'author_name'] if !opts[:'author_name'].nil?
      query_params[:'!author.name'] = opts[:'not_author_name'] if !opts[:'not_author_name'].nil?
      query_params[:'source.id[]'] = @api_client.build_collection_param(opts[:'source_id'], :multi) if !opts[:'source_id'].nil?
      query_params[:'!source.id[]'] = @api_client.build_collection_param(opts[:'not_source_id'], :multi) if !opts[:'not_source_id'].nil?
      query_params[:'source.name[]'] = @api_client.build_collection_param(opts[:'source_name'], :multi) if !opts[:'source_name'].nil?
      query_params[:'!source.name[]'] = @api_client.build_collection_param(opts[:'not_source_name'], :multi) if !opts[:'not_source_name'].nil?
      query_params[:'source.domain[]'] = @api_client.build_collection_param(opts[:'source_domain'], :multi) if !opts[:'source_domain'].nil?
      query_params[:'!source.domain[]'] = @api_client.build_collection_param(opts[:'not_source_domain'], :multi) if !opts[:'not_source_domain'].nil?
      query_params[:'source.locations.country[]'] = @api_client.build_collection_param(opts[:'source_locations_country'], :multi) if !opts[:'source_locations_country'].nil?
      query_params[:'!source.locations.country[]'] = @api_client.build_collection_param(opts[:'not_source_locations_country'], :multi) if !opts[:'not_source_locations_country'].nil?
      query_params[:'source.locations.state[]'] = @api_client.build_collection_param(opts[:'source_locations_state'], :multi) if !opts[:'source_locations_state'].nil?
      query_params[:'!source.locations.state[]'] = @api_client.build_collection_param(opts[:'not_source_locations_state'], :multi) if !opts[:'not_source_locations_state'].nil?
      query_params[:'source.locations.city[]'] = @api_client.build_collection_param(opts[:'source_locations_city'], :multi) if !opts[:'source_locations_city'].nil?
      query_params[:'!source.locations.city[]'] = @api_client.build_collection_param(opts[:'not_source_locations_city'], :multi) if !opts[:'not_source_locations_city'].nil?
      query_params[:'source.scopes.country[]'] = @api_client.build_collection_param(opts[:'source_scopes_country'], :multi) if !opts[:'source_scopes_country'].nil?
      query_params[:'!source.scopes.country[]'] = @api_client.build_collection_param(opts[:'not_source_scopes_country'], :multi) if !opts[:'not_source_scopes_country'].nil?
      query_params[:'source.scopes.state[]'] = @api_client.build_collection_param(opts[:'source_scopes_state'], :multi) if !opts[:'source_scopes_state'].nil?
      query_params[:'!source.scopes.state[]'] = @api_client.build_collection_param(opts[:'not_source_scopes_state'], :multi) if !opts[:'not_source_scopes_state'].nil?
      query_params[:'source.scopes.city[]'] = @api_client.build_collection_param(opts[:'source_scopes_city'], :multi) if !opts[:'source_scopes_city'].nil?
      query_params[:'!source.scopes.city[]'] = @api_client.build_collection_param(opts[:'not_source_scopes_city'], :multi) if !opts[:'not_source_scopes_city'].nil?
      query_params[:'source.scopes.level[]'] = @api_client.build_collection_param(opts[:'source_scopes_level'], :multi) if !opts[:'source_scopes_level'].nil?
      query_params[:'!source.scopes.level[]'] = @api_client.build_collection_param(opts[:'not_source_scopes_level'], :multi) if !opts[:'not_source_scopes_level'].nil?
      query_params[:'source.links_in_count.min'] = opts[:'source_links_in_count_min'] if !opts[:'source_links_in_count_min'].nil?
      query_params[:'source.links_in_count.max'] = opts[:'source_links_in_count_max'] if !opts[:'source_links_in_count_max'].nil?
      query_params[:'source.rankings.alexa.rank.min'] = opts[:'source_rankings_alexa_rank_min'] if !opts[:'source_rankings_alexa_rank_min'].nil?
      query_params[:'source.rankings.alexa.rank.max'] = opts[:'source_rankings_alexa_rank_max'] if !opts[:'source_rankings_alexa_rank_max'].nil?
      query_params[:'source.rankings.alexa.country[]'] = @api_client.build_collection_param(opts[:'source_rankings_alexa_country'], :multi) if !opts[:'source_rankings_alexa_country'].nil?
      query_params[:'social_shares_count.facebook.min'] = opts[:'social_shares_count_facebook_min'] if !opts[:'social_shares_count_facebook_min'].nil?
      query_params[:'social_shares_count.facebook.max'] = opts[:'social_shares_count_facebook_max'] if !opts[:'social_shares_count_facebook_max'].nil?
      query_params[:'social_shares_count.google_plus.min'] = opts[:'social_shares_count_google_plus_min'] if !opts[:'social_shares_count_google_plus_min'].nil?
      query_params[:'social_shares_count.google_plus.max'] = opts[:'social_shares_count_google_plus_max'] if !opts[:'social_shares_count_google_plus_max'].nil?
      query_params[:'social_shares_count.linkedin.min'] = opts[:'social_shares_count_linkedin_min'] if !opts[:'social_shares_count_linkedin_min'].nil?
      query_params[:'social_shares_count.linkedin.max'] = opts[:'social_shares_count_linkedin_max'] if !opts[:'social_shares_count_linkedin_max'].nil?
      query_params[:'social_shares_count.reddit.min'] = opts[:'social_shares_count_reddit_min'] if !opts[:'social_shares_count_reddit_min'].nil?
      query_params[:'social_shares_count.reddit.max'] = opts[:'social_shares_count_reddit_max'] if !opts[:'social_shares_count_reddit_max'].nil?
      query_params[:'interval.start'] = opts[:'interval_start'] if !opts[:'interval_start'].nil?
      query_params[:'interval.end'] = opts[:'interval_end'] if !opts[:'interval_end'].nil?
      query_params[:'interval.width'] = opts[:'interval_width'] if !opts[:'interval_width'].nil?
      query_params[:'field'] = opts[:'field'] if !opts[:'field'].nil?

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json', 'text/xml'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/x-www-form-urlencoded'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = ['app_key', 'app_id']
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'Histograms')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: DefaultApi#list_histograms\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # List related stories
    # This endpoint is used for finding related stories based on the parameters provided. The maximum number of related stories returned is 100.
    # @param [Hash] opts the optional parameters
    # @option opts [Array<Integer>] :id This parameter is used for finding stories by story id.
    # @option opts [Array<Integer>] :not_id This parameter is used for excluding stories by story id.
    # @option opts [String] :title This parameter is used for finding stories whose title contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
    # @option opts [String] :body This parameter is used for finding stories whose body contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
    # @option opts [String] :text This parameter is used for finding stories whose title or body contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
    # @option opts [Array<String>] :language This parameter is used for finding stories whose language is the specified value. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes.
    # @option opts [Array<String>] :not_language This parameter is used for excluding stories whose language is the specified value. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes.
    # @option opts [String] :published_at_start This parameter is used for finding stories whose published at time is greater than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates).
    # @option opts [String] :published_at_end This parameter is used for finding stories whose published at time is less than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates).
    # @option opts [String] :categories_taxonomy This parameter is used for defining the type of the taxonomy for the rest of the categories queries. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).
    # @option opts [BOOLEAN] :categories_confident This parameter is used for finding stories whose categories are confident. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories). (default to true)
    # @option opts [Array<String>] :categories_id This parameter is used for finding stories by categories id. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).
    # @option opts [Array<String>] :not_categories_id This parameter is used for excluding stories by categories id. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).
    # @option opts [Array<Integer>] :categories_level This parameter is used for finding stories by categories level. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).
    # @option opts [Array<Integer>] :not_categories_level This parameter is used for excluding stories by categories level. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).
    # @option opts [Array<String>] :entities_title_text This parameter is used to find stories based on the specified entities &#x60;text&#x60; in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :not_entities_title_text This parameter is used to exclude stories based on the specified entities &#x60;text&#x60; in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :entities_title_type This parameter is used to find stories based on the specified entities &#x60;type&#x60; in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :not_entities_title_type This parameter is used to exclude stories based on the specified entities &#x60;type&#x60; in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :entities_title_links_dbpedia This parameter is used to find stories based on the specified entities dbpedia URL in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :not_entities_title_links_dbpedia This parameter is used to exclude stories based on the specified entities dbpedia URL in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :entities_body_text This parameter is used to find stories based on the specified entities &#x60;text&#x60; in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :not_entities_body_text This parameter is used to exclude stories based on the specified entities &#x60;text&#x60; in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :entities_body_type This parameter is used to find stories based on the specified entities &#x60;type&#x60; in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :not_entities_body_type This parameter is used to exclude stories based on the specified entities &#x60;type&#x60; in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :entities_body_links_dbpedia This parameter is used to find stories based on the specified entities dbpedia URL in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :not_entities_body_links_dbpedia This parameter is used to exclude stories based on the specified entities dbpedia URL in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [String] :sentiment_title_polarity This parameter is used for finding stories whose title sentiment is the specified value.
    # @option opts [String] :not_sentiment_title_polarity This parameter is used for excluding stories whose title sentiment is the specified value.
    # @option opts [String] :sentiment_body_polarity This parameter is used for finding stories whose body sentiment is the specified value.
    # @option opts [String] :not_sentiment_body_polarity This parameter is used for excluding stories whose body sentiment is the specified value.
    # @option opts [Integer] :media_images_count_min This parameter is used for finding stories whose number of images is greater than or equal to the specified value.
    # @option opts [Integer] :media_images_count_max This parameter is used for finding stories whose number of images is less than or equal to the specified value.
    # @option opts [Integer] :media_images_width_min This parameter is used for finding stories whose width of images are greater than or equal to the specified value.
    # @option opts [Integer] :media_images_width_max This parameter is used for finding stories whose width of images are less than or equal to the specified value.
    # @option opts [Integer] :media_images_height_min This parameter is used for finding stories whose height of images are greater than or equal to the specified value.
    # @option opts [Integer] :media_images_height_max This parameter is used for finding stories whose height of images are less than or equal to the specified value.
    # @option opts [Integer] :media_images_content_length_min This parameter is used for finding stories whose images content length are greater than or equal to the specified value.
    # @option opts [Integer] :media_images_content_length_max This parameter is used for finding stories whose images content length are less than or equal to the specified value.
    # @option opts [Array<String>] :media_images_format This parameter is used for finding stories whose images format are the specified value.
    # @option opts [Array<String>] :not_media_images_format This parameter is used for excluding stories whose images format are the specified value.
    # @option opts [Integer] :media_videos_count_min This parameter is used for finding stories whose number of videos is greater than or equal to the specified value.
    # @option opts [Integer] :media_videos_count_max This parameter is used for finding stories whose number of videos is less than or equal to the specified value.
    # @option opts [Array<Integer>] :author_id This parameter is used for finding stories whose author id is the specified value.
    # @option opts [Array<Integer>] :not_author_id This parameter is used for excluding stories whose author id is the specified value.
    # @option opts [String] :author_name This parameter is used for finding stories whose author full name contains the specified value.
    # @option opts [String] :not_author_name This parameter is used for excluding stories whose author full name contains the specified value.
    # @option opts [Array<Integer>] :source_id This parameter is used for finding stories whose source id is the specified value.
    # @option opts [Array<Integer>] :not_source_id This parameter is used for excluding stories whose source id is the specified value.
    # @option opts [Array<String>] :source_name This parameter is used for finding stories whose source name contains the specified value.
    # @option opts [Array<String>] :not_source_name This parameter is used for excluding stories whose source name contains the specified value.
    # @option opts [Array<String>] :source_domain This parameter is used for finding stories whose source domain is the specified value.
    # @option opts [Array<String>] :not_source_domain This parameter is used for excluding stories whose source domain is the specified value.
    # @option opts [Array<String>] :source_locations_country This parameter is used for finding stories whose source country is the specified value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :not_source_locations_country This parameter is used for excluding stories whose source country is the specified value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_locations_state This parameter is used for finding stories whose source state/province is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :not_source_locations_state This parameter is used for excluding stories whose source state/province is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_locations_city This parameter is used for finding stories whose source city is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :not_source_locations_city This parameter is used for excluding stories whose source city is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_scopes_country This parameter is used for finding stories whose source scopes  is the specified country value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :not_source_scopes_country This parameter is used for excluding stories whose source scopes  is the specified country value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_scopes_state This parameter is used for finding stories whose source scopes is the specified state/province value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :not_source_scopes_state This parameter is used for excluding stories whose source scopes is the specified state/province value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_scopes_city This parameter is used for finding stories whose source scopes is the specified city value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :not_source_scopes_city This parameter is used for excluding stories whose source scopes is the specified city value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_scopes_level This parameter is used for finding stories whose source scopes  is the specified level value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :not_source_scopes_level This parameter is used for excluding stories whose source scopes  is the specified level value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Integer] :source_links_in_count_min This parameter is used for finding stories from sources whose Links in count is greater than or equal to the specified value. You can read more about working with Links in count [here](https://newsapi.aylien.com/docs/working-with-links-in-count).
    # @option opts [Integer] :source_links_in_count_max This parameter is used for finding stories from sources whose Links in count is less than or equal to the specified value. You can read more about working with Links in count [here](https://newsapi.aylien.com/docs/working-with-links-in-count).
    # @option opts [Integer] :source_rankings_alexa_rank_min This parameter is used for finding stories from sources whose Alexa rank is greater than or equal to the specified value. You can read more about working with Alexa ranks [here](https://newsapi.aylien.com/docs/working-with-alexa-ranks).
    # @option opts [Integer] :source_rankings_alexa_rank_max This parameter is used for finding stories from sources whose Alexa rank is less than or equal to the specified value. You can read more about working with Alexa ranks [here](https://newsapi.aylien.com/docs/working-with-alexa-ranks).
    # @option opts [Array<String>] :source_rankings_alexa_country This parameter is used for finding stories from sources whose Alexa rank is in the specified country value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. You can read more about working with Alexa ranks [here](https://newsapi.aylien.com/docs/working-with-alexa-ranks).
    # @option opts [Integer] :social_shares_count_facebook_min This parameter is used for finding stories whose Facebook social shares count is greater than or equal to the specified value.
    # @option opts [Integer] :social_shares_count_facebook_max This parameter is used for finding stories whose Facebook social shares count is less than or equal to the specified value.
    # @option opts [Integer] :social_shares_count_google_plus_min This parameter is used for finding stories whose Google+ social shares count is greater than or equal to the specified value.
    # @option opts [Integer] :social_shares_count_google_plus_max This parameter is used for finding stories whose Google+ social shares count is less than or equal to the specified value.
    # @option opts [Integer] :social_shares_count_linkedin_min This parameter is used for finding stories whose LinkedIn social shares count is greater than or equal to the specified value.
    # @option opts [Integer] :social_shares_count_linkedin_max This parameter is used for finding stories whose LinkedIn social shares count is less than or equal to the specified value.
    # @option opts [Integer] :social_shares_count_reddit_min This parameter is used for finding stories whose Reddit social shares count is greater than or equal to the specified value.
    # @option opts [Integer] :social_shares_count_reddit_max This parameter is used for finding stories whose Reddit social shares count is less than or equal to the specified value.
    # @option opts [BOOLEAN] :cluster This parameter enables clustering for the returned stories. You can read more about working with clustering [here](https://newsapi.aylien.com/docs/working-with-clustering). (default to false)
    # @option opts [String] :cluster_algorithm This parameter is used for specifying the clustering algorithm you wish to use. It supprts STC, Lingo and [k-means](https://en.wikipedia.org/wiki/K-means_clustering) algorithms. You can read more about working with clustering [here](https://newsapi.aylien.com/docs/working-with-clustering). (default to lingo)
    # @option opts [Array<String>] :_return This parameter is used for specifying return fields.
    # @option opts [Integer] :story_id A story id
    # @option opts [String] :story_url An article or webpage
    # @option opts [String] :story_title Title of the article
    # @option opts [String] :story_body Body of the article
    # @option opts [String] :boost_by This parameter is used for boosting the result by the specified value.
    # @option opts [String] :story_language This parameter is used for setting the language of the story. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes. (default to auto)
    # @option opts [Integer] :per_page This parameter is used for specifying number of items in each page. (default to 3)
    # @return [RelatedStories]
    def list_related_stories(opts = {})
      data, _status_code, _headers = list_related_stories_with_http_info(opts)
      return data
    end

    # List related stories
    # This endpoint is used for finding related stories based on the parameters provided. The maximum number of related stories returned is 100.
    # @param [Hash] opts the optional parameters
    # @option opts [Array<Integer>] :id This parameter is used for finding stories by story id.
    # @option opts [Array<Integer>] :not_id This parameter is used for excluding stories by story id.
    # @option opts [String] :title This parameter is used for finding stories whose title contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
    # @option opts [String] :body This parameter is used for finding stories whose body contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
    # @option opts [String] :text This parameter is used for finding stories whose title or body contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
    # @option opts [Array<String>] :language This parameter is used for finding stories whose language is the specified value. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes.
    # @option opts [Array<String>] :not_language This parameter is used for excluding stories whose language is the specified value. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes.
    # @option opts [String] :published_at_start This parameter is used for finding stories whose published at time is greater than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates).
    # @option opts [String] :published_at_end This parameter is used for finding stories whose published at time is less than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates).
    # @option opts [String] :categories_taxonomy This parameter is used for defining the type of the taxonomy for the rest of the categories queries. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).
    # @option opts [BOOLEAN] :categories_confident This parameter is used for finding stories whose categories are confident. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).
    # @option opts [Array<String>] :categories_id This parameter is used for finding stories by categories id. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).
    # @option opts [Array<String>] :not_categories_id This parameter is used for excluding stories by categories id. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).
    # @option opts [Array<Integer>] :categories_level This parameter is used for finding stories by categories level. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).
    # @option opts [Array<Integer>] :not_categories_level This parameter is used for excluding stories by categories level. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).
    # @option opts [Array<String>] :entities_title_text This parameter is used to find stories based on the specified entities &#x60;text&#x60; in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :not_entities_title_text This parameter is used to exclude stories based on the specified entities &#x60;text&#x60; in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :entities_title_type This parameter is used to find stories based on the specified entities &#x60;type&#x60; in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :not_entities_title_type This parameter is used to exclude stories based on the specified entities &#x60;type&#x60; in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :entities_title_links_dbpedia This parameter is used to find stories based on the specified entities dbpedia URL in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :not_entities_title_links_dbpedia This parameter is used to exclude stories based on the specified entities dbpedia URL in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :entities_body_text This parameter is used to find stories based on the specified entities &#x60;text&#x60; in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :not_entities_body_text This parameter is used to exclude stories based on the specified entities &#x60;text&#x60; in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :entities_body_type This parameter is used to find stories based on the specified entities &#x60;type&#x60; in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :not_entities_body_type This parameter is used to exclude stories based on the specified entities &#x60;type&#x60; in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :entities_body_links_dbpedia This parameter is used to find stories based on the specified entities dbpedia URL in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :not_entities_body_links_dbpedia This parameter is used to exclude stories based on the specified entities dbpedia URL in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [String] :sentiment_title_polarity This parameter is used for finding stories whose title sentiment is the specified value.
    # @option opts [String] :not_sentiment_title_polarity This parameter is used for excluding stories whose title sentiment is the specified value.
    # @option opts [String] :sentiment_body_polarity This parameter is used for finding stories whose body sentiment is the specified value.
    # @option opts [String] :not_sentiment_body_polarity This parameter is used for excluding stories whose body sentiment is the specified value.
    # @option opts [Integer] :media_images_count_min This parameter is used for finding stories whose number of images is greater than or equal to the specified value.
    # @option opts [Integer] :media_images_count_max This parameter is used for finding stories whose number of images is less than or equal to the specified value.
    # @option opts [Integer] :media_images_width_min This parameter is used for finding stories whose width of images are greater than or equal to the specified value.
    # @option opts [Integer] :media_images_width_max This parameter is used for finding stories whose width of images are less than or equal to the specified value.
    # @option opts [Integer] :media_images_height_min This parameter is used for finding stories whose height of images are greater than or equal to the specified value.
    # @option opts [Integer] :media_images_height_max This parameter is used for finding stories whose height of images are less than or equal to the specified value.
    # @option opts [Integer] :media_images_content_length_min This parameter is used for finding stories whose images content length are greater than or equal to the specified value.
    # @option opts [Integer] :media_images_content_length_max This parameter is used for finding stories whose images content length are less than or equal to the specified value.
    # @option opts [Array<String>] :media_images_format This parameter is used for finding stories whose images format are the specified value.
    # @option opts [Array<String>] :not_media_images_format This parameter is used for excluding stories whose images format are the specified value.
    # @option opts [Integer] :media_videos_count_min This parameter is used for finding stories whose number of videos is greater than or equal to the specified value.
    # @option opts [Integer] :media_videos_count_max This parameter is used for finding stories whose number of videos is less than or equal to the specified value.
    # @option opts [Array<Integer>] :author_id This parameter is used for finding stories whose author id is the specified value.
    # @option opts [Array<Integer>] :not_author_id This parameter is used for excluding stories whose author id is the specified value.
    # @option opts [String] :author_name This parameter is used for finding stories whose author full name contains the specified value.
    # @option opts [String] :not_author_name This parameter is used for excluding stories whose author full name contains the specified value.
    # @option opts [Array<Integer>] :source_id This parameter is used for finding stories whose source id is the specified value.
    # @option opts [Array<Integer>] :not_source_id This parameter is used for excluding stories whose source id is the specified value.
    # @option opts [Array<String>] :source_name This parameter is used for finding stories whose source name contains the specified value.
    # @option opts [Array<String>] :not_source_name This parameter is used for excluding stories whose source name contains the specified value.
    # @option opts [Array<String>] :source_domain This parameter is used for finding stories whose source domain is the specified value.
    # @option opts [Array<String>] :not_source_domain This parameter is used for excluding stories whose source domain is the specified value.
    # @option opts [Array<String>] :source_locations_country This parameter is used for finding stories whose source country is the specified value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :not_source_locations_country This parameter is used for excluding stories whose source country is the specified value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_locations_state This parameter is used for finding stories whose source state/province is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :not_source_locations_state This parameter is used for excluding stories whose source state/province is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_locations_city This parameter is used for finding stories whose source city is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :not_source_locations_city This parameter is used for excluding stories whose source city is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_scopes_country This parameter is used for finding stories whose source scopes  is the specified country value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :not_source_scopes_country This parameter is used for excluding stories whose source scopes  is the specified country value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_scopes_state This parameter is used for finding stories whose source scopes is the specified state/province value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :not_source_scopes_state This parameter is used for excluding stories whose source scopes is the specified state/province value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_scopes_city This parameter is used for finding stories whose source scopes is the specified city value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :not_source_scopes_city This parameter is used for excluding stories whose source scopes is the specified city value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_scopes_level This parameter is used for finding stories whose source scopes  is the specified level value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :not_source_scopes_level This parameter is used for excluding stories whose source scopes  is the specified level value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Integer] :source_links_in_count_min This parameter is used for finding stories from sources whose Links in count is greater than or equal to the specified value. You can read more about working with Links in count [here](https://newsapi.aylien.com/docs/working-with-links-in-count).
    # @option opts [Integer] :source_links_in_count_max This parameter is used for finding stories from sources whose Links in count is less than or equal to the specified value. You can read more about working with Links in count [here](https://newsapi.aylien.com/docs/working-with-links-in-count).
    # @option opts [Integer] :source_rankings_alexa_rank_min This parameter is used for finding stories from sources whose Alexa rank is greater than or equal to the specified value. You can read more about working with Alexa ranks [here](https://newsapi.aylien.com/docs/working-with-alexa-ranks).
    # @option opts [Integer] :source_rankings_alexa_rank_max This parameter is used for finding stories from sources whose Alexa rank is less than or equal to the specified value. You can read more about working with Alexa ranks [here](https://newsapi.aylien.com/docs/working-with-alexa-ranks).
    # @option opts [Array<String>] :source_rankings_alexa_country This parameter is used for finding stories from sources whose Alexa rank is in the specified country value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. You can read more about working with Alexa ranks [here](https://newsapi.aylien.com/docs/working-with-alexa-ranks).
    # @option opts [Integer] :social_shares_count_facebook_min This parameter is used for finding stories whose Facebook social shares count is greater than or equal to the specified value.
    # @option opts [Integer] :social_shares_count_facebook_max This parameter is used for finding stories whose Facebook social shares count is less than or equal to the specified value.
    # @option opts [Integer] :social_shares_count_google_plus_min This parameter is used for finding stories whose Google+ social shares count is greater than or equal to the specified value.
    # @option opts [Integer] :social_shares_count_google_plus_max This parameter is used for finding stories whose Google+ social shares count is less than or equal to the specified value.
    # @option opts [Integer] :social_shares_count_linkedin_min This parameter is used for finding stories whose LinkedIn social shares count is greater than or equal to the specified value.
    # @option opts [Integer] :social_shares_count_linkedin_max This parameter is used for finding stories whose LinkedIn social shares count is less than or equal to the specified value.
    # @option opts [Integer] :social_shares_count_reddit_min This parameter is used for finding stories whose Reddit social shares count is greater than or equal to the specified value.
    # @option opts [Integer] :social_shares_count_reddit_max This parameter is used for finding stories whose Reddit social shares count is less than or equal to the specified value.
    # @option opts [BOOLEAN] :cluster This parameter enables clustering for the returned stories. You can read more about working with clustering [here](https://newsapi.aylien.com/docs/working-with-clustering).
    # @option opts [String] :cluster_algorithm This parameter is used for specifying the clustering algorithm you wish to use. It supprts STC, Lingo and [k-means](https://en.wikipedia.org/wiki/K-means_clustering) algorithms. You can read more about working with clustering [here](https://newsapi.aylien.com/docs/working-with-clustering).
    # @option opts [Array<String>] :_return This parameter is used for specifying return fields.
    # @option opts [Integer] :story_id A story id
    # @option opts [String] :story_url An article or webpage
    # @option opts [String] :story_title Title of the article
    # @option opts [String] :story_body Body of the article
    # @option opts [String] :boost_by This parameter is used for boosting the result by the specified value.
    # @option opts [String] :story_language This parameter is used for setting the language of the story. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes.
    # @option opts [Integer] :per_page This parameter is used for specifying number of items in each page.
    # @return [Array<(RelatedStories, Fixnum, Hash)>] RelatedStories data, response status code and response headers
    def list_related_stories_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: DefaultApi.list_related_stories ..."
      end
      if opts[:'language'] && !opts[:'language'].all?{|item| ['en', 'de', 'fr', 'it', 'es', 'pt'].include?(item)}
        fail ArgumentError, 'invalid value for "language", must include one of en, de, fr, it, es, pt'
      end
      if opts[:'not_language'] && !opts[:'not_language'].all?{|item| ['en', 'de', 'fr', 'it', 'es', 'pt'].include?(item)}
        fail ArgumentError, 'invalid value for "not_language", must include one of en, de, fr, it, es, pt'
      end
      if opts[:'categories_taxonomy'] && !['iab-qag', 'iptc-subjectcode'].include?(opts[:'categories_taxonomy'])
        fail ArgumentError, 'invalid value for "categories_taxonomy", must be one of iab-qag, iptc-subjectcode'
      end
      if opts[:'sentiment_title_polarity'] && !['positive', 'neutral', 'negative'].include?(opts[:'sentiment_title_polarity'])
        fail ArgumentError, 'invalid value for "sentiment_title_polarity", must be one of positive, neutral, negative'
      end
      if opts[:'not_sentiment_title_polarity'] && !['positive', 'neutral', 'negative'].include?(opts[:'not_sentiment_title_polarity'])
        fail ArgumentError, 'invalid value for "not_sentiment_title_polarity", must be one of positive, neutral, negative'
      end
      if opts[:'sentiment_body_polarity'] && !['positive', 'neutral', 'negative'].include?(opts[:'sentiment_body_polarity'])
        fail ArgumentError, 'invalid value for "sentiment_body_polarity", must be one of positive, neutral, negative'
      end
      if opts[:'not_sentiment_body_polarity'] && !['positive', 'neutral', 'negative'].include?(opts[:'not_sentiment_body_polarity'])
        fail ArgumentError, 'invalid value for "not_sentiment_body_polarity", must be one of positive, neutral, negative'
      end
      if !opts[:'media_images_count_min'].nil? && opts[:'media_images_count_min'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"media_images_count_min"]" when calling DefaultApi.list_related_stories, must be greater than 0.'
      end

      if !opts[:'media_images_count_max'].nil? && opts[:'media_images_count_max'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"media_images_count_max"]" when calling DefaultApi.list_related_stories, must be greater than 0.'
      end

      if !opts[:'media_images_width_min'].nil? && opts[:'media_images_width_min'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"media_images_width_min"]" when calling DefaultApi.list_related_stories, must be greater than 0.'
      end

      if !opts[:'media_images_width_max'].nil? && opts[:'media_images_width_max'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"media_images_width_max"]" when calling DefaultApi.list_related_stories, must be greater than 0.'
      end

      if !opts[:'media_images_height_min'].nil? && opts[:'media_images_height_min'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"media_images_height_min"]" when calling DefaultApi.list_related_stories, must be greater than 0.'
      end

      if !opts[:'media_images_height_max'].nil? && opts[:'media_images_height_max'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"media_images_height_max"]" when calling DefaultApi.list_related_stories, must be greater than 0.'
      end

      if !opts[:'media_images_content_length_min'].nil? && opts[:'media_images_content_length_min'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"media_images_content_length_min"]" when calling DefaultApi.list_related_stories, must be greater than 0.'
      end

      if !opts[:'media_images_content_length_max'].nil? && opts[:'media_images_content_length_max'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"media_images_content_length_max"]" when calling DefaultApi.list_related_stories, must be greater than 0.'
      end

      if opts[:'media_images_format'] && !opts[:'media_images_format'].all?{|item| ['BMP', 'GIF', 'JPEG', 'PNG', 'TIFF', 'PSD', 'ICO', 'CUR', 'WEBP', 'SVG'].include?(item)}
        fail ArgumentError, 'invalid value for "media_images_format", must include one of BMP, GIF, JPEG, PNG, TIFF, PSD, ICO, CUR, WEBP, SVG'
      end
      if opts[:'not_media_images_format'] && !opts[:'not_media_images_format'].all?{|item| ['BMP', 'GIF', 'JPEG', 'PNG', 'TIFF', 'PSD', 'ICO', 'CUR', 'WEBP', 'SVG'].include?(item)}
        fail ArgumentError, 'invalid value for "not_media_images_format", must include one of BMP, GIF, JPEG, PNG, TIFF, PSD, ICO, CUR, WEBP, SVG'
      end
      if !opts[:'media_videos_count_min'].nil? && opts[:'media_videos_count_min'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"media_videos_count_min"]" when calling DefaultApi.list_related_stories, must be greater than 0.'
      end

      if !opts[:'media_videos_count_max'].nil? && opts[:'media_videos_count_max'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"media_videos_count_max"]" when calling DefaultApi.list_related_stories, must be greater than 0.'
      end

      if opts[:'source_scopes_level'] && !opts[:'source_scopes_level'].all?{|item| ['international', 'national', 'local'].include?(item)}
        fail ArgumentError, 'invalid value for "source_scopes_level", must include one of international, national, local'
      end
      if opts[:'not_source_scopes_level'] && !opts[:'not_source_scopes_level'].all?{|item| ['international', 'national', 'local'].include?(item)}
        fail ArgumentError, 'invalid value for "not_source_scopes_level", must include one of international, national, local'
      end
      if !opts[:'source_links_in_count_min'].nil? && opts[:'source_links_in_count_min'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"source_links_in_count_min"]" when calling DefaultApi.list_related_stories, must be greater than 0.'
      end

      if !opts[:'source_links_in_count_max'].nil? && opts[:'source_links_in_count_max'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"source_links_in_count_max"]" when calling DefaultApi.list_related_stories, must be greater than 0.'
      end

      if !opts[:'source_rankings_alexa_rank_min'].nil? && opts[:'source_rankings_alexa_rank_min'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"source_rankings_alexa_rank_min"]" when calling DefaultApi.list_related_stories, must be greater than 0.'
      end

      if !opts[:'source_rankings_alexa_rank_max'].nil? && opts[:'source_rankings_alexa_rank_max'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"source_rankings_alexa_rank_max"]" when calling DefaultApi.list_related_stories, must be greater than 0.'
      end

      if !opts[:'social_shares_count_facebook_min'].nil? && opts[:'social_shares_count_facebook_min'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"social_shares_count_facebook_min"]" when calling DefaultApi.list_related_stories, must be greater than 0.'
      end

      if !opts[:'social_shares_count_facebook_max'].nil? && opts[:'social_shares_count_facebook_max'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"social_shares_count_facebook_max"]" when calling DefaultApi.list_related_stories, must be greater than 0.'
      end

      if !opts[:'social_shares_count_google_plus_min'].nil? && opts[:'social_shares_count_google_plus_min'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"social_shares_count_google_plus_min"]" when calling DefaultApi.list_related_stories, must be greater than 0.'
      end

      if !opts[:'social_shares_count_google_plus_max'].nil? && opts[:'social_shares_count_google_plus_max'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"social_shares_count_google_plus_max"]" when calling DefaultApi.list_related_stories, must be greater than 0.'
      end

      if !opts[:'social_shares_count_linkedin_min'].nil? && opts[:'social_shares_count_linkedin_min'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"social_shares_count_linkedin_min"]" when calling DefaultApi.list_related_stories, must be greater than 0.'
      end

      if !opts[:'social_shares_count_linkedin_max'].nil? && opts[:'social_shares_count_linkedin_max'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"social_shares_count_linkedin_max"]" when calling DefaultApi.list_related_stories, must be greater than 0.'
      end

      if !opts[:'social_shares_count_reddit_min'].nil? && opts[:'social_shares_count_reddit_min'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"social_shares_count_reddit_min"]" when calling DefaultApi.list_related_stories, must be greater than 0.'
      end

      if !opts[:'social_shares_count_reddit_max'].nil? && opts[:'social_shares_count_reddit_max'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"social_shares_count_reddit_max"]" when calling DefaultApi.list_related_stories, must be greater than 0.'
      end

      if opts[:'cluster_algorithm'] && !['stc', 'lingo', 'kmeans'].include?(opts[:'cluster_algorithm'])
        fail ArgumentError, 'invalid value for "cluster_algorithm", must be one of stc, lingo, kmeans'
      end
      if opts[:'_return'] && !opts[:'_return'].all?{|item| ['id', 'title', 'body', 'summary', 'source', 'author', 'entities', 'keywords', 'hashtags', 'characters_count', 'words_count', 'sentences_count', 'paragraphs_count', 'categories', 'social_shares_count', 'media', 'sentiment', 'language', 'published_at', 'links'].include?(item)}
        fail ArgumentError, 'invalid value for "_return", must include one of id, title, body, summary, source, author, entities, keywords, hashtags, characters_count, words_count, sentences_count, paragraphs_count, categories, social_shares_count, media, sentiment, language, published_at, links'
      end
      if opts[:'boost_by'] && !['recency', 'popularity'].include?(opts[:'boost_by'])
        fail ArgumentError, 'invalid value for "boost_by", must be one of recency, popularity'
      end
      if opts[:'story_language'] && !['auto', 'en', 'de', 'fr', 'it', 'es', 'pt'].include?(opts[:'story_language'])
        fail ArgumentError, 'invalid value for "story_language", must be one of auto, en, de, fr, it, es, pt'
      end
      if !opts[:'per_page'].nil? && opts[:'per_page'] > 100
        fail ArgumentError, 'invalid value for "opts[:"per_page"]" when calling DefaultApi.list_related_stories, must be smaller than or equal to 100.'
      end

      if !opts[:'per_page'].nil? && opts[:'per_page'] < 1
        fail ArgumentError, 'invalid value for "opts[:"per_page"]" when calling DefaultApi.list_related_stories, must be greater than or equal to 1.'
      end

      # resource path
      local_var_path = "/related_stories".sub('{format}','json')

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json', 'text/xml'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/x-www-form-urlencoded'])

      # form parameters
      form_params = {}
      form_params["id[]"] = @api_client.build_collection_param(opts[:'id'], :multi) if !opts[:'id'].nil?
      form_params["!id[]"] = @api_client.build_collection_param(opts[:'not_id'], :multi) if !opts[:'not_id'].nil?
      form_params["title"] = opts[:'title'] if !opts[:'title'].nil?
      form_params["body"] = opts[:'body'] if !opts[:'body'].nil?
      form_params["text"] = opts[:'text'] if !opts[:'text'].nil?
      form_params["language[]"] = @api_client.build_collection_param(opts[:'language'], :multi) if !opts[:'language'].nil?
      form_params["!language[]"] = @api_client.build_collection_param(opts[:'not_language'], :multi) if !opts[:'not_language'].nil?
      form_params["published_at.start"] = opts[:'published_at_start'] if !opts[:'published_at_start'].nil?
      form_params["published_at.end"] = opts[:'published_at_end'] if !opts[:'published_at_end'].nil?
      form_params["categories.taxonomy"] = opts[:'categories_taxonomy'] if !opts[:'categories_taxonomy'].nil?
      form_params["categories.confident"] = opts[:'categories_confident'] if !opts[:'categories_confident'].nil?
      form_params["categories.id[]"] = @api_client.build_collection_param(opts[:'categories_id'], :multi) if !opts[:'categories_id'].nil?
      form_params["!categories.id[]"] = @api_client.build_collection_param(opts[:'not_categories_id'], :multi) if !opts[:'not_categories_id'].nil?
      form_params["categories.level[]"] = @api_client.build_collection_param(opts[:'categories_level'], :multi) if !opts[:'categories_level'].nil?
      form_params["!categories.level[]"] = @api_client.build_collection_param(opts[:'not_categories_level'], :multi) if !opts[:'not_categories_level'].nil?
      form_params["entities.title.text[]"] = @api_client.build_collection_param(opts[:'entities_title_text'], :multi) if !opts[:'entities_title_text'].nil?
      form_params["!entities.title.text[]"] = @api_client.build_collection_param(opts[:'not_entities_title_text'], :multi) if !opts[:'not_entities_title_text'].nil?
      form_params["entities.title.type[]"] = @api_client.build_collection_param(opts[:'entities_title_type'], :multi) if !opts[:'entities_title_type'].nil?
      form_params["!entities.title.type[]"] = @api_client.build_collection_param(opts[:'not_entities_title_type'], :multi) if !opts[:'not_entities_title_type'].nil?
      form_params["entities.title.links.dbpedia[]"] = @api_client.build_collection_param(opts[:'entities_title_links_dbpedia'], :multi) if !opts[:'entities_title_links_dbpedia'].nil?
      form_params["!entities.title.links.dbpedia[]"] = @api_client.build_collection_param(opts[:'not_entities_title_links_dbpedia'], :multi) if !opts[:'not_entities_title_links_dbpedia'].nil?
      form_params["entities.body.text[]"] = @api_client.build_collection_param(opts[:'entities_body_text'], :multi) if !opts[:'entities_body_text'].nil?
      form_params["!entities.body.text[]"] = @api_client.build_collection_param(opts[:'not_entities_body_text'], :multi) if !opts[:'not_entities_body_text'].nil?
      form_params["entities.body.type[]"] = @api_client.build_collection_param(opts[:'entities_body_type'], :multi) if !opts[:'entities_body_type'].nil?
      form_params["!entities.body.type[]"] = @api_client.build_collection_param(opts[:'not_entities_body_type'], :multi) if !opts[:'not_entities_body_type'].nil?
      form_params["entities.body.links.dbpedia[]"] = @api_client.build_collection_param(opts[:'entities_body_links_dbpedia'], :multi) if !opts[:'entities_body_links_dbpedia'].nil?
      form_params["!entities.body.links.dbpedia[]"] = @api_client.build_collection_param(opts[:'not_entities_body_links_dbpedia'], :multi) if !opts[:'not_entities_body_links_dbpedia'].nil?
      form_params["sentiment.title.polarity"] = opts[:'sentiment_title_polarity'] if !opts[:'sentiment_title_polarity'].nil?
      form_params["!sentiment.title.polarity"] = opts[:'not_sentiment_title_polarity'] if !opts[:'not_sentiment_title_polarity'].nil?
      form_params["sentiment.body.polarity"] = opts[:'sentiment_body_polarity'] if !opts[:'sentiment_body_polarity'].nil?
      form_params["!sentiment.body.polarity"] = opts[:'not_sentiment_body_polarity'] if !opts[:'not_sentiment_body_polarity'].nil?
      form_params["media.images.count.min"] = opts[:'media_images_count_min'] if !opts[:'media_images_count_min'].nil?
      form_params["media.images.count.max"] = opts[:'media_images_count_max'] if !opts[:'media_images_count_max'].nil?
      form_params["media.images.width.min"] = opts[:'media_images_width_min'] if !opts[:'media_images_width_min'].nil?
      form_params["media.images.width.max"] = opts[:'media_images_width_max'] if !opts[:'media_images_width_max'].nil?
      form_params["media.images.height.min"] = opts[:'media_images_height_min'] if !opts[:'media_images_height_min'].nil?
      form_params["media.images.height.max"] = opts[:'media_images_height_max'] if !opts[:'media_images_height_max'].nil?
      form_params["media.images.content_length.min"] = opts[:'media_images_content_length_min'] if !opts[:'media_images_content_length_min'].nil?
      form_params["media.images.content_length.max"] = opts[:'media_images_content_length_max'] if !opts[:'media_images_content_length_max'].nil?
      form_params["media.images.format[]"] = @api_client.build_collection_param(opts[:'media_images_format'], :multi) if !opts[:'media_images_format'].nil?
      form_params["!media.images.format[]"] = @api_client.build_collection_param(opts[:'not_media_images_format'], :multi) if !opts[:'not_media_images_format'].nil?
      form_params["media.videos.count.min"] = opts[:'media_videos_count_min'] if !opts[:'media_videos_count_min'].nil?
      form_params["media.videos.count.max"] = opts[:'media_videos_count_max'] if !opts[:'media_videos_count_max'].nil?
      form_params["author.id[]"] = @api_client.build_collection_param(opts[:'author_id'], :multi) if !opts[:'author_id'].nil?
      form_params["!author.id[]"] = @api_client.build_collection_param(opts[:'not_author_id'], :multi) if !opts[:'not_author_id'].nil?
      form_params["author.name"] = opts[:'author_name'] if !opts[:'author_name'].nil?
      form_params["!author.name"] = opts[:'not_author_name'] if !opts[:'not_author_name'].nil?
      form_params["source.id[]"] = @api_client.build_collection_param(opts[:'source_id'], :multi) if !opts[:'source_id'].nil?
      form_params["!source.id[]"] = @api_client.build_collection_param(opts[:'not_source_id'], :multi) if !opts[:'not_source_id'].nil?
      form_params["source.name[]"] = @api_client.build_collection_param(opts[:'source_name'], :multi) if !opts[:'source_name'].nil?
      form_params["!source.name[]"] = @api_client.build_collection_param(opts[:'not_source_name'], :multi) if !opts[:'not_source_name'].nil?
      form_params["source.domain[]"] = @api_client.build_collection_param(opts[:'source_domain'], :multi) if !opts[:'source_domain'].nil?
      form_params["!source.domain[]"] = @api_client.build_collection_param(opts[:'not_source_domain'], :multi) if !opts[:'not_source_domain'].nil?
      form_params["source.locations.country[]"] = @api_client.build_collection_param(opts[:'source_locations_country'], :multi) if !opts[:'source_locations_country'].nil?
      form_params["!source.locations.country[]"] = @api_client.build_collection_param(opts[:'not_source_locations_country'], :multi) if !opts[:'not_source_locations_country'].nil?
      form_params["source.locations.state[]"] = @api_client.build_collection_param(opts[:'source_locations_state'], :multi) if !opts[:'source_locations_state'].nil?
      form_params["!source.locations.state[]"] = @api_client.build_collection_param(opts[:'not_source_locations_state'], :multi) if !opts[:'not_source_locations_state'].nil?
      form_params["source.locations.city[]"] = @api_client.build_collection_param(opts[:'source_locations_city'], :multi) if !opts[:'source_locations_city'].nil?
      form_params["!source.locations.city[]"] = @api_client.build_collection_param(opts[:'not_source_locations_city'], :multi) if !opts[:'not_source_locations_city'].nil?
      form_params["source.scopes.country[]"] = @api_client.build_collection_param(opts[:'source_scopes_country'], :multi) if !opts[:'source_scopes_country'].nil?
      form_params["!source.scopes.country[]"] = @api_client.build_collection_param(opts[:'not_source_scopes_country'], :multi) if !opts[:'not_source_scopes_country'].nil?
      form_params["source.scopes.state[]"] = @api_client.build_collection_param(opts[:'source_scopes_state'], :multi) if !opts[:'source_scopes_state'].nil?
      form_params["!source.scopes.state[]"] = @api_client.build_collection_param(opts[:'not_source_scopes_state'], :multi) if !opts[:'not_source_scopes_state'].nil?
      form_params["source.scopes.city[]"] = @api_client.build_collection_param(opts[:'source_scopes_city'], :multi) if !opts[:'source_scopes_city'].nil?
      form_params["!source.scopes.city[]"] = @api_client.build_collection_param(opts[:'not_source_scopes_city'], :multi) if !opts[:'not_source_scopes_city'].nil?
      form_params["source.scopes.level[]"] = @api_client.build_collection_param(opts[:'source_scopes_level'], :multi) if !opts[:'source_scopes_level'].nil?
      form_params["!source.scopes.level[]"] = @api_client.build_collection_param(opts[:'not_source_scopes_level'], :multi) if !opts[:'not_source_scopes_level'].nil?
      form_params["source.links_in_count.min"] = opts[:'source_links_in_count_min'] if !opts[:'source_links_in_count_min'].nil?
      form_params["source.links_in_count.max"] = opts[:'source_links_in_count_max'] if !opts[:'source_links_in_count_max'].nil?
      form_params["source.rankings.alexa.rank.min"] = opts[:'source_rankings_alexa_rank_min'] if !opts[:'source_rankings_alexa_rank_min'].nil?
      form_params["source.rankings.alexa.rank.max"] = opts[:'source_rankings_alexa_rank_max'] if !opts[:'source_rankings_alexa_rank_max'].nil?
      form_params["source.rankings.alexa.country[]"] = @api_client.build_collection_param(opts[:'source_rankings_alexa_country'], :multi) if !opts[:'source_rankings_alexa_country'].nil?
      form_params["social_shares_count.facebook.min"] = opts[:'social_shares_count_facebook_min'] if !opts[:'social_shares_count_facebook_min'].nil?
      form_params["social_shares_count.facebook.max"] = opts[:'social_shares_count_facebook_max'] if !opts[:'social_shares_count_facebook_max'].nil?
      form_params["social_shares_count.google_plus.min"] = opts[:'social_shares_count_google_plus_min'] if !opts[:'social_shares_count_google_plus_min'].nil?
      form_params["social_shares_count.google_plus.max"] = opts[:'social_shares_count_google_plus_max'] if !opts[:'social_shares_count_google_plus_max'].nil?
      form_params["social_shares_count.linkedin.min"] = opts[:'social_shares_count_linkedin_min'] if !opts[:'social_shares_count_linkedin_min'].nil?
      form_params["social_shares_count.linkedin.max"] = opts[:'social_shares_count_linkedin_max'] if !opts[:'social_shares_count_linkedin_max'].nil?
      form_params["social_shares_count.reddit.min"] = opts[:'social_shares_count_reddit_min'] if !opts[:'social_shares_count_reddit_min'].nil?
      form_params["social_shares_count.reddit.max"] = opts[:'social_shares_count_reddit_max'] if !opts[:'social_shares_count_reddit_max'].nil?
      form_params["cluster"] = opts[:'cluster'] if !opts[:'cluster'].nil?
      form_params["cluster.algorithm"] = opts[:'cluster_algorithm'] if !opts[:'cluster_algorithm'].nil?
      form_params["return[]"] = @api_client.build_collection_param(opts[:'_return'], :multi) if !opts[:'_return'].nil?
      form_params["story_id"] = opts[:'story_id'] if !opts[:'story_id'].nil?
      form_params["story_url"] = opts[:'story_url'] if !opts[:'story_url'].nil?
      form_params["story_title"] = opts[:'story_title'] if !opts[:'story_title'].nil?
      form_params["story_body"] = opts[:'story_body'] if !opts[:'story_body'].nil?
      form_params["boost_by"] = opts[:'boost_by'] if !opts[:'boost_by'].nil?
      form_params["story_language"] = opts[:'story_language'] if !opts[:'story_language'].nil?
      form_params["per_page"] = opts[:'per_page'] if !opts[:'per_page'].nil?

      # http body (model)
      post_body = nil
      auth_names = ['app_key', 'app_id']
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'RelatedStories')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: DefaultApi#list_related_stories\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # List Stories
    # This endpoint is used for getting a list of stories.
    # @param [Hash] opts the optional parameters
    # @option opts [Array<Integer>] :id This parameter is used for finding stories by story id.
    # @option opts [Array<Integer>] :not_id This parameter is used for excluding stories by story id.
    # @option opts [String] :title This parameter is used for finding stories whose title contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
    # @option opts [String] :body This parameter is used for finding stories whose body contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
    # @option opts [String] :text This parameter is used for finding stories whose title or body contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
    # @option opts [Array<String>] :language This parameter is used for finding stories whose language is the specified value. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes.
    # @option opts [Array<String>] :not_language This parameter is used for excluding stories whose language is the specified value. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes.
    # @option opts [String] :published_at_start This parameter is used for finding stories whose published at time is greater than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates).
    # @option opts [String] :published_at_end This parameter is used for finding stories whose published at time is less than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates).
    # @option opts [String] :categories_taxonomy This parameter is used for defining the type of the taxonomy for the rest of the categories queries. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).
    # @option opts [BOOLEAN] :categories_confident This parameter is used for finding stories whose categories are confident. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories). (default to true)
    # @option opts [Array<String>] :categories_id This parameter is used for finding stories by categories id. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).
    # @option opts [Array<String>] :not_categories_id This parameter is used for excluding stories by categories id. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).
    # @option opts [Array<Integer>] :categories_level This parameter is used for finding stories by categories level. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).
    # @option opts [Array<Integer>] :not_categories_level This parameter is used for excluding stories by categories level. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).
    # @option opts [Array<String>] :entities_title_text This parameter is used to find stories based on the specified entities &#x60;text&#x60; in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :not_entities_title_text This parameter is used to exclude stories based on the specified entities &#x60;text&#x60; in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :entities_title_type This parameter is used to find stories based on the specified entities &#x60;type&#x60; in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :not_entities_title_type This parameter is used to exclude stories based on the specified entities &#x60;type&#x60; in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :entities_title_links_dbpedia This parameter is used to find stories based on the specified entities dbpedia URL in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :not_entities_title_links_dbpedia This parameter is used to exclude stories based on the specified entities dbpedia URL in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :entities_body_text This parameter is used to find stories based on the specified entities &#x60;text&#x60; in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :not_entities_body_text This parameter is used to exclude stories based on the specified entities &#x60;text&#x60; in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :entities_body_type This parameter is used to find stories based on the specified entities &#x60;type&#x60; in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :not_entities_body_type This parameter is used to exclude stories based on the specified entities &#x60;type&#x60; in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :entities_body_links_dbpedia This parameter is used to find stories based on the specified entities dbpedia URL in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :not_entities_body_links_dbpedia This parameter is used to exclude stories based on the specified entities dbpedia URL in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [String] :sentiment_title_polarity This parameter is used for finding stories whose title sentiment is the specified value.
    # @option opts [String] :not_sentiment_title_polarity This parameter is used for excluding stories whose title sentiment is the specified value.
    # @option opts [String] :sentiment_body_polarity This parameter is used for finding stories whose body sentiment is the specified value.
    # @option opts [String] :not_sentiment_body_polarity This parameter is used for excluding stories whose body sentiment is the specified value.
    # @option opts [Integer] :media_images_count_min This parameter is used for finding stories whose number of images is greater than or equal to the specified value.
    # @option opts [Integer] :media_images_count_max This parameter is used for finding stories whose number of images is less than or equal to the specified value.
    # @option opts [Integer] :media_images_width_min This parameter is used for finding stories whose width of images are greater than or equal to the specified value.
    # @option opts [Integer] :media_images_width_max This parameter is used for finding stories whose width of images are less than or equal to the specified value.
    # @option opts [Integer] :media_images_height_min This parameter is used for finding stories whose height of images are greater than or equal to the specified value.
    # @option opts [Integer] :media_images_height_max This parameter is used for finding stories whose height of images are less than or equal to the specified value.
    # @option opts [Integer] :media_images_content_length_min This parameter is used for finding stories whose images content length are greater than or equal to the specified value.
    # @option opts [Integer] :media_images_content_length_max This parameter is used for finding stories whose images content length are less than or equal to the specified value.
    # @option opts [Array<String>] :media_images_format This parameter is used for finding stories whose images format are the specified value.
    # @option opts [Array<String>] :not_media_images_format This parameter is used for excluding stories whose images format are the specified value.
    # @option opts [Integer] :media_videos_count_min This parameter is used for finding stories whose number of videos is greater than or equal to the specified value.
    # @option opts [Integer] :media_videos_count_max This parameter is used for finding stories whose number of videos is less than or equal to the specified value.
    # @option opts [Array<Integer>] :author_id This parameter is used for finding stories whose author id is the specified value.
    # @option opts [Array<Integer>] :not_author_id This parameter is used for excluding stories whose author id is the specified value.
    # @option opts [String] :author_name This parameter is used for finding stories whose author full name contains the specified value.
    # @option opts [String] :not_author_name This parameter is used for excluding stories whose author full name contains the specified value.
    # @option opts [Array<Integer>] :source_id This parameter is used for finding stories whose source id is the specified value.
    # @option opts [Array<Integer>] :not_source_id This parameter is used for excluding stories whose source id is the specified value.
    # @option opts [Array<String>] :source_name This parameter is used for finding stories whose source name contains the specified value.
    # @option opts [Array<String>] :not_source_name This parameter is used for excluding stories whose source name contains the specified value.
    # @option opts [Array<String>] :source_domain This parameter is used for finding stories whose source domain is the specified value.
    # @option opts [Array<String>] :not_source_domain This parameter is used for excluding stories whose source domain is the specified value.
    # @option opts [Array<String>] :source_locations_country This parameter is used for finding stories whose source country is the specified value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :not_source_locations_country This parameter is used for excluding stories whose source country is the specified value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_locations_state This parameter is used for finding stories whose source state/province is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :not_source_locations_state This parameter is used for excluding stories whose source state/province is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_locations_city This parameter is used for finding stories whose source city is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :not_source_locations_city This parameter is used for excluding stories whose source city is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_scopes_country This parameter is used for finding stories whose source scopes is the specified country value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :not_source_scopes_country This parameter is used for excluding stories whose source scopes is the specified country value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_scopes_state This parameter is used for finding stories whose source scopes is the specified state/province value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :not_source_scopes_state This parameter is used for excluding stories whose source scopes is the specified state/province value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_scopes_city This parameter is used for finding stories whose source scopes is the specified city value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :not_source_scopes_city This parameter is used for excluding stories whose source scopes is the specified city value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_scopes_level This parameter is used for finding stories whose source scopes is the specified level value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :not_source_scopes_level This parameter is used for excluding stories whose source scopes is the specified level value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Integer] :source_links_in_count_min This parameter is used for finding stories from sources whose Links in count is greater than or equal to the specified value. You can read more about working with Links in count [here](https://newsapi.aylien.com/docs/working-with-links-in-count).
    # @option opts [Integer] :source_links_in_count_max This parameter is used for finding stories from sources whose Links in count is less than or equal to the specified value. You can read more about working with Links in count [here](https://newsapi.aylien.com/docs/working-with-links-in-count).
    # @option opts [Integer] :source_rankings_alexa_rank_min This parameter is used for finding stories from sources whose Alexa rank is greater than or equal to the specified value. You can read more about working with Alexa ranks [here](https://newsapi.aylien.com/docs/working-with-alexa-ranks).
    # @option opts [Integer] :source_rankings_alexa_rank_max This parameter is used for finding stories from sources whose Alexa rank is less than or equal to the specified value. You can read more about working with Alexa ranks [here](https://newsapi.aylien.com/docs/working-with-alexa-ranks).
    # @option opts [Array<String>] :source_rankings_alexa_country This parameter is used for finding stories from sources whose Alexa rank is in the specified country value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. You can read more about working with Alexa ranks [here](https://newsapi.aylien.com/docs/working-with-alexa-ranks).
    # @option opts [Integer] :social_shares_count_facebook_min This parameter is used for finding stories whose Facebook social shares count is greater than or equal to the specified value.
    # @option opts [Integer] :social_shares_count_facebook_max This parameter is used for finding stories whose Facebook social shares count is less than or equal to the specified value.
    # @option opts [Integer] :social_shares_count_google_plus_min This parameter is used for finding stories whose Google+ social shares count is greater than or equal to the specified value.
    # @option opts [Integer] :social_shares_count_google_plus_max This parameter is used for finding stories whose Google+ social shares count is less than or equal to the specified value.
    # @option opts [Integer] :social_shares_count_linkedin_min This parameter is used for finding stories whose LinkedIn social shares count is greater than or equal to the specified value.
    # @option opts [Integer] :social_shares_count_linkedin_max This parameter is used for finding stories whose LinkedIn social shares count is less than or equal to the specified value.
    # @option opts [Integer] :social_shares_count_reddit_min This parameter is used for finding stories whose Reddit social shares count is greater than or equal to the specified value.
    # @option opts [Integer] :social_shares_count_reddit_max This parameter is used for finding stories whose Reddit social shares count is less than or equal to the specified value.
    # @option opts [BOOLEAN] :cluster This parameter enables clustering for the returned stories. You can read more about working with clustering [here](https://newsapi.aylien.com/docs/working-with-clustering). (default to false)
    # @option opts [String] :cluster_algorithm This parameter is used for specifying the clustering algorithm you wish to use. It supprts STC, Lingo and [k-means](https://en.wikipedia.org/wiki/K-means_clustering) algorithms. You can read more about working with clustering [here](https://newsapi.aylien.com/docs/working-with-clustering). (default to lingo)
    # @option opts [Array<String>] :_return This parameter is used for specifying return fields.
    # @option opts [String] :sort_by This parameter is used for changing the order column of the results. (default to published_at)
    # @option opts [String] :sort_direction This parameter is used for changing the order direction of the result. (default to desc)
    # @option opts [String] :cursor This parameter is used for finding a specific page. You can read more about pagination of results [here](https://newsapi.aylien.com/docs/pagination-of-results). (default to *)
    # @option opts [Integer] :per_page This parameter is used for specifying number of items in each page You can read more about pagination of results [here](https://newsapi.aylien.com/docs/pagination-of-results) (default to 10)
    # @return [Stories]
    def list_stories(opts = {})
      data, _status_code, _headers = list_stories_with_http_info(opts)
      return data
    end

    # List Stories
    # This endpoint is used for getting a list of stories.
    # @param [Hash] opts the optional parameters
    # @option opts [Array<Integer>] :id This parameter is used for finding stories by story id.
    # @option opts [Array<Integer>] :not_id This parameter is used for excluding stories by story id.
    # @option opts [String] :title This parameter is used for finding stories whose title contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
    # @option opts [String] :body This parameter is used for finding stories whose body contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
    # @option opts [String] :text This parameter is used for finding stories whose title or body contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
    # @option opts [Array<String>] :language This parameter is used for finding stories whose language is the specified value. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes.
    # @option opts [Array<String>] :not_language This parameter is used for excluding stories whose language is the specified value. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes.
    # @option opts [String] :published_at_start This parameter is used for finding stories whose published at time is greater than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates).
    # @option opts [String] :published_at_end This parameter is used for finding stories whose published at time is less than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates).
    # @option opts [String] :categories_taxonomy This parameter is used for defining the type of the taxonomy for the rest of the categories queries. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).
    # @option opts [BOOLEAN] :categories_confident This parameter is used for finding stories whose categories are confident. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).
    # @option opts [Array<String>] :categories_id This parameter is used for finding stories by categories id. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).
    # @option opts [Array<String>] :not_categories_id This parameter is used for excluding stories by categories id. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).
    # @option opts [Array<Integer>] :categories_level This parameter is used for finding stories by categories level. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).
    # @option opts [Array<Integer>] :not_categories_level This parameter is used for excluding stories by categories level. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).
    # @option opts [Array<String>] :entities_title_text This parameter is used to find stories based on the specified entities &#x60;text&#x60; in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :not_entities_title_text This parameter is used to exclude stories based on the specified entities &#x60;text&#x60; in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :entities_title_type This parameter is used to find stories based on the specified entities &#x60;type&#x60; in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :not_entities_title_type This parameter is used to exclude stories based on the specified entities &#x60;type&#x60; in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :entities_title_links_dbpedia This parameter is used to find stories based on the specified entities dbpedia URL in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :not_entities_title_links_dbpedia This parameter is used to exclude stories based on the specified entities dbpedia URL in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :entities_body_text This parameter is used to find stories based on the specified entities &#x60;text&#x60; in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :not_entities_body_text This parameter is used to exclude stories based on the specified entities &#x60;text&#x60; in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :entities_body_type This parameter is used to find stories based on the specified entities &#x60;type&#x60; in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :not_entities_body_type This parameter is used to exclude stories based on the specified entities &#x60;type&#x60; in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :entities_body_links_dbpedia This parameter is used to find stories based on the specified entities dbpedia URL in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :not_entities_body_links_dbpedia This parameter is used to exclude stories based on the specified entities dbpedia URL in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [String] :sentiment_title_polarity This parameter is used for finding stories whose title sentiment is the specified value.
    # @option opts [String] :not_sentiment_title_polarity This parameter is used for excluding stories whose title sentiment is the specified value.
    # @option opts [String] :sentiment_body_polarity This parameter is used for finding stories whose body sentiment is the specified value.
    # @option opts [String] :not_sentiment_body_polarity This parameter is used for excluding stories whose body sentiment is the specified value.
    # @option opts [Integer] :media_images_count_min This parameter is used for finding stories whose number of images is greater than or equal to the specified value.
    # @option opts [Integer] :media_images_count_max This parameter is used for finding stories whose number of images is less than or equal to the specified value.
    # @option opts [Integer] :media_images_width_min This parameter is used for finding stories whose width of images are greater than or equal to the specified value.
    # @option opts [Integer] :media_images_width_max This parameter is used for finding stories whose width of images are less than or equal to the specified value.
    # @option opts [Integer] :media_images_height_min This parameter is used for finding stories whose height of images are greater than or equal to the specified value.
    # @option opts [Integer] :media_images_height_max This parameter is used for finding stories whose height of images are less than or equal to the specified value.
    # @option opts [Integer] :media_images_content_length_min This parameter is used for finding stories whose images content length are greater than or equal to the specified value.
    # @option opts [Integer] :media_images_content_length_max This parameter is used for finding stories whose images content length are less than or equal to the specified value.
    # @option opts [Array<String>] :media_images_format This parameter is used for finding stories whose images format are the specified value.
    # @option opts [Array<String>] :not_media_images_format This parameter is used for excluding stories whose images format are the specified value.
    # @option opts [Integer] :media_videos_count_min This parameter is used for finding stories whose number of videos is greater than or equal to the specified value.
    # @option opts [Integer] :media_videos_count_max This parameter is used for finding stories whose number of videos is less than or equal to the specified value.
    # @option opts [Array<Integer>] :author_id This parameter is used for finding stories whose author id is the specified value.
    # @option opts [Array<Integer>] :not_author_id This parameter is used for excluding stories whose author id is the specified value.
    # @option opts [String] :author_name This parameter is used for finding stories whose author full name contains the specified value.
    # @option opts [String] :not_author_name This parameter is used for excluding stories whose author full name contains the specified value.
    # @option opts [Array<Integer>] :source_id This parameter is used for finding stories whose source id is the specified value.
    # @option opts [Array<Integer>] :not_source_id This parameter is used for excluding stories whose source id is the specified value.
    # @option opts [Array<String>] :source_name This parameter is used for finding stories whose source name contains the specified value.
    # @option opts [Array<String>] :not_source_name This parameter is used for excluding stories whose source name contains the specified value.
    # @option opts [Array<String>] :source_domain This parameter is used for finding stories whose source domain is the specified value.
    # @option opts [Array<String>] :not_source_domain This parameter is used for excluding stories whose source domain is the specified value.
    # @option opts [Array<String>] :source_locations_country This parameter is used for finding stories whose source country is the specified value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :not_source_locations_country This parameter is used for excluding stories whose source country is the specified value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_locations_state This parameter is used for finding stories whose source state/province is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :not_source_locations_state This parameter is used for excluding stories whose source state/province is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_locations_city This parameter is used for finding stories whose source city is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :not_source_locations_city This parameter is used for excluding stories whose source city is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_scopes_country This parameter is used for finding stories whose source scopes is the specified country value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :not_source_scopes_country This parameter is used for excluding stories whose source scopes is the specified country value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_scopes_state This parameter is used for finding stories whose source scopes is the specified state/province value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :not_source_scopes_state This parameter is used for excluding stories whose source scopes is the specified state/province value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_scopes_city This parameter is used for finding stories whose source scopes is the specified city value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :not_source_scopes_city This parameter is used for excluding stories whose source scopes is the specified city value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_scopes_level This parameter is used for finding stories whose source scopes is the specified level value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :not_source_scopes_level This parameter is used for excluding stories whose source scopes is the specified level value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Integer] :source_links_in_count_min This parameter is used for finding stories from sources whose Links in count is greater than or equal to the specified value. You can read more about working with Links in count [here](https://newsapi.aylien.com/docs/working-with-links-in-count).
    # @option opts [Integer] :source_links_in_count_max This parameter is used for finding stories from sources whose Links in count is less than or equal to the specified value. You can read more about working with Links in count [here](https://newsapi.aylien.com/docs/working-with-links-in-count).
    # @option opts [Integer] :source_rankings_alexa_rank_min This parameter is used for finding stories from sources whose Alexa rank is greater than or equal to the specified value. You can read more about working with Alexa ranks [here](https://newsapi.aylien.com/docs/working-with-alexa-ranks).
    # @option opts [Integer] :source_rankings_alexa_rank_max This parameter is used for finding stories from sources whose Alexa rank is less than or equal to the specified value. You can read more about working with Alexa ranks [here](https://newsapi.aylien.com/docs/working-with-alexa-ranks).
    # @option opts [Array<String>] :source_rankings_alexa_country This parameter is used for finding stories from sources whose Alexa rank is in the specified country value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. You can read more about working with Alexa ranks [here](https://newsapi.aylien.com/docs/working-with-alexa-ranks).
    # @option opts [Integer] :social_shares_count_facebook_min This parameter is used for finding stories whose Facebook social shares count is greater than or equal to the specified value.
    # @option opts [Integer] :social_shares_count_facebook_max This parameter is used for finding stories whose Facebook social shares count is less than or equal to the specified value.
    # @option opts [Integer] :social_shares_count_google_plus_min This parameter is used for finding stories whose Google+ social shares count is greater than or equal to the specified value.
    # @option opts [Integer] :social_shares_count_google_plus_max This parameter is used for finding stories whose Google+ social shares count is less than or equal to the specified value.
    # @option opts [Integer] :social_shares_count_linkedin_min This parameter is used for finding stories whose LinkedIn social shares count is greater than or equal to the specified value.
    # @option opts [Integer] :social_shares_count_linkedin_max This parameter is used for finding stories whose LinkedIn social shares count is less than or equal to the specified value.
    # @option opts [Integer] :social_shares_count_reddit_min This parameter is used for finding stories whose Reddit social shares count is greater than or equal to the specified value.
    # @option opts [Integer] :social_shares_count_reddit_max This parameter is used for finding stories whose Reddit social shares count is less than or equal to the specified value.
    # @option opts [BOOLEAN] :cluster This parameter enables clustering for the returned stories. You can read more about working with clustering [here](https://newsapi.aylien.com/docs/working-with-clustering).
    # @option opts [String] :cluster_algorithm This parameter is used for specifying the clustering algorithm you wish to use. It supprts STC, Lingo and [k-means](https://en.wikipedia.org/wiki/K-means_clustering) algorithms. You can read more about working with clustering [here](https://newsapi.aylien.com/docs/working-with-clustering).
    # @option opts [Array<String>] :_return This parameter is used for specifying return fields.
    # @option opts [String] :sort_by This parameter is used for changing the order column of the results.
    # @option opts [String] :sort_direction This parameter is used for changing the order direction of the result.
    # @option opts [String] :cursor This parameter is used for finding a specific page. You can read more about pagination of results [here](https://newsapi.aylien.com/docs/pagination-of-results).
    # @option opts [Integer] :per_page This parameter is used for specifying number of items in each page You can read more about pagination of results [here](https://newsapi.aylien.com/docs/pagination-of-results)
    # @return [Array<(Stories, Fixnum, Hash)>] Stories data, response status code and response headers
    def list_stories_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: DefaultApi.list_stories ..."
      end
      if opts[:'language'] && !opts[:'language'].all?{|item| ['en', 'de', 'fr', 'it', 'es', 'pt'].include?(item)}
        fail ArgumentError, 'invalid value for "language", must include one of en, de, fr, it, es, pt'
      end
      if opts[:'not_language'] && !opts[:'not_language'].all?{|item| ['en', 'de', 'fr', 'it', 'es', 'pt'].include?(item)}
        fail ArgumentError, 'invalid value for "not_language", must include one of en, de, fr, it, es, pt'
      end
      if opts[:'categories_taxonomy'] && !['iab-qag', 'iptc-subjectcode'].include?(opts[:'categories_taxonomy'])
        fail ArgumentError, 'invalid value for "categories_taxonomy", must be one of iab-qag, iptc-subjectcode'
      end
      if opts[:'sentiment_title_polarity'] && !['positive', 'neutral', 'negative'].include?(opts[:'sentiment_title_polarity'])
        fail ArgumentError, 'invalid value for "sentiment_title_polarity", must be one of positive, neutral, negative'
      end
      if opts[:'not_sentiment_title_polarity'] && !['positive', 'neutral', 'negative'].include?(opts[:'not_sentiment_title_polarity'])
        fail ArgumentError, 'invalid value for "not_sentiment_title_polarity", must be one of positive, neutral, negative'
      end
      if opts[:'sentiment_body_polarity'] && !['positive', 'neutral', 'negative'].include?(opts[:'sentiment_body_polarity'])
        fail ArgumentError, 'invalid value for "sentiment_body_polarity", must be one of positive, neutral, negative'
      end
      if opts[:'not_sentiment_body_polarity'] && !['positive', 'neutral', 'negative'].include?(opts[:'not_sentiment_body_polarity'])
        fail ArgumentError, 'invalid value for "not_sentiment_body_polarity", must be one of positive, neutral, negative'
      end
      if !opts[:'media_images_count_min'].nil? && opts[:'media_images_count_min'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"media_images_count_min"]" when calling DefaultApi.list_stories, must be greater than 0.'
      end

      if !opts[:'media_images_count_max'].nil? && opts[:'media_images_count_max'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"media_images_count_max"]" when calling DefaultApi.list_stories, must be greater than 0.'
      end

      if !opts[:'media_images_width_min'].nil? && opts[:'media_images_width_min'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"media_images_width_min"]" when calling DefaultApi.list_stories, must be greater than 0.'
      end

      if !opts[:'media_images_width_max'].nil? && opts[:'media_images_width_max'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"media_images_width_max"]" when calling DefaultApi.list_stories, must be greater than 0.'
      end

      if !opts[:'media_images_height_min'].nil? && opts[:'media_images_height_min'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"media_images_height_min"]" when calling DefaultApi.list_stories, must be greater than 0.'
      end

      if !opts[:'media_images_height_max'].nil? && opts[:'media_images_height_max'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"media_images_height_max"]" when calling DefaultApi.list_stories, must be greater than 0.'
      end

      if !opts[:'media_images_content_length_min'].nil? && opts[:'media_images_content_length_min'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"media_images_content_length_min"]" when calling DefaultApi.list_stories, must be greater than 0.'
      end

      if !opts[:'media_images_content_length_max'].nil? && opts[:'media_images_content_length_max'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"media_images_content_length_max"]" when calling DefaultApi.list_stories, must be greater than 0.'
      end

      if opts[:'media_images_format'] && !opts[:'media_images_format'].all?{|item| ['BMP', 'GIF', 'JPEG', 'PNG', 'TIFF', 'PSD', 'ICO', 'CUR', 'WEBP', 'SVG'].include?(item)}
        fail ArgumentError, 'invalid value for "media_images_format", must include one of BMP, GIF, JPEG, PNG, TIFF, PSD, ICO, CUR, WEBP, SVG'
      end
      if opts[:'not_media_images_format'] && !opts[:'not_media_images_format'].all?{|item| ['BMP', 'GIF', 'JPEG', 'PNG', 'TIFF', 'PSD', 'ICO', 'CUR', 'WEBP', 'SVG'].include?(item)}
        fail ArgumentError, 'invalid value for "not_media_images_format", must include one of BMP, GIF, JPEG, PNG, TIFF, PSD, ICO, CUR, WEBP, SVG'
      end
      if !opts[:'media_videos_count_min'].nil? && opts[:'media_videos_count_min'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"media_videos_count_min"]" when calling DefaultApi.list_stories, must be greater than 0.'
      end

      if !opts[:'media_videos_count_max'].nil? && opts[:'media_videos_count_max'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"media_videos_count_max"]" when calling DefaultApi.list_stories, must be greater than 0.'
      end

      if opts[:'source_scopes_level'] && !opts[:'source_scopes_level'].all?{|item| ['international', 'national', 'local'].include?(item)}
        fail ArgumentError, 'invalid value for "source_scopes_level", must include one of international, national, local'
      end
      if opts[:'not_source_scopes_level'] && !opts[:'not_source_scopes_level'].all?{|item| ['international', 'national', 'local'].include?(item)}
        fail ArgumentError, 'invalid value for "not_source_scopes_level", must include one of international, national, local'
      end
      if !opts[:'source_links_in_count_min'].nil? && opts[:'source_links_in_count_min'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"source_links_in_count_min"]" when calling DefaultApi.list_stories, must be greater than 0.'
      end

      if !opts[:'source_links_in_count_max'].nil? && opts[:'source_links_in_count_max'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"source_links_in_count_max"]" when calling DefaultApi.list_stories, must be greater than 0.'
      end

      if !opts[:'source_rankings_alexa_rank_min'].nil? && opts[:'source_rankings_alexa_rank_min'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"source_rankings_alexa_rank_min"]" when calling DefaultApi.list_stories, must be greater than 0.'
      end

      if !opts[:'source_rankings_alexa_rank_max'].nil? && opts[:'source_rankings_alexa_rank_max'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"source_rankings_alexa_rank_max"]" when calling DefaultApi.list_stories, must be greater than 0.'
      end

      if !opts[:'social_shares_count_facebook_min'].nil? && opts[:'social_shares_count_facebook_min'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"social_shares_count_facebook_min"]" when calling DefaultApi.list_stories, must be greater than 0.'
      end

      if !opts[:'social_shares_count_facebook_max'].nil? && opts[:'social_shares_count_facebook_max'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"social_shares_count_facebook_max"]" when calling DefaultApi.list_stories, must be greater than 0.'
      end

      if !opts[:'social_shares_count_google_plus_min'].nil? && opts[:'social_shares_count_google_plus_min'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"social_shares_count_google_plus_min"]" when calling DefaultApi.list_stories, must be greater than 0.'
      end

      if !opts[:'social_shares_count_google_plus_max'].nil? && opts[:'social_shares_count_google_plus_max'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"social_shares_count_google_plus_max"]" when calling DefaultApi.list_stories, must be greater than 0.'
      end

      if !opts[:'social_shares_count_linkedin_min'].nil? && opts[:'social_shares_count_linkedin_min'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"social_shares_count_linkedin_min"]" when calling DefaultApi.list_stories, must be greater than 0.'
      end

      if !opts[:'social_shares_count_linkedin_max'].nil? && opts[:'social_shares_count_linkedin_max'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"social_shares_count_linkedin_max"]" when calling DefaultApi.list_stories, must be greater than 0.'
      end

      if !opts[:'social_shares_count_reddit_min'].nil? && opts[:'social_shares_count_reddit_min'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"social_shares_count_reddit_min"]" when calling DefaultApi.list_stories, must be greater than 0.'
      end

      if !opts[:'social_shares_count_reddit_max'].nil? && opts[:'social_shares_count_reddit_max'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"social_shares_count_reddit_max"]" when calling DefaultApi.list_stories, must be greater than 0.'
      end

      if opts[:'cluster_algorithm'] && !['stc', 'lingo', 'kmeans'].include?(opts[:'cluster_algorithm'])
        fail ArgumentError, 'invalid value for "cluster_algorithm", must be one of stc, lingo, kmeans'
      end
      if opts[:'_return'] && !opts[:'_return'].all?{|item| ['id', 'title', 'body', 'summary', 'source', 'author', 'entities', 'keywords', 'hashtags', 'characters_count', 'words_count', 'sentences_count', 'paragraphs_count', 'categories', 'social_shares_count', 'media', 'sentiment', 'language', 'published_at', 'links'].include?(item)}
        fail ArgumentError, 'invalid value for "_return", must include one of id, title, body, summary, source, author, entities, keywords, hashtags, characters_count, words_count, sentences_count, paragraphs_count, categories, social_shares_count, media, sentiment, language, published_at, links'
      end
      if opts[:'sort_by'] && !['relevance', 'recency', 'hotness', 'published_at', 'social_shares_count', 'social_shares_count.facebook', 'social_shares_count.linkedin', 'social_shares_count.google_plus', 'social_shares_count.reddit', 'media.images.count', 'media.videos.count', 'source.links_in_count', 'source.rankings.alexa.rank', 'source.rankings.alexa.rank.AF', 'source.rankings.alexa.rank.AX', 'source.rankings.alexa.rank.AL', 'source.rankings.alexa.rank.DZ', 'source.rankings.alexa.rank.AS', 'source.rankings.alexa.rank.AD', 'source.rankings.alexa.rank.AO', 'source.rankings.alexa.rank.AI', 'source.rankings.alexa.rank.AQ', 'source.rankings.alexa.rank.AG', 'source.rankings.alexa.rank.AR', 'source.rankings.alexa.rank.AM', 'source.rankings.alexa.rank.AW', 'source.rankings.alexa.rank.AU', 'source.rankings.alexa.rank.AT', 'source.rankings.alexa.rank.AZ', 'source.rankings.alexa.rank.BS', 'source.rankings.alexa.rank.BH', 'source.rankings.alexa.rank.BD', 'source.rankings.alexa.rank.BB', 'source.rankings.alexa.rank.BY', 'source.rankings.alexa.rank.BE', 'source.rankings.alexa.rank.BZ', 'source.rankings.alexa.rank.BJ', 'source.rankings.alexa.rank.BM', 'source.rankings.alexa.rank.BT', 'source.rankings.alexa.rank.BO', 'source.rankings.alexa.rank.BQ', 'source.rankings.alexa.rank.BA', 'source.rankings.alexa.rank.BW', 'source.rankings.alexa.rank.BV', 'source.rankings.alexa.rank.BR', 'source.rankings.alexa.rank.IO', 'source.rankings.alexa.rank.BN', 'source.rankings.alexa.rank.BG', 'source.rankings.alexa.rank.BF', 'source.rankings.alexa.rank.BI', 'source.rankings.alexa.rank.KH', 'source.rankings.alexa.rank.CM', 'source.rankings.alexa.rank.CA', 'source.rankings.alexa.rank.CV', 'source.rankings.alexa.rank.KY', 'source.rankings.alexa.rank.CF', 'source.rankings.alexa.rank.TD', 'source.rankings.alexa.rank.CL', 'source.rankings.alexa.rank.CN', 'source.rankings.alexa.rank.CX', 'source.rankings.alexa.rank.CC', 'source.rankings.alexa.rank.CO', 'source.rankings.alexa.rank.KM', 'source.rankings.alexa.rank.CG', 'source.rankings.alexa.rank.CD', 'source.rankings.alexa.rank.CK', 'source.rankings.alexa.rank.CR', 'source.rankings.alexa.rank.CI', 'source.rankings.alexa.rank.HR', 'source.rankings.alexa.rank.CU', 'source.rankings.alexa.rank.CW', 'source.rankings.alexa.rank.CY', 'source.rankings.alexa.rank.CZ', 'source.rankings.alexa.rank.DK', 'source.rankings.alexa.rank.DJ', 'source.rankings.alexa.rank.DM', 'source.rankings.alexa.rank.DO', 'source.rankings.alexa.rank.EC', 'source.rankings.alexa.rank.EG', 'source.rankings.alexa.rank.SV', 'source.rankings.alexa.rank.GQ', 'source.rankings.alexa.rank.ER', 'source.rankings.alexa.rank.EE', 'source.rankings.alexa.rank.ET', 'source.rankings.alexa.rank.FK', 'source.rankings.alexa.rank.FO', 'source.rankings.alexa.rank.FJ', 'source.rankings.alexa.rank.FI', 'source.rankings.alexa.rank.FR', 'source.rankings.alexa.rank.GF', 'source.rankings.alexa.rank.PF', 'source.rankings.alexa.rank.TF', 'source.rankings.alexa.rank.GA', 'source.rankings.alexa.rank.GM', 'source.rankings.alexa.rank.GE', 'source.rankings.alexa.rank.DE', 'source.rankings.alexa.rank.GH', 'source.rankings.alexa.rank.GI', 'source.rankings.alexa.rank.GR', 'source.rankings.alexa.rank.GL', 'source.rankings.alexa.rank.GD', 'source.rankings.alexa.rank.GP', 'source.rankings.alexa.rank.GU', 'source.rankings.alexa.rank.GT', 'source.rankings.alexa.rank.GG', 'source.rankings.alexa.rank.GN', 'source.rankings.alexa.rank.GW', 'source.rankings.alexa.rank.GY', 'source.rankings.alexa.rank.HT', 'source.rankings.alexa.rank.HM', 'source.rankings.alexa.rank.VA', 'source.rankings.alexa.rank.HN', 'source.rankings.alexa.rank.HK', 'source.rankings.alexa.rank.HU', 'source.rankings.alexa.rank.IS', 'source.rankings.alexa.rank.IN', 'source.rankings.alexa.rank.ID', 'source.rankings.alexa.rank.IR', 'source.rankings.alexa.rank.IQ', 'source.rankings.alexa.rank.IE', 'source.rankings.alexa.rank.IM', 'source.rankings.alexa.rank.IL', 'source.rankings.alexa.rank.IT', 'source.rankings.alexa.rank.JM', 'source.rankings.alexa.rank.JP', 'source.rankings.alexa.rank.JE', 'source.rankings.alexa.rank.JO', 'source.rankings.alexa.rank.KZ', 'source.rankings.alexa.rank.KE', 'source.rankings.alexa.rank.KI', 'source.rankings.alexa.rank.KP', 'source.rankings.alexa.rank.KR', 'source.rankings.alexa.rank.KW', 'source.rankings.alexa.rank.KG', 'source.rankings.alexa.rank.LA', 'source.rankings.alexa.rank.LV', 'source.rankings.alexa.rank.LB', 'source.rankings.alexa.rank.LS', 'source.rankings.alexa.rank.LR', 'source.rankings.alexa.rank.LY', 'source.rankings.alexa.rank.LI', 'source.rankings.alexa.rank.LT', 'source.rankings.alexa.rank.LU', 'source.rankings.alexa.rank.MO', 'source.rankings.alexa.rank.MK', 'source.rankings.alexa.rank.MG', 'source.rankings.alexa.rank.MW', 'source.rankings.alexa.rank.MY', 'source.rankings.alexa.rank.MV', 'source.rankings.alexa.rank.ML', 'source.rankings.alexa.rank.MT', 'source.rankings.alexa.rank.MH', 'source.rankings.alexa.rank.MQ', 'source.rankings.alexa.rank.MR', 'source.rankings.alexa.rank.MU', 'source.rankings.alexa.rank.YT', 'source.rankings.alexa.rank.MX', 'source.rankings.alexa.rank.FM', 'source.rankings.alexa.rank.MD', 'source.rankings.alexa.rank.MC', 'source.rankings.alexa.rank.MN', 'source.rankings.alexa.rank.ME', 'source.rankings.alexa.rank.MS', 'source.rankings.alexa.rank.MA', 'source.rankings.alexa.rank.MZ', 'source.rankings.alexa.rank.MM', 'source.rankings.alexa.rank.NA', 'source.rankings.alexa.rank.NR', 'source.rankings.alexa.rank.NP', 'source.rankings.alexa.rank.NL', 'source.rankings.alexa.rank.NC', 'source.rankings.alexa.rank.NZ', 'source.rankings.alexa.rank.NI', 'source.rankings.alexa.rank.NE', 'source.rankings.alexa.rank.NG', 'source.rankings.alexa.rank.NU', 'source.rankings.alexa.rank.NF', 'source.rankings.alexa.rank.MP', 'source.rankings.alexa.rank.NO', 'source.rankings.alexa.rank.OM', 'source.rankings.alexa.rank.PK', 'source.rankings.alexa.rank.PW', 'source.rankings.alexa.rank.PS', 'source.rankings.alexa.rank.PA', 'source.rankings.alexa.rank.PG', 'source.rankings.alexa.rank.PY', 'source.rankings.alexa.rank.PE', 'source.rankings.alexa.rank.PH', 'source.rankings.alexa.rank.PN', 'source.rankings.alexa.rank.PL', 'source.rankings.alexa.rank.PT', 'source.rankings.alexa.rank.PR', 'source.rankings.alexa.rank.QA', 'source.rankings.alexa.rank.RE', 'source.rankings.alexa.rank.RO', 'source.rankings.alexa.rank.RU', 'source.rankings.alexa.rank.RW', 'source.rankings.alexa.rank.BL', 'source.rankings.alexa.rank.SH', 'source.rankings.alexa.rank.KN', 'source.rankings.alexa.rank.LC', 'source.rankings.alexa.rank.MF', 'source.rankings.alexa.rank.PM', 'source.rankings.alexa.rank.VC', 'source.rankings.alexa.rank.WS', 'source.rankings.alexa.rank.SM', 'source.rankings.alexa.rank.ST', 'source.rankings.alexa.rank.SA', 'source.rankings.alexa.rank.SN', 'source.rankings.alexa.rank.RS', 'source.rankings.alexa.rank.SC', 'source.rankings.alexa.rank.SL', 'source.rankings.alexa.rank.SG', 'source.rankings.alexa.rank.SX', 'source.rankings.alexa.rank.SK', 'source.rankings.alexa.rank.SI', 'source.rankings.alexa.rank.SB', 'source.rankings.alexa.rank.SO', 'source.rankings.alexa.rank.ZA', 'source.rankings.alexa.rank.GS', 'source.rankings.alexa.rank.SS', 'source.rankings.alexa.rank.ES', 'source.rankings.alexa.rank.LK', 'source.rankings.alexa.rank.SD', 'source.rankings.alexa.rank.SR', 'source.rankings.alexa.rank.SJ', 'source.rankings.alexa.rank.SZ', 'source.rankings.alexa.rank.SE', 'source.rankings.alexa.rank.CH', 'source.rankings.alexa.rank.SY', 'source.rankings.alexa.rank.TW', 'source.rankings.alexa.rank.TJ', 'source.rankings.alexa.rank.TZ', 'source.rankings.alexa.rank.TH', 'source.rankings.alexa.rank.TL', 'source.rankings.alexa.rank.TG', 'source.rankings.alexa.rank.TK', 'source.rankings.alexa.rank.TO', 'source.rankings.alexa.rank.TT', 'source.rankings.alexa.rank.TN', 'source.rankings.alexa.rank.TR', 'source.rankings.alexa.rank.TM', 'source.rankings.alexa.rank.TC', 'source.rankings.alexa.rank.TV', 'source.rankings.alexa.rank.UG', 'source.rankings.alexa.rank.UA', 'source.rankings.alexa.rank.AE', 'source.rankings.alexa.rank.GB', 'source.rankings.alexa.rank.US', 'source.rankings.alexa.rank.UM', 'source.rankings.alexa.rank.UY', 'source.rankings.alexa.rank.UZ', 'source.rankings.alexa.rank.VU', 'source.rankings.alexa.rank.VE', 'source.rankings.alexa.rank.VN', 'source.rankings.alexa.rank.VG', 'source.rankings.alexa.rank.VI', 'source.rankings.alexa.rank.WF', 'source.rankings.alexa.rank.EH', 'source.rankings.alexa.rank.YE', 'source.rankings.alexa.rank.ZM', 'source.rankings.alexa.rank.ZW'].include?(opts[:'sort_by'])
        fail ArgumentError, 'invalid value for "sort_by", must be one of relevance, recency, hotness, published_at, social_shares_count, social_shares_count.facebook, social_shares_count.linkedin, social_shares_count.google_plus, social_shares_count.reddit, media.images.count, media.videos.count, source.links_in_count, source.rankings.alexa.rank, source.rankings.alexa.rank.AF, source.rankings.alexa.rank.AX, source.rankings.alexa.rank.AL, source.rankings.alexa.rank.DZ, source.rankings.alexa.rank.AS, source.rankings.alexa.rank.AD, source.rankings.alexa.rank.AO, source.rankings.alexa.rank.AI, source.rankings.alexa.rank.AQ, source.rankings.alexa.rank.AG, source.rankings.alexa.rank.AR, source.rankings.alexa.rank.AM, source.rankings.alexa.rank.AW, source.rankings.alexa.rank.AU, source.rankings.alexa.rank.AT, source.rankings.alexa.rank.AZ, source.rankings.alexa.rank.BS, source.rankings.alexa.rank.BH, source.rankings.alexa.rank.BD, source.rankings.alexa.rank.BB, source.rankings.alexa.rank.BY, source.rankings.alexa.rank.BE, source.rankings.alexa.rank.BZ, source.rankings.alexa.rank.BJ, source.rankings.alexa.rank.BM, source.rankings.alexa.rank.BT, source.rankings.alexa.rank.BO, source.rankings.alexa.rank.BQ, source.rankings.alexa.rank.BA, source.rankings.alexa.rank.BW, source.rankings.alexa.rank.BV, source.rankings.alexa.rank.BR, source.rankings.alexa.rank.IO, source.rankings.alexa.rank.BN, source.rankings.alexa.rank.BG, source.rankings.alexa.rank.BF, source.rankings.alexa.rank.BI, source.rankings.alexa.rank.KH, source.rankings.alexa.rank.CM, source.rankings.alexa.rank.CA, source.rankings.alexa.rank.CV, source.rankings.alexa.rank.KY, source.rankings.alexa.rank.CF, source.rankings.alexa.rank.TD, source.rankings.alexa.rank.CL, source.rankings.alexa.rank.CN, source.rankings.alexa.rank.CX, source.rankings.alexa.rank.CC, source.rankings.alexa.rank.CO, source.rankings.alexa.rank.KM, source.rankings.alexa.rank.CG, source.rankings.alexa.rank.CD, source.rankings.alexa.rank.CK, source.rankings.alexa.rank.CR, source.rankings.alexa.rank.CI, source.rankings.alexa.rank.HR, source.rankings.alexa.rank.CU, source.rankings.alexa.rank.CW, source.rankings.alexa.rank.CY, source.rankings.alexa.rank.CZ, source.rankings.alexa.rank.DK, source.rankings.alexa.rank.DJ, source.rankings.alexa.rank.DM, source.rankings.alexa.rank.DO, source.rankings.alexa.rank.EC, source.rankings.alexa.rank.EG, source.rankings.alexa.rank.SV, source.rankings.alexa.rank.GQ, source.rankings.alexa.rank.ER, source.rankings.alexa.rank.EE, source.rankings.alexa.rank.ET, source.rankings.alexa.rank.FK, source.rankings.alexa.rank.FO, source.rankings.alexa.rank.FJ, source.rankings.alexa.rank.FI, source.rankings.alexa.rank.FR, source.rankings.alexa.rank.GF, source.rankings.alexa.rank.PF, source.rankings.alexa.rank.TF, source.rankings.alexa.rank.GA, source.rankings.alexa.rank.GM, source.rankings.alexa.rank.GE, source.rankings.alexa.rank.DE, source.rankings.alexa.rank.GH, source.rankings.alexa.rank.GI, source.rankings.alexa.rank.GR, source.rankings.alexa.rank.GL, source.rankings.alexa.rank.GD, source.rankings.alexa.rank.GP, source.rankings.alexa.rank.GU, source.rankings.alexa.rank.GT, source.rankings.alexa.rank.GG, source.rankings.alexa.rank.GN, source.rankings.alexa.rank.GW, source.rankings.alexa.rank.GY, source.rankings.alexa.rank.HT, source.rankings.alexa.rank.HM, source.rankings.alexa.rank.VA, source.rankings.alexa.rank.HN, source.rankings.alexa.rank.HK, source.rankings.alexa.rank.HU, source.rankings.alexa.rank.IS, source.rankings.alexa.rank.IN, source.rankings.alexa.rank.ID, source.rankings.alexa.rank.IR, source.rankings.alexa.rank.IQ, source.rankings.alexa.rank.IE, source.rankings.alexa.rank.IM, source.rankings.alexa.rank.IL, source.rankings.alexa.rank.IT, source.rankings.alexa.rank.JM, source.rankings.alexa.rank.JP, source.rankings.alexa.rank.JE, source.rankings.alexa.rank.JO, source.rankings.alexa.rank.KZ, source.rankings.alexa.rank.KE, source.rankings.alexa.rank.KI, source.rankings.alexa.rank.KP, source.rankings.alexa.rank.KR, source.rankings.alexa.rank.KW, source.rankings.alexa.rank.KG, source.rankings.alexa.rank.LA, source.rankings.alexa.rank.LV, source.rankings.alexa.rank.LB, source.rankings.alexa.rank.LS, source.rankings.alexa.rank.LR, source.rankings.alexa.rank.LY, source.rankings.alexa.rank.LI, source.rankings.alexa.rank.LT, source.rankings.alexa.rank.LU, source.rankings.alexa.rank.MO, source.rankings.alexa.rank.MK, source.rankings.alexa.rank.MG, source.rankings.alexa.rank.MW, source.rankings.alexa.rank.MY, source.rankings.alexa.rank.MV, source.rankings.alexa.rank.ML, source.rankings.alexa.rank.MT, source.rankings.alexa.rank.MH, source.rankings.alexa.rank.MQ, source.rankings.alexa.rank.MR, source.rankings.alexa.rank.MU, source.rankings.alexa.rank.YT, source.rankings.alexa.rank.MX, source.rankings.alexa.rank.FM, source.rankings.alexa.rank.MD, source.rankings.alexa.rank.MC, source.rankings.alexa.rank.MN, source.rankings.alexa.rank.ME, source.rankings.alexa.rank.MS, source.rankings.alexa.rank.MA, source.rankings.alexa.rank.MZ, source.rankings.alexa.rank.MM, source.rankings.alexa.rank.NA, source.rankings.alexa.rank.NR, source.rankings.alexa.rank.NP, source.rankings.alexa.rank.NL, source.rankings.alexa.rank.NC, source.rankings.alexa.rank.NZ, source.rankings.alexa.rank.NI, source.rankings.alexa.rank.NE, source.rankings.alexa.rank.NG, source.rankings.alexa.rank.NU, source.rankings.alexa.rank.NF, source.rankings.alexa.rank.MP, source.rankings.alexa.rank.NO, source.rankings.alexa.rank.OM, source.rankings.alexa.rank.PK, source.rankings.alexa.rank.PW, source.rankings.alexa.rank.PS, source.rankings.alexa.rank.PA, source.rankings.alexa.rank.PG, source.rankings.alexa.rank.PY, source.rankings.alexa.rank.PE, source.rankings.alexa.rank.PH, source.rankings.alexa.rank.PN, source.rankings.alexa.rank.PL, source.rankings.alexa.rank.PT, source.rankings.alexa.rank.PR, source.rankings.alexa.rank.QA, source.rankings.alexa.rank.RE, source.rankings.alexa.rank.RO, source.rankings.alexa.rank.RU, source.rankings.alexa.rank.RW, source.rankings.alexa.rank.BL, source.rankings.alexa.rank.SH, source.rankings.alexa.rank.KN, source.rankings.alexa.rank.LC, source.rankings.alexa.rank.MF, source.rankings.alexa.rank.PM, source.rankings.alexa.rank.VC, source.rankings.alexa.rank.WS, source.rankings.alexa.rank.SM, source.rankings.alexa.rank.ST, source.rankings.alexa.rank.SA, source.rankings.alexa.rank.SN, source.rankings.alexa.rank.RS, source.rankings.alexa.rank.SC, source.rankings.alexa.rank.SL, source.rankings.alexa.rank.SG, source.rankings.alexa.rank.SX, source.rankings.alexa.rank.SK, source.rankings.alexa.rank.SI, source.rankings.alexa.rank.SB, source.rankings.alexa.rank.SO, source.rankings.alexa.rank.ZA, source.rankings.alexa.rank.GS, source.rankings.alexa.rank.SS, source.rankings.alexa.rank.ES, source.rankings.alexa.rank.LK, source.rankings.alexa.rank.SD, source.rankings.alexa.rank.SR, source.rankings.alexa.rank.SJ, source.rankings.alexa.rank.SZ, source.rankings.alexa.rank.SE, source.rankings.alexa.rank.CH, source.rankings.alexa.rank.SY, source.rankings.alexa.rank.TW, source.rankings.alexa.rank.TJ, source.rankings.alexa.rank.TZ, source.rankings.alexa.rank.TH, source.rankings.alexa.rank.TL, source.rankings.alexa.rank.TG, source.rankings.alexa.rank.TK, source.rankings.alexa.rank.TO, source.rankings.alexa.rank.TT, source.rankings.alexa.rank.TN, source.rankings.alexa.rank.TR, source.rankings.alexa.rank.TM, source.rankings.alexa.rank.TC, source.rankings.alexa.rank.TV, source.rankings.alexa.rank.UG, source.rankings.alexa.rank.UA, source.rankings.alexa.rank.AE, source.rankings.alexa.rank.GB, source.rankings.alexa.rank.US, source.rankings.alexa.rank.UM, source.rankings.alexa.rank.UY, source.rankings.alexa.rank.UZ, source.rankings.alexa.rank.VU, source.rankings.alexa.rank.VE, source.rankings.alexa.rank.VN, source.rankings.alexa.rank.VG, source.rankings.alexa.rank.VI, source.rankings.alexa.rank.WF, source.rankings.alexa.rank.EH, source.rankings.alexa.rank.YE, source.rankings.alexa.rank.ZM, source.rankings.alexa.rank.ZW'
      end
      if opts[:'sort_direction'] && !['asc', 'desc'].include?(opts[:'sort_direction'])
        fail ArgumentError, 'invalid value for "sort_direction", must be one of asc, desc'
      end
      if !opts[:'per_page'].nil? && opts[:'per_page'] > 100
        fail ArgumentError, 'invalid value for "opts[:"per_page"]" when calling DefaultApi.list_stories, must be smaller than or equal to 100.'
      end

      if !opts[:'per_page'].nil? && opts[:'per_page'] < 1
        fail ArgumentError, 'invalid value for "opts[:"per_page"]" when calling DefaultApi.list_stories, must be greater than or equal to 1.'
      end

      # resource path
      local_var_path = "/stories".sub('{format}','json')

      # query parameters
      query_params = {}
      query_params[:'id[]'] = @api_client.build_collection_param(opts[:'id'], :multi) if !opts[:'id'].nil?
      query_params[:'!id[]'] = @api_client.build_collection_param(opts[:'not_id'], :multi) if !opts[:'not_id'].nil?
      query_params[:'title'] = opts[:'title'] if !opts[:'title'].nil?
      query_params[:'body'] = opts[:'body'] if !opts[:'body'].nil?
      query_params[:'text'] = opts[:'text'] if !opts[:'text'].nil?
      query_params[:'language[]'] = @api_client.build_collection_param(opts[:'language'], :multi) if !opts[:'language'].nil?
      query_params[:'!language[]'] = @api_client.build_collection_param(opts[:'not_language'], :multi) if !opts[:'not_language'].nil?
      query_params[:'published_at.start'] = opts[:'published_at_start'] if !opts[:'published_at_start'].nil?
      query_params[:'published_at.end'] = opts[:'published_at_end'] if !opts[:'published_at_end'].nil?
      query_params[:'categories.taxonomy'] = opts[:'categories_taxonomy'] if !opts[:'categories_taxonomy'].nil?
      query_params[:'categories.confident'] = opts[:'categories_confident'] if !opts[:'categories_confident'].nil?
      query_params[:'categories.id[]'] = @api_client.build_collection_param(opts[:'categories_id'], :multi) if !opts[:'categories_id'].nil?
      query_params[:'!categories.id[]'] = @api_client.build_collection_param(opts[:'not_categories_id'], :multi) if !opts[:'not_categories_id'].nil?
      query_params[:'categories.level[]'] = @api_client.build_collection_param(opts[:'categories_level'], :multi) if !opts[:'categories_level'].nil?
      query_params[:'!categories.level[]'] = @api_client.build_collection_param(opts[:'not_categories_level'], :multi) if !opts[:'not_categories_level'].nil?
      query_params[:'entities.title.text[]'] = @api_client.build_collection_param(opts[:'entities_title_text'], :multi) if !opts[:'entities_title_text'].nil?
      query_params[:'!entities.title.text[]'] = @api_client.build_collection_param(opts[:'not_entities_title_text'], :multi) if !opts[:'not_entities_title_text'].nil?
      query_params[:'entities.title.type[]'] = @api_client.build_collection_param(opts[:'entities_title_type'], :multi) if !opts[:'entities_title_type'].nil?
      query_params[:'!entities.title.type[]'] = @api_client.build_collection_param(opts[:'not_entities_title_type'], :multi) if !opts[:'not_entities_title_type'].nil?
      query_params[:'entities.title.links.dbpedia[]'] = @api_client.build_collection_param(opts[:'entities_title_links_dbpedia'], :multi) if !opts[:'entities_title_links_dbpedia'].nil?
      query_params[:'!entities.title.links.dbpedia[]'] = @api_client.build_collection_param(opts[:'not_entities_title_links_dbpedia'], :multi) if !opts[:'not_entities_title_links_dbpedia'].nil?
      query_params[:'entities.body.text[]'] = @api_client.build_collection_param(opts[:'entities_body_text'], :multi) if !opts[:'entities_body_text'].nil?
      query_params[:'!entities.body.text[]'] = @api_client.build_collection_param(opts[:'not_entities_body_text'], :multi) if !opts[:'not_entities_body_text'].nil?
      query_params[:'entities.body.type[]'] = @api_client.build_collection_param(opts[:'entities_body_type'], :multi) if !opts[:'entities_body_type'].nil?
      query_params[:'!entities.body.type[]'] = @api_client.build_collection_param(opts[:'not_entities_body_type'], :multi) if !opts[:'not_entities_body_type'].nil?
      query_params[:'entities.body.links.dbpedia[]'] = @api_client.build_collection_param(opts[:'entities_body_links_dbpedia'], :multi) if !opts[:'entities_body_links_dbpedia'].nil?
      query_params[:'!entities.body.links.dbpedia[]'] = @api_client.build_collection_param(opts[:'not_entities_body_links_dbpedia'], :multi) if !opts[:'not_entities_body_links_dbpedia'].nil?
      query_params[:'sentiment.title.polarity'] = opts[:'sentiment_title_polarity'] if !opts[:'sentiment_title_polarity'].nil?
      query_params[:'!sentiment.title.polarity'] = opts[:'not_sentiment_title_polarity'] if !opts[:'not_sentiment_title_polarity'].nil?
      query_params[:'sentiment.body.polarity'] = opts[:'sentiment_body_polarity'] if !opts[:'sentiment_body_polarity'].nil?
      query_params[:'!sentiment.body.polarity'] = opts[:'not_sentiment_body_polarity'] if !opts[:'not_sentiment_body_polarity'].nil?
      query_params[:'media.images.count.min'] = opts[:'media_images_count_min'] if !opts[:'media_images_count_min'].nil?
      query_params[:'media.images.count.max'] = opts[:'media_images_count_max'] if !opts[:'media_images_count_max'].nil?
      query_params[:'media.images.width.min'] = opts[:'media_images_width_min'] if !opts[:'media_images_width_min'].nil?
      query_params[:'media.images.width.max'] = opts[:'media_images_width_max'] if !opts[:'media_images_width_max'].nil?
      query_params[:'media.images.height.min'] = opts[:'media_images_height_min'] if !opts[:'media_images_height_min'].nil?
      query_params[:'media.images.height.max'] = opts[:'media_images_height_max'] if !opts[:'media_images_height_max'].nil?
      query_params[:'media.images.content_length.min'] = opts[:'media_images_content_length_min'] if !opts[:'media_images_content_length_min'].nil?
      query_params[:'media.images.content_length.max'] = opts[:'media_images_content_length_max'] if !opts[:'media_images_content_length_max'].nil?
      query_params[:'media.images.format[]'] = @api_client.build_collection_param(opts[:'media_images_format'], :multi) if !opts[:'media_images_format'].nil?
      query_params[:'!media.images.format[]'] = @api_client.build_collection_param(opts[:'not_media_images_format'], :multi) if !opts[:'not_media_images_format'].nil?
      query_params[:'media.videos.count.min'] = opts[:'media_videos_count_min'] if !opts[:'media_videos_count_min'].nil?
      query_params[:'media.videos.count.max'] = opts[:'media_videos_count_max'] if !opts[:'media_videos_count_max'].nil?
      query_params[:'author.id[]'] = @api_client.build_collection_param(opts[:'author_id'], :multi) if !opts[:'author_id'].nil?
      query_params[:'!author.id[]'] = @api_client.build_collection_param(opts[:'not_author_id'], :multi) if !opts[:'not_author_id'].nil?
      query_params[:'author.name'] = opts[:'author_name'] if !opts[:'author_name'].nil?
      query_params[:'!author.name'] = opts[:'not_author_name'] if !opts[:'not_author_name'].nil?
      query_params[:'source.id[]'] = @api_client.build_collection_param(opts[:'source_id'], :multi) if !opts[:'source_id'].nil?
      query_params[:'!source.id[]'] = @api_client.build_collection_param(opts[:'not_source_id'], :multi) if !opts[:'not_source_id'].nil?
      query_params[:'source.name[]'] = @api_client.build_collection_param(opts[:'source_name'], :multi) if !opts[:'source_name'].nil?
      query_params[:'!source.name[]'] = @api_client.build_collection_param(opts[:'not_source_name'], :multi) if !opts[:'not_source_name'].nil?
      query_params[:'source.domain[]'] = @api_client.build_collection_param(opts[:'source_domain'], :multi) if !opts[:'source_domain'].nil?
      query_params[:'!source.domain[]'] = @api_client.build_collection_param(opts[:'not_source_domain'], :multi) if !opts[:'not_source_domain'].nil?
      query_params[:'source.locations.country[]'] = @api_client.build_collection_param(opts[:'source_locations_country'], :multi) if !opts[:'source_locations_country'].nil?
      query_params[:'!source.locations.country[]'] = @api_client.build_collection_param(opts[:'not_source_locations_country'], :multi) if !opts[:'not_source_locations_country'].nil?
      query_params[:'source.locations.state[]'] = @api_client.build_collection_param(opts[:'source_locations_state'], :multi) if !opts[:'source_locations_state'].nil?
      query_params[:'!source.locations.state[]'] = @api_client.build_collection_param(opts[:'not_source_locations_state'], :multi) if !opts[:'not_source_locations_state'].nil?
      query_params[:'source.locations.city[]'] = @api_client.build_collection_param(opts[:'source_locations_city'], :multi) if !opts[:'source_locations_city'].nil?
      query_params[:'!source.locations.city[]'] = @api_client.build_collection_param(opts[:'not_source_locations_city'], :multi) if !opts[:'not_source_locations_city'].nil?
      query_params[:'source.scopes.country[]'] = @api_client.build_collection_param(opts[:'source_scopes_country'], :multi) if !opts[:'source_scopes_country'].nil?
      query_params[:'!source.scopes.country[]'] = @api_client.build_collection_param(opts[:'not_source_scopes_country'], :multi) if !opts[:'not_source_scopes_country'].nil?
      query_params[:'source.scopes.state[]'] = @api_client.build_collection_param(opts[:'source_scopes_state'], :multi) if !opts[:'source_scopes_state'].nil?
      query_params[:'!source.scopes.state[]'] = @api_client.build_collection_param(opts[:'not_source_scopes_state'], :multi) if !opts[:'not_source_scopes_state'].nil?
      query_params[:'source.scopes.city[]'] = @api_client.build_collection_param(opts[:'source_scopes_city'], :multi) if !opts[:'source_scopes_city'].nil?
      query_params[:'!source.scopes.city[]'] = @api_client.build_collection_param(opts[:'not_source_scopes_city'], :multi) if !opts[:'not_source_scopes_city'].nil?
      query_params[:'source.scopes.level[]'] = @api_client.build_collection_param(opts[:'source_scopes_level'], :multi) if !opts[:'source_scopes_level'].nil?
      query_params[:'!source.scopes.level[]'] = @api_client.build_collection_param(opts[:'not_source_scopes_level'], :multi) if !opts[:'not_source_scopes_level'].nil?
      query_params[:'source.links_in_count.min'] = opts[:'source_links_in_count_min'] if !opts[:'source_links_in_count_min'].nil?
      query_params[:'source.links_in_count.max'] = opts[:'source_links_in_count_max'] if !opts[:'source_links_in_count_max'].nil?
      query_params[:'source.rankings.alexa.rank.min'] = opts[:'source_rankings_alexa_rank_min'] if !opts[:'source_rankings_alexa_rank_min'].nil?
      query_params[:'source.rankings.alexa.rank.max'] = opts[:'source_rankings_alexa_rank_max'] if !opts[:'source_rankings_alexa_rank_max'].nil?
      query_params[:'source.rankings.alexa.country[]'] = @api_client.build_collection_param(opts[:'source_rankings_alexa_country'], :multi) if !opts[:'source_rankings_alexa_country'].nil?
      query_params[:'social_shares_count.facebook.min'] = opts[:'social_shares_count_facebook_min'] if !opts[:'social_shares_count_facebook_min'].nil?
      query_params[:'social_shares_count.facebook.max'] = opts[:'social_shares_count_facebook_max'] if !opts[:'social_shares_count_facebook_max'].nil?
      query_params[:'social_shares_count.google_plus.min'] = opts[:'social_shares_count_google_plus_min'] if !opts[:'social_shares_count_google_plus_min'].nil?
      query_params[:'social_shares_count.google_plus.max'] = opts[:'social_shares_count_google_plus_max'] if !opts[:'social_shares_count_google_plus_max'].nil?
      query_params[:'social_shares_count.linkedin.min'] = opts[:'social_shares_count_linkedin_min'] if !opts[:'social_shares_count_linkedin_min'].nil?
      query_params[:'social_shares_count.linkedin.max'] = opts[:'social_shares_count_linkedin_max'] if !opts[:'social_shares_count_linkedin_max'].nil?
      query_params[:'social_shares_count.reddit.min'] = opts[:'social_shares_count_reddit_min'] if !opts[:'social_shares_count_reddit_min'].nil?
      query_params[:'social_shares_count.reddit.max'] = opts[:'social_shares_count_reddit_max'] if !opts[:'social_shares_count_reddit_max'].nil?
      query_params[:'cluster'] = opts[:'cluster'] if !opts[:'cluster'].nil?
      query_params[:'cluster.algorithm'] = opts[:'cluster_algorithm'] if !opts[:'cluster_algorithm'].nil?
      query_params[:'return[]'] = @api_client.build_collection_param(opts[:'_return'], :multi) if !opts[:'_return'].nil?
      query_params[:'sort_by'] = opts[:'sort_by'] if !opts[:'sort_by'].nil?
      query_params[:'sort_direction'] = opts[:'sort_direction'] if !opts[:'sort_direction'].nil?
      query_params[:'cursor'] = opts[:'cursor'] if !opts[:'cursor'].nil?
      query_params[:'per_page'] = opts[:'per_page'] if !opts[:'per_page'].nil?

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json', 'text/xml'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/x-www-form-urlencoded'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = ['app_key', 'app_id']
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'Stories')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: DefaultApi#list_stories\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # List time series
    # This endpoint is used for getting time series by stories.
    # @param [Hash] opts the optional parameters
    # @option opts [Array<Integer>] :id This parameter is used for finding stories by story id.
    # @option opts [Array<Integer>] :not_id This parameter is used for excluding stories by story id.
    # @option opts [String] :title This parameter is used for finding stories whose title contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
    # @option opts [String] :body This parameter is used for finding stories whose body contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
    # @option opts [String] :text This parameter is used for finding stories whose title or body contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
    # @option opts [Array<String>] :language This parameter is used for finding stories whose language is the specified value. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes.
    # @option opts [Array<String>] :not_language This parameter is used for excluding stories whose language is the specified value. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes.
    # @option opts [String] :categories_taxonomy This parameter is used for defining the type of the taxonomy for the rest of the categories queries. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).
    # @option opts [BOOLEAN] :categories_confident This parameter is used for finding stories whose categories are confident. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories). (default to true)
    # @option opts [Array<String>] :categories_id This parameter is used for finding stories by categories id. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).
    # @option opts [Array<String>] :not_categories_id This parameter is used for excluding stories by categories id. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).
    # @option opts [Array<Integer>] :categories_level This parameter is used for finding stories by categories level. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).
    # @option opts [Array<Integer>] :not_categories_level This parameter is used for excluding stories by categories level. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).
    # @option opts [Array<String>] :entities_title_text This parameter is used to find stories based on the specified entities &#x60;text&#x60; in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :not_entities_title_text This parameter is used to exclude stories based on the specified entities &#x60;text&#x60; in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :entities_title_type This parameter is used to find stories based on the specified entities &#x60;type&#x60; in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :not_entities_title_type This parameter is used to exclude stories based on the specified entities &#x60;type&#x60; in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :entities_title_links_dbpedia This parameter is used to find stories based on the specified entities dbpedia URL in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :not_entities_title_links_dbpedia This parameter is used to exclude stories based on the specified entities dbpedia URL in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :entities_body_text This parameter is used to find stories based on the specified entities &#x60;text&#x60; in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :not_entities_body_text This parameter is used to exclude stories based on the specified entities &#x60;text&#x60; in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :entities_body_type This parameter is used to find stories based on the specified entities &#x60;type&#x60; in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :not_entities_body_type This parameter is used to exclude stories based on the specified entities &#x60;type&#x60; in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :entities_body_links_dbpedia This parameter is used to find stories based on the specified entities dbpedia URL in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :not_entities_body_links_dbpedia This parameter is used to exclude stories based on the specified entities dbpedia URL in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [String] :sentiment_title_polarity This parameter is used for finding stories whose title sentiment is the specified value.
    # @option opts [String] :not_sentiment_title_polarity This parameter is used for excluding stories whose title sentiment is the specified value.
    # @option opts [String] :sentiment_body_polarity This parameter is used for finding stories whose body sentiment is the specified value.
    # @option opts [String] :not_sentiment_body_polarity This parameter is used for excluding stories whose body sentiment is the specified value.
    # @option opts [Integer] :media_images_count_min This parameter is used for finding stories whose number of images is greater than or equal to the specified value.
    # @option opts [Integer] :media_images_count_max This parameter is used for finding stories whose number of images is less than or equal to the specified value.
    # @option opts [Integer] :media_images_width_min This parameter is used for finding stories whose width of images are greater than or equal to the specified value.
    # @option opts [Integer] :media_images_width_max This parameter is used for finding stories whose width of images are less than or equal to the specified value.
    # @option opts [Integer] :media_images_height_min This parameter is used for finding stories whose height of images are greater than or equal to the specified value.
    # @option opts [Integer] :media_images_height_max This parameter is used for finding stories whose height of images are less than or equal to the specified value.
    # @option opts [Integer] :media_images_content_length_min This parameter is used for finding stories whose images content length are greater than or equal to the specified value.
    # @option opts [Integer] :media_images_content_length_max This parameter is used for finding stories whose images content length are less than or equal to the specified value.
    # @option opts [Array<String>] :media_images_format This parameter is used for finding stories whose images format are the specified value.
    # @option opts [Array<String>] :not_media_images_format This parameter is used for excluding stories whose images format are the specified value.
    # @option opts [Integer] :media_videos_count_min This parameter is used for finding stories whose number of videos is greater than or equal to the specified value.
    # @option opts [Integer] :media_videos_count_max This parameter is used for finding stories whose number of videos is less than or equal to the specified value.
    # @option opts [Array<Integer>] :author_id This parameter is used for finding stories whose author id is the specified value.
    # @option opts [Array<Integer>] :not_author_id This parameter is used for excluding stories whose author id is the specified value.
    # @option opts [String] :author_name This parameter is used for finding stories whose author full name contains the specified value.
    # @option opts [String] :not_author_name This parameter is used for excluding stories whose author full name contains the specified value.
    # @option opts [Array<Integer>] :source_id This parameter is used for finding stories whose source id is the specified value.
    # @option opts [Array<Integer>] :not_source_id This parameter is used for excluding stories whose source id is the specified value.
    # @option opts [Array<String>] :source_name This parameter is used for finding stories whose source name contains the specified value.
    # @option opts [Array<String>] :not_source_name This parameter is used for excluding stories whose source name contains the specified value.
    # @option opts [Array<String>] :source_domain This parameter is used for finding stories whose source domain is the specified value.
    # @option opts [Array<String>] :not_source_domain This parameter is used for excluding stories whose source domain is the specified value.
    # @option opts [Array<String>] :source_locations_country This parameter is used for finding stories whose source country is the specified value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :not_source_locations_country This parameter is used for excluding stories whose source country is the specified value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_locations_state This parameter is used for finding stories whose source state/province is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :not_source_locations_state This parameter is used for excluding stories whose source state/province is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_locations_city This parameter is used for finding stories whose source city is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :not_source_locations_city This parameter is used for excluding stories whose source city is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_scopes_country This parameter is used for finding stories whose source scopes is the specified country value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :not_source_scopes_country This parameter is used for excluding stories whose source scopes is the specified country value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_scopes_state This parameter is used for finding stories whose source scopes is the specified state/province value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :not_source_scopes_state This parameter is used for excluding stories whose source scopes is the specified state/province value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_scopes_city This parameter is used for finding stories whose source scopes is the specified city value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :not_source_scopes_city This parameter is used for excluding stories whose source scopes is the specified city value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_scopes_level This parameter is used for finding stories whose source scopes is the specified level value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :not_source_scopes_level This parameter is used for excluding stories whose source scopes is the specified level value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Integer] :source_links_in_count_min This parameter is used for finding stories from sources whose Links in count is greater than or equal to the specified value. You can read more about working with Links in count [here](https://newsapi.aylien.com/docs/working-with-links-in-count).
    # @option opts [Integer] :source_links_in_count_max This parameter is used for finding stories from sources whose Links in count is less than or equal to the specified value. You can read more about working with Links in count [here](https://newsapi.aylien.com/docs/working-with-links-in-count).
    # @option opts [Integer] :source_rankings_alexa_rank_min This parameter is used for finding stories from sources whose Alexa rank is greater than or equal to the specified value. You can read more about working with Alexa ranks [here](https://newsapi.aylien.com/docs/working-with-alexa-ranks).
    # @option opts [Integer] :source_rankings_alexa_rank_max This parameter is used for finding stories from sources whose Alexa rank is less than or equal to the specified value. You can read more about working with Alexa ranks [here](https://newsapi.aylien.com/docs/working-with-alexa-ranks).
    # @option opts [Array<String>] :source_rankings_alexa_country This parameter is used for finding stories from sources whose Alexa rank is in the specified country value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. You can read more about working with Alexa ranks [here](https://newsapi.aylien.com/docs/working-with-alexa-ranks).
    # @option opts [Integer] :social_shares_count_facebook_min This parameter is used for finding stories whose Facebook social shares count is greater than or equal to the specified value.
    # @option opts [Integer] :social_shares_count_facebook_max This parameter is used for finding stories whose Facebook social shares count is less than or equal to the specified value.
    # @option opts [Integer] :social_shares_count_google_plus_min This parameter is used for finding stories whose Google+ social shares count is greater than or equal to the specified value.
    # @option opts [Integer] :social_shares_count_google_plus_max This parameter is used for finding stories whose Google+ social shares count is less than or equal to the specified value.
    # @option opts [Integer] :social_shares_count_linkedin_min This parameter is used for finding stories whose LinkedIn social shares count is greater than or equal to the specified value.
    # @option opts [Integer] :social_shares_count_linkedin_max This parameter is used for finding stories whose LinkedIn social shares count is less than or equal to the specified value.
    # @option opts [Integer] :social_shares_count_reddit_min This parameter is used for finding stories whose Reddit social shares count is greater than or equal to the specified value.
    # @option opts [Integer] :social_shares_count_reddit_max This parameter is used for finding stories whose Reddit social shares count is less than or equal to the specified value.
    # @option opts [String] :published_at_start This parameter is used for finding stories whose published at time is less than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates). (default to NOW-7DAYS/DAY)
    # @option opts [String] :published_at_end This parameter is used for finding stories whose published at time is greater than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates). (default to NOW/DAY)
    # @option opts [String] :period The size of each date range is expressed as an interval to be added to the lower bound. It supports Date Math Syntax. Valid options are &#x60;+&#x60; following an integer number greater than 0 and one of the Date Math keywords. e.g. &#x60;+1DAY&#x60;, &#x60;+2MINUTES&#x60; and &#x60;+1MONTH&#x60;. Here are [Supported keywords](https://newsapi.aylien.com/docs/working-with-dates#date-math). (default to +1DAY)
    # @return [TimeSeriesList]
    def list_time_series(opts = {})
      data, _status_code, _headers = list_time_series_with_http_info(opts)
      return data
    end

    # List time series
    # This endpoint is used for getting time series by stories.
    # @param [Hash] opts the optional parameters
    # @option opts [Array<Integer>] :id This parameter is used for finding stories by story id.
    # @option opts [Array<Integer>] :not_id This parameter is used for excluding stories by story id.
    # @option opts [String] :title This parameter is used for finding stories whose title contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
    # @option opts [String] :body This parameter is used for finding stories whose body contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
    # @option opts [String] :text This parameter is used for finding stories whose title or body contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
    # @option opts [Array<String>] :language This parameter is used for finding stories whose language is the specified value. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes.
    # @option opts [Array<String>] :not_language This parameter is used for excluding stories whose language is the specified value. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes.
    # @option opts [String] :categories_taxonomy This parameter is used for defining the type of the taxonomy for the rest of the categories queries. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).
    # @option opts [BOOLEAN] :categories_confident This parameter is used for finding stories whose categories are confident. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).
    # @option opts [Array<String>] :categories_id This parameter is used for finding stories by categories id. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).
    # @option opts [Array<String>] :not_categories_id This parameter is used for excluding stories by categories id. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).
    # @option opts [Array<Integer>] :categories_level This parameter is used for finding stories by categories level. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).
    # @option opts [Array<Integer>] :not_categories_level This parameter is used for excluding stories by categories level. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).
    # @option opts [Array<String>] :entities_title_text This parameter is used to find stories based on the specified entities &#x60;text&#x60; in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :not_entities_title_text This parameter is used to exclude stories based on the specified entities &#x60;text&#x60; in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :entities_title_type This parameter is used to find stories based on the specified entities &#x60;type&#x60; in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :not_entities_title_type This parameter is used to exclude stories based on the specified entities &#x60;type&#x60; in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :entities_title_links_dbpedia This parameter is used to find stories based on the specified entities dbpedia URL in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :not_entities_title_links_dbpedia This parameter is used to exclude stories based on the specified entities dbpedia URL in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :entities_body_text This parameter is used to find stories based on the specified entities &#x60;text&#x60; in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :not_entities_body_text This parameter is used to exclude stories based on the specified entities &#x60;text&#x60; in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :entities_body_type This parameter is used to find stories based on the specified entities &#x60;type&#x60; in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :not_entities_body_type This parameter is used to exclude stories based on the specified entities &#x60;type&#x60; in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :entities_body_links_dbpedia This parameter is used to find stories based on the specified entities dbpedia URL in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :not_entities_body_links_dbpedia This parameter is used to exclude stories based on the specified entities dbpedia URL in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [String] :sentiment_title_polarity This parameter is used for finding stories whose title sentiment is the specified value.
    # @option opts [String] :not_sentiment_title_polarity This parameter is used for excluding stories whose title sentiment is the specified value.
    # @option opts [String] :sentiment_body_polarity This parameter is used for finding stories whose body sentiment is the specified value.
    # @option opts [String] :not_sentiment_body_polarity This parameter is used for excluding stories whose body sentiment is the specified value.
    # @option opts [Integer] :media_images_count_min This parameter is used for finding stories whose number of images is greater than or equal to the specified value.
    # @option opts [Integer] :media_images_count_max This parameter is used for finding stories whose number of images is less than or equal to the specified value.
    # @option opts [Integer] :media_images_width_min This parameter is used for finding stories whose width of images are greater than or equal to the specified value.
    # @option opts [Integer] :media_images_width_max This parameter is used for finding stories whose width of images are less than or equal to the specified value.
    # @option opts [Integer] :media_images_height_min This parameter is used for finding stories whose height of images are greater than or equal to the specified value.
    # @option opts [Integer] :media_images_height_max This parameter is used for finding stories whose height of images are less than or equal to the specified value.
    # @option opts [Integer] :media_images_content_length_min This parameter is used for finding stories whose images content length are greater than or equal to the specified value.
    # @option opts [Integer] :media_images_content_length_max This parameter is used for finding stories whose images content length are less than or equal to the specified value.
    # @option opts [Array<String>] :media_images_format This parameter is used for finding stories whose images format are the specified value.
    # @option opts [Array<String>] :not_media_images_format This parameter is used for excluding stories whose images format are the specified value.
    # @option opts [Integer] :media_videos_count_min This parameter is used for finding stories whose number of videos is greater than or equal to the specified value.
    # @option opts [Integer] :media_videos_count_max This parameter is used for finding stories whose number of videos is less than or equal to the specified value.
    # @option opts [Array<Integer>] :author_id This parameter is used for finding stories whose author id is the specified value.
    # @option opts [Array<Integer>] :not_author_id This parameter is used for excluding stories whose author id is the specified value.
    # @option opts [String] :author_name This parameter is used for finding stories whose author full name contains the specified value.
    # @option opts [String] :not_author_name This parameter is used for excluding stories whose author full name contains the specified value.
    # @option opts [Array<Integer>] :source_id This parameter is used for finding stories whose source id is the specified value.
    # @option opts [Array<Integer>] :not_source_id This parameter is used for excluding stories whose source id is the specified value.
    # @option opts [Array<String>] :source_name This parameter is used for finding stories whose source name contains the specified value.
    # @option opts [Array<String>] :not_source_name This parameter is used for excluding stories whose source name contains the specified value.
    # @option opts [Array<String>] :source_domain This parameter is used for finding stories whose source domain is the specified value.
    # @option opts [Array<String>] :not_source_domain This parameter is used for excluding stories whose source domain is the specified value.
    # @option opts [Array<String>] :source_locations_country This parameter is used for finding stories whose source country is the specified value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :not_source_locations_country This parameter is used for excluding stories whose source country is the specified value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_locations_state This parameter is used for finding stories whose source state/province is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :not_source_locations_state This parameter is used for excluding stories whose source state/province is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_locations_city This parameter is used for finding stories whose source city is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :not_source_locations_city This parameter is used for excluding stories whose source city is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_scopes_country This parameter is used for finding stories whose source scopes is the specified country value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :not_source_scopes_country This parameter is used for excluding stories whose source scopes is the specified country value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_scopes_state This parameter is used for finding stories whose source scopes is the specified state/province value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :not_source_scopes_state This parameter is used for excluding stories whose source scopes is the specified state/province value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_scopes_city This parameter is used for finding stories whose source scopes is the specified city value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :not_source_scopes_city This parameter is used for excluding stories whose source scopes is the specified city value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_scopes_level This parameter is used for finding stories whose source scopes is the specified level value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :not_source_scopes_level This parameter is used for excluding stories whose source scopes is the specified level value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Integer] :source_links_in_count_min This parameter is used for finding stories from sources whose Links in count is greater than or equal to the specified value. You can read more about working with Links in count [here](https://newsapi.aylien.com/docs/working-with-links-in-count).
    # @option opts [Integer] :source_links_in_count_max This parameter is used for finding stories from sources whose Links in count is less than or equal to the specified value. You can read more about working with Links in count [here](https://newsapi.aylien.com/docs/working-with-links-in-count).
    # @option opts [Integer] :source_rankings_alexa_rank_min This parameter is used for finding stories from sources whose Alexa rank is greater than or equal to the specified value. You can read more about working with Alexa ranks [here](https://newsapi.aylien.com/docs/working-with-alexa-ranks).
    # @option opts [Integer] :source_rankings_alexa_rank_max This parameter is used for finding stories from sources whose Alexa rank is less than or equal to the specified value. You can read more about working with Alexa ranks [here](https://newsapi.aylien.com/docs/working-with-alexa-ranks).
    # @option opts [Array<String>] :source_rankings_alexa_country This parameter is used for finding stories from sources whose Alexa rank is in the specified country value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. You can read more about working with Alexa ranks [here](https://newsapi.aylien.com/docs/working-with-alexa-ranks).
    # @option opts [Integer] :social_shares_count_facebook_min This parameter is used for finding stories whose Facebook social shares count is greater than or equal to the specified value.
    # @option opts [Integer] :social_shares_count_facebook_max This parameter is used for finding stories whose Facebook social shares count is less than or equal to the specified value.
    # @option opts [Integer] :social_shares_count_google_plus_min This parameter is used for finding stories whose Google+ social shares count is greater than or equal to the specified value.
    # @option opts [Integer] :social_shares_count_google_plus_max This parameter is used for finding stories whose Google+ social shares count is less than or equal to the specified value.
    # @option opts [Integer] :social_shares_count_linkedin_min This parameter is used for finding stories whose LinkedIn social shares count is greater than or equal to the specified value.
    # @option opts [Integer] :social_shares_count_linkedin_max This parameter is used for finding stories whose LinkedIn social shares count is less than or equal to the specified value.
    # @option opts [Integer] :social_shares_count_reddit_min This parameter is used for finding stories whose Reddit social shares count is greater than or equal to the specified value.
    # @option opts [Integer] :social_shares_count_reddit_max This parameter is used for finding stories whose Reddit social shares count is less than or equal to the specified value.
    # @option opts [String] :published_at_start This parameter is used for finding stories whose published at time is less than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates).
    # @option opts [String] :published_at_end This parameter is used for finding stories whose published at time is greater than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates).
    # @option opts [String] :period The size of each date range is expressed as an interval to be added to the lower bound. It supports Date Math Syntax. Valid options are &#x60;+&#x60; following an integer number greater than 0 and one of the Date Math keywords. e.g. &#x60;+1DAY&#x60;, &#x60;+2MINUTES&#x60; and &#x60;+1MONTH&#x60;. Here are [Supported keywords](https://newsapi.aylien.com/docs/working-with-dates#date-math).
    # @return [Array<(TimeSeriesList, Fixnum, Hash)>] TimeSeriesList data, response status code and response headers
    def list_time_series_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: DefaultApi.list_time_series ..."
      end
      if opts[:'language'] && !opts[:'language'].all?{|item| ['en', 'de', 'fr', 'it', 'es', 'pt'].include?(item)}
        fail ArgumentError, 'invalid value for "language", must include one of en, de, fr, it, es, pt'
      end
      if opts[:'not_language'] && !opts[:'not_language'].all?{|item| ['en', 'de', 'fr', 'it', 'es', 'pt'].include?(item)}
        fail ArgumentError, 'invalid value for "not_language", must include one of en, de, fr, it, es, pt'
      end
      if opts[:'categories_taxonomy'] && !['iab-qag', 'iptc-subjectcode'].include?(opts[:'categories_taxonomy'])
        fail ArgumentError, 'invalid value for "categories_taxonomy", must be one of iab-qag, iptc-subjectcode'
      end
      if opts[:'sentiment_title_polarity'] && !['positive', 'neutral', 'negative'].include?(opts[:'sentiment_title_polarity'])
        fail ArgumentError, 'invalid value for "sentiment_title_polarity", must be one of positive, neutral, negative'
      end
      if opts[:'not_sentiment_title_polarity'] && !['positive', 'neutral', 'negative'].include?(opts[:'not_sentiment_title_polarity'])
        fail ArgumentError, 'invalid value for "not_sentiment_title_polarity", must be one of positive, neutral, negative'
      end
      if opts[:'sentiment_body_polarity'] && !['positive', 'neutral', 'negative'].include?(opts[:'sentiment_body_polarity'])
        fail ArgumentError, 'invalid value for "sentiment_body_polarity", must be one of positive, neutral, negative'
      end
      if opts[:'not_sentiment_body_polarity'] && !['positive', 'neutral', 'negative'].include?(opts[:'not_sentiment_body_polarity'])
        fail ArgumentError, 'invalid value for "not_sentiment_body_polarity", must be one of positive, neutral, negative'
      end
      if !opts[:'media_images_count_min'].nil? && opts[:'media_images_count_min'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"media_images_count_min"]" when calling DefaultApi.list_time_series, must be greater than 0.'
      end

      if !opts[:'media_images_count_max'].nil? && opts[:'media_images_count_max'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"media_images_count_max"]" when calling DefaultApi.list_time_series, must be greater than 0.'
      end

      if !opts[:'media_images_width_min'].nil? && opts[:'media_images_width_min'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"media_images_width_min"]" when calling DefaultApi.list_time_series, must be greater than 0.'
      end

      if !opts[:'media_images_width_max'].nil? && opts[:'media_images_width_max'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"media_images_width_max"]" when calling DefaultApi.list_time_series, must be greater than 0.'
      end

      if !opts[:'media_images_height_min'].nil? && opts[:'media_images_height_min'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"media_images_height_min"]" when calling DefaultApi.list_time_series, must be greater than 0.'
      end

      if !opts[:'media_images_height_max'].nil? && opts[:'media_images_height_max'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"media_images_height_max"]" when calling DefaultApi.list_time_series, must be greater than 0.'
      end

      if !opts[:'media_images_content_length_min'].nil? && opts[:'media_images_content_length_min'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"media_images_content_length_min"]" when calling DefaultApi.list_time_series, must be greater than 0.'
      end

      if !opts[:'media_images_content_length_max'].nil? && opts[:'media_images_content_length_max'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"media_images_content_length_max"]" when calling DefaultApi.list_time_series, must be greater than 0.'
      end

      if opts[:'media_images_format'] && !opts[:'media_images_format'].all?{|item| ['BMP', 'GIF', 'JPEG', 'PNG', 'TIFF', 'PSD', 'ICO', 'CUR', 'WEBP', 'SVG'].include?(item)}
        fail ArgumentError, 'invalid value for "media_images_format", must include one of BMP, GIF, JPEG, PNG, TIFF, PSD, ICO, CUR, WEBP, SVG'
      end
      if opts[:'not_media_images_format'] && !opts[:'not_media_images_format'].all?{|item| ['BMP', 'GIF', 'JPEG', 'PNG', 'TIFF', 'PSD', 'ICO', 'CUR', 'WEBP', 'SVG'].include?(item)}
        fail ArgumentError, 'invalid value for "not_media_images_format", must include one of BMP, GIF, JPEG, PNG, TIFF, PSD, ICO, CUR, WEBP, SVG'
      end
      if !opts[:'media_videos_count_min'].nil? && opts[:'media_videos_count_min'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"media_videos_count_min"]" when calling DefaultApi.list_time_series, must be greater than 0.'
      end

      if !opts[:'media_videos_count_max'].nil? && opts[:'media_videos_count_max'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"media_videos_count_max"]" when calling DefaultApi.list_time_series, must be greater than 0.'
      end

      if opts[:'source_scopes_level'] && !opts[:'source_scopes_level'].all?{|item| ['international', 'national', 'local'].include?(item)}
        fail ArgumentError, 'invalid value for "source_scopes_level", must include one of international, national, local'
      end
      if opts[:'not_source_scopes_level'] && !opts[:'not_source_scopes_level'].all?{|item| ['international', 'national', 'local'].include?(item)}
        fail ArgumentError, 'invalid value for "not_source_scopes_level", must include one of international, national, local'
      end
      if !opts[:'source_links_in_count_min'].nil? && opts[:'source_links_in_count_min'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"source_links_in_count_min"]" when calling DefaultApi.list_time_series, must be greater than 0.'
      end

      if !opts[:'source_links_in_count_max'].nil? && opts[:'source_links_in_count_max'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"source_links_in_count_max"]" when calling DefaultApi.list_time_series, must be greater than 0.'
      end

      if !opts[:'source_rankings_alexa_rank_min'].nil? && opts[:'source_rankings_alexa_rank_min'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"source_rankings_alexa_rank_min"]" when calling DefaultApi.list_time_series, must be greater than 0.'
      end

      if !opts[:'source_rankings_alexa_rank_max'].nil? && opts[:'source_rankings_alexa_rank_max'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"source_rankings_alexa_rank_max"]" when calling DefaultApi.list_time_series, must be greater than 0.'
      end

      if !opts[:'social_shares_count_facebook_min'].nil? && opts[:'social_shares_count_facebook_min'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"social_shares_count_facebook_min"]" when calling DefaultApi.list_time_series, must be greater than 0.'
      end

      if !opts[:'social_shares_count_facebook_max'].nil? && opts[:'social_shares_count_facebook_max'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"social_shares_count_facebook_max"]" when calling DefaultApi.list_time_series, must be greater than 0.'
      end

      if !opts[:'social_shares_count_google_plus_min'].nil? && opts[:'social_shares_count_google_plus_min'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"social_shares_count_google_plus_min"]" when calling DefaultApi.list_time_series, must be greater than 0.'
      end

      if !opts[:'social_shares_count_google_plus_max'].nil? && opts[:'social_shares_count_google_plus_max'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"social_shares_count_google_plus_max"]" when calling DefaultApi.list_time_series, must be greater than 0.'
      end

      if !opts[:'social_shares_count_linkedin_min'].nil? && opts[:'social_shares_count_linkedin_min'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"social_shares_count_linkedin_min"]" when calling DefaultApi.list_time_series, must be greater than 0.'
      end

      if !opts[:'social_shares_count_linkedin_max'].nil? && opts[:'social_shares_count_linkedin_max'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"social_shares_count_linkedin_max"]" when calling DefaultApi.list_time_series, must be greater than 0.'
      end

      if !opts[:'social_shares_count_reddit_min'].nil? && opts[:'social_shares_count_reddit_min'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"social_shares_count_reddit_min"]" when calling DefaultApi.list_time_series, must be greater than 0.'
      end

      if !opts[:'social_shares_count_reddit_max'].nil? && opts[:'social_shares_count_reddit_max'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"social_shares_count_reddit_max"]" when calling DefaultApi.list_time_series, must be greater than 0.'
      end

      # resource path
      local_var_path = "/time_series".sub('{format}','json')

      # query parameters
      query_params = {}
      query_params[:'id[]'] = @api_client.build_collection_param(opts[:'id'], :multi) if !opts[:'id'].nil?
      query_params[:'!id[]'] = @api_client.build_collection_param(opts[:'not_id'], :multi) if !opts[:'not_id'].nil?
      query_params[:'title'] = opts[:'title'] if !opts[:'title'].nil?
      query_params[:'body'] = opts[:'body'] if !opts[:'body'].nil?
      query_params[:'text'] = opts[:'text'] if !opts[:'text'].nil?
      query_params[:'language[]'] = @api_client.build_collection_param(opts[:'language'], :multi) if !opts[:'language'].nil?
      query_params[:'!language[]'] = @api_client.build_collection_param(opts[:'not_language'], :multi) if !opts[:'not_language'].nil?
      query_params[:'categories.taxonomy'] = opts[:'categories_taxonomy'] if !opts[:'categories_taxonomy'].nil?
      query_params[:'categories.confident'] = opts[:'categories_confident'] if !opts[:'categories_confident'].nil?
      query_params[:'categories.id[]'] = @api_client.build_collection_param(opts[:'categories_id'], :multi) if !opts[:'categories_id'].nil?
      query_params[:'!categories.id[]'] = @api_client.build_collection_param(opts[:'not_categories_id'], :multi) if !opts[:'not_categories_id'].nil?
      query_params[:'categories.level[]'] = @api_client.build_collection_param(opts[:'categories_level'], :multi) if !opts[:'categories_level'].nil?
      query_params[:'!categories.level[]'] = @api_client.build_collection_param(opts[:'not_categories_level'], :multi) if !opts[:'not_categories_level'].nil?
      query_params[:'entities.title.text[]'] = @api_client.build_collection_param(opts[:'entities_title_text'], :multi) if !opts[:'entities_title_text'].nil?
      query_params[:'!entities.title.text[]'] = @api_client.build_collection_param(opts[:'not_entities_title_text'], :multi) if !opts[:'not_entities_title_text'].nil?
      query_params[:'entities.title.type[]'] = @api_client.build_collection_param(opts[:'entities_title_type'], :multi) if !opts[:'entities_title_type'].nil?
      query_params[:'!entities.title.type[]'] = @api_client.build_collection_param(opts[:'not_entities_title_type'], :multi) if !opts[:'not_entities_title_type'].nil?
      query_params[:'entities.title.links.dbpedia[]'] = @api_client.build_collection_param(opts[:'entities_title_links_dbpedia'], :multi) if !opts[:'entities_title_links_dbpedia'].nil?
      query_params[:'!entities.title.links.dbpedia[]'] = @api_client.build_collection_param(opts[:'not_entities_title_links_dbpedia'], :multi) if !opts[:'not_entities_title_links_dbpedia'].nil?
      query_params[:'entities.body.text[]'] = @api_client.build_collection_param(opts[:'entities_body_text'], :multi) if !opts[:'entities_body_text'].nil?
      query_params[:'!entities.body.text[]'] = @api_client.build_collection_param(opts[:'not_entities_body_text'], :multi) if !opts[:'not_entities_body_text'].nil?
      query_params[:'entities.body.type[]'] = @api_client.build_collection_param(opts[:'entities_body_type'], :multi) if !opts[:'entities_body_type'].nil?
      query_params[:'!entities.body.type[]'] = @api_client.build_collection_param(opts[:'not_entities_body_type'], :multi) if !opts[:'not_entities_body_type'].nil?
      query_params[:'entities.body.links.dbpedia[]'] = @api_client.build_collection_param(opts[:'entities_body_links_dbpedia'], :multi) if !opts[:'entities_body_links_dbpedia'].nil?
      query_params[:'!entities.body.links.dbpedia[]'] = @api_client.build_collection_param(opts[:'not_entities_body_links_dbpedia'], :multi) if !opts[:'not_entities_body_links_dbpedia'].nil?
      query_params[:'sentiment.title.polarity'] = opts[:'sentiment_title_polarity'] if !opts[:'sentiment_title_polarity'].nil?
      query_params[:'!sentiment.title.polarity'] = opts[:'not_sentiment_title_polarity'] if !opts[:'not_sentiment_title_polarity'].nil?
      query_params[:'sentiment.body.polarity'] = opts[:'sentiment_body_polarity'] if !opts[:'sentiment_body_polarity'].nil?
      query_params[:'!sentiment.body.polarity'] = opts[:'not_sentiment_body_polarity'] if !opts[:'not_sentiment_body_polarity'].nil?
      query_params[:'media.images.count.min'] = opts[:'media_images_count_min'] if !opts[:'media_images_count_min'].nil?
      query_params[:'media.images.count.max'] = opts[:'media_images_count_max'] if !opts[:'media_images_count_max'].nil?
      query_params[:'media.images.width.min'] = opts[:'media_images_width_min'] if !opts[:'media_images_width_min'].nil?
      query_params[:'media.images.width.max'] = opts[:'media_images_width_max'] if !opts[:'media_images_width_max'].nil?
      query_params[:'media.images.height.min'] = opts[:'media_images_height_min'] if !opts[:'media_images_height_min'].nil?
      query_params[:'media.images.height.max'] = opts[:'media_images_height_max'] if !opts[:'media_images_height_max'].nil?
      query_params[:'media.images.content_length.min'] = opts[:'media_images_content_length_min'] if !opts[:'media_images_content_length_min'].nil?
      query_params[:'media.images.content_length.max'] = opts[:'media_images_content_length_max'] if !opts[:'media_images_content_length_max'].nil?
      query_params[:'media.images.format[]'] = @api_client.build_collection_param(opts[:'media_images_format'], :multi) if !opts[:'media_images_format'].nil?
      query_params[:'!media.images.format[]'] = @api_client.build_collection_param(opts[:'not_media_images_format'], :multi) if !opts[:'not_media_images_format'].nil?
      query_params[:'media.videos.count.min'] = opts[:'media_videos_count_min'] if !opts[:'media_videos_count_min'].nil?
      query_params[:'media.videos.count.max'] = opts[:'media_videos_count_max'] if !opts[:'media_videos_count_max'].nil?
      query_params[:'author.id[]'] = @api_client.build_collection_param(opts[:'author_id'], :multi) if !opts[:'author_id'].nil?
      query_params[:'!author.id[]'] = @api_client.build_collection_param(opts[:'not_author_id'], :multi) if !opts[:'not_author_id'].nil?
      query_params[:'author.name'] = opts[:'author_name'] if !opts[:'author_name'].nil?
      query_params[:'!author.name'] = opts[:'not_author_name'] if !opts[:'not_author_name'].nil?
      query_params[:'source.id[]'] = @api_client.build_collection_param(opts[:'source_id'], :multi) if !opts[:'source_id'].nil?
      query_params[:'!source.id[]'] = @api_client.build_collection_param(opts[:'not_source_id'], :multi) if !opts[:'not_source_id'].nil?
      query_params[:'source.name[]'] = @api_client.build_collection_param(opts[:'source_name'], :multi) if !opts[:'source_name'].nil?
      query_params[:'!source.name[]'] = @api_client.build_collection_param(opts[:'not_source_name'], :multi) if !opts[:'not_source_name'].nil?
      query_params[:'source.domain[]'] = @api_client.build_collection_param(opts[:'source_domain'], :multi) if !opts[:'source_domain'].nil?
      query_params[:'!source.domain[]'] = @api_client.build_collection_param(opts[:'not_source_domain'], :multi) if !opts[:'not_source_domain'].nil?
      query_params[:'source.locations.country[]'] = @api_client.build_collection_param(opts[:'source_locations_country'], :multi) if !opts[:'source_locations_country'].nil?
      query_params[:'!source.locations.country[]'] = @api_client.build_collection_param(opts[:'not_source_locations_country'], :multi) if !opts[:'not_source_locations_country'].nil?
      query_params[:'source.locations.state[]'] = @api_client.build_collection_param(opts[:'source_locations_state'], :multi) if !opts[:'source_locations_state'].nil?
      query_params[:'!source.locations.state[]'] = @api_client.build_collection_param(opts[:'not_source_locations_state'], :multi) if !opts[:'not_source_locations_state'].nil?
      query_params[:'source.locations.city[]'] = @api_client.build_collection_param(opts[:'source_locations_city'], :multi) if !opts[:'source_locations_city'].nil?
      query_params[:'!source.locations.city[]'] = @api_client.build_collection_param(opts[:'not_source_locations_city'], :multi) if !opts[:'not_source_locations_city'].nil?
      query_params[:'source.scopes.country[]'] = @api_client.build_collection_param(opts[:'source_scopes_country'], :multi) if !opts[:'source_scopes_country'].nil?
      query_params[:'!source.scopes.country[]'] = @api_client.build_collection_param(opts[:'not_source_scopes_country'], :multi) if !opts[:'not_source_scopes_country'].nil?
      query_params[:'source.scopes.state[]'] = @api_client.build_collection_param(opts[:'source_scopes_state'], :multi) if !opts[:'source_scopes_state'].nil?
      query_params[:'!source.scopes.state[]'] = @api_client.build_collection_param(opts[:'not_source_scopes_state'], :multi) if !opts[:'not_source_scopes_state'].nil?
      query_params[:'source.scopes.city[]'] = @api_client.build_collection_param(opts[:'source_scopes_city'], :multi) if !opts[:'source_scopes_city'].nil?
      query_params[:'!source.scopes.city[]'] = @api_client.build_collection_param(opts[:'not_source_scopes_city'], :multi) if !opts[:'not_source_scopes_city'].nil?
      query_params[:'source.scopes.level[]'] = @api_client.build_collection_param(opts[:'source_scopes_level'], :multi) if !opts[:'source_scopes_level'].nil?
      query_params[:'!source.scopes.level[]'] = @api_client.build_collection_param(opts[:'not_source_scopes_level'], :multi) if !opts[:'not_source_scopes_level'].nil?
      query_params[:'source.links_in_count.min'] = opts[:'source_links_in_count_min'] if !opts[:'source_links_in_count_min'].nil?
      query_params[:'source.links_in_count.max'] = opts[:'source_links_in_count_max'] if !opts[:'source_links_in_count_max'].nil?
      query_params[:'source.rankings.alexa.rank.min'] = opts[:'source_rankings_alexa_rank_min'] if !opts[:'source_rankings_alexa_rank_min'].nil?
      query_params[:'source.rankings.alexa.rank.max'] = opts[:'source_rankings_alexa_rank_max'] if !opts[:'source_rankings_alexa_rank_max'].nil?
      query_params[:'source.rankings.alexa.country[]'] = @api_client.build_collection_param(opts[:'source_rankings_alexa_country'], :multi) if !opts[:'source_rankings_alexa_country'].nil?
      query_params[:'social_shares_count.facebook.min'] = opts[:'social_shares_count_facebook_min'] if !opts[:'social_shares_count_facebook_min'].nil?
      query_params[:'social_shares_count.facebook.max'] = opts[:'social_shares_count_facebook_max'] if !opts[:'social_shares_count_facebook_max'].nil?
      query_params[:'social_shares_count.google_plus.min'] = opts[:'social_shares_count_google_plus_min'] if !opts[:'social_shares_count_google_plus_min'].nil?
      query_params[:'social_shares_count.google_plus.max'] = opts[:'social_shares_count_google_plus_max'] if !opts[:'social_shares_count_google_plus_max'].nil?
      query_params[:'social_shares_count.linkedin.min'] = opts[:'social_shares_count_linkedin_min'] if !opts[:'social_shares_count_linkedin_min'].nil?
      query_params[:'social_shares_count.linkedin.max'] = opts[:'social_shares_count_linkedin_max'] if !opts[:'social_shares_count_linkedin_max'].nil?
      query_params[:'social_shares_count.reddit.min'] = opts[:'social_shares_count_reddit_min'] if !opts[:'social_shares_count_reddit_min'].nil?
      query_params[:'social_shares_count.reddit.max'] = opts[:'social_shares_count_reddit_max'] if !opts[:'social_shares_count_reddit_max'].nil?
      query_params[:'published_at.start'] = opts[:'published_at_start'] if !opts[:'published_at_start'].nil?
      query_params[:'published_at.end'] = opts[:'published_at_end'] if !opts[:'published_at_end'].nil?
      query_params[:'period'] = opts[:'period'] if !opts[:'period'].nil?

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json', 'text/xml'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/x-www-form-urlencoded'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = ['app_key', 'app_id']
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'TimeSeriesList')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: DefaultApi#list_time_series\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # List trends
    # This endpoint is used for finding trends based on stories.
    # @param field This parameter is used to specify the trend field.
    # @param [Hash] opts the optional parameters
    # @option opts [Array<Integer>] :id This parameter is used for finding stories by story id.
    # @option opts [Array<Integer>] :not_id This parameter is used for excluding stories by story id.
    # @option opts [String] :title This parameter is used for finding stories whose title contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
    # @option opts [String] :body This parameter is used for finding stories whose body contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
    # @option opts [String] :text This parameter is used for finding stories whose title or body contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
    # @option opts [Array<String>] :language This parameter is used for finding stories whose language is the specified value. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes.
    # @option opts [Array<String>] :not_language This parameter is used for excluding stories whose language is the specified value. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes.
    # @option opts [String] :published_at_start This parameter is used for finding stories whose published at time is greater than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates).
    # @option opts [String] :published_at_end This parameter is used for finding stories whose published at time is less than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates).
    # @option opts [String] :categories_taxonomy This parameter is used for defining the type of the taxonomy for the rest of the categories queries. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).
    # @option opts [BOOLEAN] :categories_confident This parameter is used for finding stories whose categories are confident. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories). (default to true)
    # @option opts [Array<String>] :categories_id This parameter is used for finding stories by categories id. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).
    # @option opts [Array<String>] :not_categories_id This parameter is used for excluding stories by categories id. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).
    # @option opts [Array<Integer>] :categories_level This parameter is used for finding stories by categories level. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).
    # @option opts [Array<Integer>] :not_categories_level This parameter is used for excluding stories by categories level. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).
    # @option opts [Array<String>] :entities_title_text This parameter is used to find stories based on the specified entities &#x60;text&#x60; in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :not_entities_title_text This parameter is used to exclude stories based on the specified entities &#x60;text&#x60; in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :entities_title_type This parameter is used to find stories based on the specified entities &#x60;type&#x60; in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :not_entities_title_type This parameter is used to exclude stories based on the specified entities &#x60;type&#x60; in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :entities_title_links_dbpedia This parameter is used to find stories based on the specified entities dbpedia URL in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :not_entities_title_links_dbpedia This parameter is used to exclude stories based on the specified entities dbpedia URL in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :entities_body_text This parameter is used to find stories based on the specified entities &#x60;text&#x60; in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :not_entities_body_text This parameter is used to exclude stories based on the specified entities &#x60;text&#x60; in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :entities_body_type This parameter is used to find stories based on the specified entities &#x60;type&#x60; in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :not_entities_body_type This parameter is used to exclude stories based on the specified entities &#x60;type&#x60; in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :entities_body_links_dbpedia This parameter is used to find stories based on the specified entities dbpedia URL in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :not_entities_body_links_dbpedia This parameter is used to exclude stories based on the specified entities dbpedia URL in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [String] :sentiment_title_polarity This parameter is used for finding stories whose title sentiment is the specified value.
    # @option opts [String] :not_sentiment_title_polarity This parameter is used for excluding stories whose title sentiment is the specified value.
    # @option opts [String] :sentiment_body_polarity This parameter is used for finding stories whose body sentiment is the specified value.
    # @option opts [String] :not_sentiment_body_polarity This parameter is used for excluding stories whose body sentiment is the specified value.
    # @option opts [Integer] :media_images_count_min This parameter is used for finding stories whose number of images is greater than or equal to the specified value.
    # @option opts [Integer] :media_images_count_max This parameter is used for finding stories whose number of images is less than or equal to the specified value.
    # @option opts [Integer] :media_images_width_min This parameter is used for finding stories whose width of images are greater than or equal to the specified value.
    # @option opts [Integer] :media_images_width_max This parameter is used for finding stories whose width of images are less than or equal to the specified value.
    # @option opts [Integer] :media_images_height_min This parameter is used for finding stories whose height of images are greater than or equal to the specified value.
    # @option opts [Integer] :media_images_height_max This parameter is used for finding stories whose height of images are less than or equal to the specified value.
    # @option opts [Integer] :media_images_content_length_min This parameter is used for finding stories whose images content length are greater than or equal to the specified value.
    # @option opts [Integer] :media_images_content_length_max This parameter is used for finding stories whose images content length are less than or equal to the specified value.
    # @option opts [Array<String>] :media_images_format This parameter is used for finding stories whose images format are the specified value.
    # @option opts [Array<String>] :not_media_images_format This parameter is used for excluding stories whose images format are the specified value.
    # @option opts [Integer] :media_videos_count_min This parameter is used for finding stories whose number of videos is greater than or equal to the specified value.
    # @option opts [Integer] :media_videos_count_max This parameter is used for finding stories whose number of videos is less than or equal to the specified value.
    # @option opts [Array<Integer>] :author_id This parameter is used for finding stories whose author id is the specified value.
    # @option opts [Array<Integer>] :not_author_id This parameter is used for excluding stories whose author id is the specified value.
    # @option opts [String] :author_name This parameter is used for finding stories whose author full name contains the specified value.
    # @option opts [String] :not_author_name This parameter is used for excluding stories whose author full name contains the specified value.
    # @option opts [Array<Integer>] :source_id This parameter is used for finding stories whose source id is the specified value.
    # @option opts [Array<Integer>] :not_source_id This parameter is used for excluding stories whose source id is the specified value.
    # @option opts [Array<String>] :source_name This parameter is used for finding stories whose source name contains the specified value.
    # @option opts [Array<String>] :not_source_name This parameter is used for excluding stories whose source name contains the specified value.
    # @option opts [Array<String>] :source_domain This parameter is used for finding stories whose source domain is the specified value.
    # @option opts [Array<String>] :not_source_domain This parameter is used for excluding stories whose source domain is the specified value.
    # @option opts [Array<String>] :source_locations_country This parameter is used for finding stories whose source country is the specified value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :not_source_locations_country This parameter is used for excluding stories whose source country is the specified value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_locations_state This parameter is used for finding stories whose source state/province is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :not_source_locations_state This parameter is used for excluding stories whose source state/province is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_locations_city This parameter is used for finding stories whose source city is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :not_source_locations_city This parameter is used for excluding stories whose source city is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_scopes_country This parameter is used for finding stories whose source scopes is the specified country value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :not_source_scopes_country This parameter is used for excluding stories whose source scopes is the specified country value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_scopes_state This parameter is used for finding stories whose source scopes is the specified state/province value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :not_source_scopes_state This parameter is used for excluding stories whose source scopes is the specified state/province value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_scopes_city This parameter is used for finding stories whose source scopes is the specified city value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :not_source_scopes_city This parameter is used for excluding stories whose source scopes is the specified city value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_scopes_level This parameter is used for finding stories whose source scopes is the specified level value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :not_source_scopes_level This parameter is used for excluding stories whose source scopes is the specified level value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Integer] :source_links_in_count_min This parameter is used for finding stories from sources whose Links in count is greater than or equal to the specified value. You can read more about working with Links in count [here](https://newsapi.aylien.com/docs/working-with-links-in-count).
    # @option opts [Integer] :source_links_in_count_max This parameter is used for finding stories from sources whose Links in count is less than or equal to the specified value. You can read more about working with Links in count [here](https://newsapi.aylien.com/docs/working-with-links-in-count).
    # @option opts [Integer] :source_rankings_alexa_rank_min This parameter is used for finding stories from sources whose Alexa rank is greater than or equal to the specified value. You can read more about working with Alexa ranks [here](https://newsapi.aylien.com/docs/working-with-alexa-ranks).
    # @option opts [Integer] :source_rankings_alexa_rank_max This parameter is used for finding stories from sources whose Alexa rank is less than or equal to the specified value. You can read more about working with Alexa ranks [here](https://newsapi.aylien.com/docs/working-with-alexa-ranks).
    # @option opts [Array<String>] :source_rankings_alexa_country This parameter is used for finding stories from sources whose Alexa rank is in the specified country value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. You can read more about working with Alexa ranks [here](https://newsapi.aylien.com/docs/working-with-alexa-ranks).
    # @option opts [Integer] :social_shares_count_facebook_min This parameter is used for finding stories whose Facebook social shares count is greater than or equal to the specified value.
    # @option opts [Integer] :social_shares_count_facebook_max This parameter is used for finding stories whose Facebook social shares count is less than or equal to the specified value.
    # @option opts [Integer] :social_shares_count_google_plus_min This parameter is used for finding stories whose Google+ social shares count is greater than or equal to the specified value.
    # @option opts [Integer] :social_shares_count_google_plus_max This parameter is used for finding stories whose Google+ social shares count is less than or equal to the specified value.
    # @option opts [Integer] :social_shares_count_linkedin_min This parameter is used for finding stories whose LinkedIn social shares count is greater than or equal to the specified value.
    # @option opts [Integer] :social_shares_count_linkedin_max This parameter is used for finding stories whose LinkedIn social shares count is less than or equal to the specified value.
    # @option opts [Integer] :social_shares_count_reddit_min This parameter is used for finding stories whose Reddit social shares count is greater than or equal to the specified value.
    # @option opts [Integer] :social_shares_count_reddit_max This parameter is used for finding stories whose Reddit social shares count is less than or equal to the specified value.
    # @return [Trends]
    def list_trends(field, opts = {})
      data, _status_code, _headers = list_trends_with_http_info(field, opts)
      return data
    end

    # List trends
    # This endpoint is used for finding trends based on stories.
    # @param field This parameter is used to specify the trend field.
    # @param [Hash] opts the optional parameters
    # @option opts [Array<Integer>] :id This parameter is used for finding stories by story id.
    # @option opts [Array<Integer>] :not_id This parameter is used for excluding stories by story id.
    # @option opts [String] :title This parameter is used for finding stories whose title contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
    # @option opts [String] :body This parameter is used for finding stories whose body contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
    # @option opts [String] :text This parameter is used for finding stories whose title or body contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
    # @option opts [Array<String>] :language This parameter is used for finding stories whose language is the specified value. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes.
    # @option opts [Array<String>] :not_language This parameter is used for excluding stories whose language is the specified value. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes.
    # @option opts [String] :published_at_start This parameter is used for finding stories whose published at time is greater than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates).
    # @option opts [String] :published_at_end This parameter is used for finding stories whose published at time is less than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates).
    # @option opts [String] :categories_taxonomy This parameter is used for defining the type of the taxonomy for the rest of the categories queries. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).
    # @option opts [BOOLEAN] :categories_confident This parameter is used for finding stories whose categories are confident. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).
    # @option opts [Array<String>] :categories_id This parameter is used for finding stories by categories id. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).
    # @option opts [Array<String>] :not_categories_id This parameter is used for excluding stories by categories id. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).
    # @option opts [Array<Integer>] :categories_level This parameter is used for finding stories by categories level. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).
    # @option opts [Array<Integer>] :not_categories_level This parameter is used for excluding stories by categories level. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).
    # @option opts [Array<String>] :entities_title_text This parameter is used to find stories based on the specified entities &#x60;text&#x60; in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :not_entities_title_text This parameter is used to exclude stories based on the specified entities &#x60;text&#x60; in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :entities_title_type This parameter is used to find stories based on the specified entities &#x60;type&#x60; in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :not_entities_title_type This parameter is used to exclude stories based on the specified entities &#x60;type&#x60; in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :entities_title_links_dbpedia This parameter is used to find stories based on the specified entities dbpedia URL in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :not_entities_title_links_dbpedia This parameter is used to exclude stories based on the specified entities dbpedia URL in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :entities_body_text This parameter is used to find stories based on the specified entities &#x60;text&#x60; in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :not_entities_body_text This parameter is used to exclude stories based on the specified entities &#x60;text&#x60; in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :entities_body_type This parameter is used to find stories based on the specified entities &#x60;type&#x60; in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :not_entities_body_type This parameter is used to exclude stories based on the specified entities &#x60;type&#x60; in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :entities_body_links_dbpedia This parameter is used to find stories based on the specified entities dbpedia URL in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [Array<String>] :not_entities_body_links_dbpedia This parameter is used to exclude stories based on the specified entities dbpedia URL in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).
    # @option opts [String] :sentiment_title_polarity This parameter is used for finding stories whose title sentiment is the specified value.
    # @option opts [String] :not_sentiment_title_polarity This parameter is used for excluding stories whose title sentiment is the specified value.
    # @option opts [String] :sentiment_body_polarity This parameter is used for finding stories whose body sentiment is the specified value.
    # @option opts [String] :not_sentiment_body_polarity This parameter is used for excluding stories whose body sentiment is the specified value.
    # @option opts [Integer] :media_images_count_min This parameter is used for finding stories whose number of images is greater than or equal to the specified value.
    # @option opts [Integer] :media_images_count_max This parameter is used for finding stories whose number of images is less than or equal to the specified value.
    # @option opts [Integer] :media_images_width_min This parameter is used for finding stories whose width of images are greater than or equal to the specified value.
    # @option opts [Integer] :media_images_width_max This parameter is used for finding stories whose width of images are less than or equal to the specified value.
    # @option opts [Integer] :media_images_height_min This parameter is used for finding stories whose height of images are greater than or equal to the specified value.
    # @option opts [Integer] :media_images_height_max This parameter is used for finding stories whose height of images are less than or equal to the specified value.
    # @option opts [Integer] :media_images_content_length_min This parameter is used for finding stories whose images content length are greater than or equal to the specified value.
    # @option opts [Integer] :media_images_content_length_max This parameter is used for finding stories whose images content length are less than or equal to the specified value.
    # @option opts [Array<String>] :media_images_format This parameter is used for finding stories whose images format are the specified value.
    # @option opts [Array<String>] :not_media_images_format This parameter is used for excluding stories whose images format are the specified value.
    # @option opts [Integer] :media_videos_count_min This parameter is used for finding stories whose number of videos is greater than or equal to the specified value.
    # @option opts [Integer] :media_videos_count_max This parameter is used for finding stories whose number of videos is less than or equal to the specified value.
    # @option opts [Array<Integer>] :author_id This parameter is used for finding stories whose author id is the specified value.
    # @option opts [Array<Integer>] :not_author_id This parameter is used for excluding stories whose author id is the specified value.
    # @option opts [String] :author_name This parameter is used for finding stories whose author full name contains the specified value.
    # @option opts [String] :not_author_name This parameter is used for excluding stories whose author full name contains the specified value.
    # @option opts [Array<Integer>] :source_id This parameter is used for finding stories whose source id is the specified value.
    # @option opts [Array<Integer>] :not_source_id This parameter is used for excluding stories whose source id is the specified value.
    # @option opts [Array<String>] :source_name This parameter is used for finding stories whose source name contains the specified value.
    # @option opts [Array<String>] :not_source_name This parameter is used for excluding stories whose source name contains the specified value.
    # @option opts [Array<String>] :source_domain This parameter is used for finding stories whose source domain is the specified value.
    # @option opts [Array<String>] :not_source_domain This parameter is used for excluding stories whose source domain is the specified value.
    # @option opts [Array<String>] :source_locations_country This parameter is used for finding stories whose source country is the specified value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :not_source_locations_country This parameter is used for excluding stories whose source country is the specified value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_locations_state This parameter is used for finding stories whose source state/province is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :not_source_locations_state This parameter is used for excluding stories whose source state/province is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_locations_city This parameter is used for finding stories whose source city is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :not_source_locations_city This parameter is used for excluding stories whose source city is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_scopes_country This parameter is used for finding stories whose source scopes is the specified country value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :not_source_scopes_country This parameter is used for excluding stories whose source scopes is the specified country value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_scopes_state This parameter is used for finding stories whose source scopes is the specified state/province value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :not_source_scopes_state This parameter is used for excluding stories whose source scopes is the specified state/province value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_scopes_city This parameter is used for finding stories whose source scopes is the specified city value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :not_source_scopes_city This parameter is used for excluding stories whose source scopes is the specified city value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_scopes_level This parameter is used for finding stories whose source scopes is the specified level value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :not_source_scopes_level This parameter is used for excluding stories whose source scopes is the specified level value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Integer] :source_links_in_count_min This parameter is used for finding stories from sources whose Links in count is greater than or equal to the specified value. You can read more about working with Links in count [here](https://newsapi.aylien.com/docs/working-with-links-in-count).
    # @option opts [Integer] :source_links_in_count_max This parameter is used for finding stories from sources whose Links in count is less than or equal to the specified value. You can read more about working with Links in count [here](https://newsapi.aylien.com/docs/working-with-links-in-count).
    # @option opts [Integer] :source_rankings_alexa_rank_min This parameter is used for finding stories from sources whose Alexa rank is greater than or equal to the specified value. You can read more about working with Alexa ranks [here](https://newsapi.aylien.com/docs/working-with-alexa-ranks).
    # @option opts [Integer] :source_rankings_alexa_rank_max This parameter is used for finding stories from sources whose Alexa rank is less than or equal to the specified value. You can read more about working with Alexa ranks [here](https://newsapi.aylien.com/docs/working-with-alexa-ranks).
    # @option opts [Array<String>] :source_rankings_alexa_country This parameter is used for finding stories from sources whose Alexa rank is in the specified country value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. You can read more about working with Alexa ranks [here](https://newsapi.aylien.com/docs/working-with-alexa-ranks).
    # @option opts [Integer] :social_shares_count_facebook_min This parameter is used for finding stories whose Facebook social shares count is greater than or equal to the specified value.
    # @option opts [Integer] :social_shares_count_facebook_max This parameter is used for finding stories whose Facebook social shares count is less than or equal to the specified value.
    # @option opts [Integer] :social_shares_count_google_plus_min This parameter is used for finding stories whose Google+ social shares count is greater than or equal to the specified value.
    # @option opts [Integer] :social_shares_count_google_plus_max This parameter is used for finding stories whose Google+ social shares count is less than or equal to the specified value.
    # @option opts [Integer] :social_shares_count_linkedin_min This parameter is used for finding stories whose LinkedIn social shares count is greater than or equal to the specified value.
    # @option opts [Integer] :social_shares_count_linkedin_max This parameter is used for finding stories whose LinkedIn social shares count is less than or equal to the specified value.
    # @option opts [Integer] :social_shares_count_reddit_min This parameter is used for finding stories whose Reddit social shares count is greater than or equal to the specified value.
    # @option opts [Integer] :social_shares_count_reddit_max This parameter is used for finding stories whose Reddit social shares count is less than or equal to the specified value.
    # @return [Array<(Trends, Fixnum, Hash)>] Trends data, response status code and response headers
    def list_trends_with_http_info(field, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: DefaultApi.list_trends ..."
      end
      # verify the required parameter 'field' is set
      fail ArgumentError, "Missing the required parameter 'field' when calling DefaultApi.list_trends" if field.nil?
      # verify enum value
      unless ['author.name', 'source.name', 'source.domain', 'keywords', 'entities.title.text', 'entities.title.type', 'entities.title.links.dbpedia', 'entities.body.text', 'entities.body.type', 'entities.body.links.dbpedia', 'hashtags', 'categories.id', 'sentiment.title.polarity', 'sentiment.body.polarity'].include?(field)
        fail ArgumentError, "invalid value for 'field', must be one of author.name, source.name, source.domain, keywords, entities.title.text, entities.title.type, entities.title.links.dbpedia, entities.body.text, entities.body.type, entities.body.links.dbpedia, hashtags, categories.id, sentiment.title.polarity, sentiment.body.polarity"
      end
      if opts[:'language'] && !opts[:'language'].all?{|item| ['en', 'de', 'fr', 'it', 'es', 'pt'].include?(item)}
        fail ArgumentError, 'invalid value for "language", must include one of en, de, fr, it, es, pt'
      end
      if opts[:'not_language'] && !opts[:'not_language'].all?{|item| ['en', 'de', 'fr', 'it', 'es', 'pt'].include?(item)}
        fail ArgumentError, 'invalid value for "not_language", must include one of en, de, fr, it, es, pt'
      end
      if opts[:'categories_taxonomy'] && !['iab-qag', 'iptc-subjectcode'].include?(opts[:'categories_taxonomy'])
        fail ArgumentError, 'invalid value for "categories_taxonomy", must be one of iab-qag, iptc-subjectcode'
      end
      if opts[:'sentiment_title_polarity'] && !['positive', 'neutral', 'negative'].include?(opts[:'sentiment_title_polarity'])
        fail ArgumentError, 'invalid value for "sentiment_title_polarity", must be one of positive, neutral, negative'
      end
      if opts[:'not_sentiment_title_polarity'] && !['positive', 'neutral', 'negative'].include?(opts[:'not_sentiment_title_polarity'])
        fail ArgumentError, 'invalid value for "not_sentiment_title_polarity", must be one of positive, neutral, negative'
      end
      if opts[:'sentiment_body_polarity'] && !['positive', 'neutral', 'negative'].include?(opts[:'sentiment_body_polarity'])
        fail ArgumentError, 'invalid value for "sentiment_body_polarity", must be one of positive, neutral, negative'
      end
      if opts[:'not_sentiment_body_polarity'] && !['positive', 'neutral', 'negative'].include?(opts[:'not_sentiment_body_polarity'])
        fail ArgumentError, 'invalid value for "not_sentiment_body_polarity", must be one of positive, neutral, negative'
      end
      if !opts[:'media_images_count_min'].nil? && opts[:'media_images_count_min'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"media_images_count_min"]" when calling DefaultApi.list_trends, must be greater than 0.'
      end

      if !opts[:'media_images_count_max'].nil? && opts[:'media_images_count_max'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"media_images_count_max"]" when calling DefaultApi.list_trends, must be greater than 0.'
      end

      if !opts[:'media_images_width_min'].nil? && opts[:'media_images_width_min'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"media_images_width_min"]" when calling DefaultApi.list_trends, must be greater than 0.'
      end

      if !opts[:'media_images_width_max'].nil? && opts[:'media_images_width_max'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"media_images_width_max"]" when calling DefaultApi.list_trends, must be greater than 0.'
      end

      if !opts[:'media_images_height_min'].nil? && opts[:'media_images_height_min'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"media_images_height_min"]" when calling DefaultApi.list_trends, must be greater than 0.'
      end

      if !opts[:'media_images_height_max'].nil? && opts[:'media_images_height_max'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"media_images_height_max"]" when calling DefaultApi.list_trends, must be greater than 0.'
      end

      if !opts[:'media_images_content_length_min'].nil? && opts[:'media_images_content_length_min'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"media_images_content_length_min"]" when calling DefaultApi.list_trends, must be greater than 0.'
      end

      if !opts[:'media_images_content_length_max'].nil? && opts[:'media_images_content_length_max'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"media_images_content_length_max"]" when calling DefaultApi.list_trends, must be greater than 0.'
      end

      if opts[:'media_images_format'] && !opts[:'media_images_format'].all?{|item| ['BMP', 'GIF', 'JPEG', 'PNG', 'TIFF', 'PSD', 'ICO', 'CUR', 'WEBP', 'SVG'].include?(item)}
        fail ArgumentError, 'invalid value for "media_images_format", must include one of BMP, GIF, JPEG, PNG, TIFF, PSD, ICO, CUR, WEBP, SVG'
      end
      if opts[:'not_media_images_format'] && !opts[:'not_media_images_format'].all?{|item| ['BMP', 'GIF', 'JPEG', 'PNG', 'TIFF', 'PSD', 'ICO', 'CUR', 'WEBP', 'SVG'].include?(item)}
        fail ArgumentError, 'invalid value for "not_media_images_format", must include one of BMP, GIF, JPEG, PNG, TIFF, PSD, ICO, CUR, WEBP, SVG'
      end
      if !opts[:'media_videos_count_min'].nil? && opts[:'media_videos_count_min'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"media_videos_count_min"]" when calling DefaultApi.list_trends, must be greater than 0.'
      end

      if !opts[:'media_videos_count_max'].nil? && opts[:'media_videos_count_max'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"media_videos_count_max"]" when calling DefaultApi.list_trends, must be greater than 0.'
      end

      if opts[:'source_scopes_level'] && !opts[:'source_scopes_level'].all?{|item| ['international', 'national', 'local'].include?(item)}
        fail ArgumentError, 'invalid value for "source_scopes_level", must include one of international, national, local'
      end
      if opts[:'not_source_scopes_level'] && !opts[:'not_source_scopes_level'].all?{|item| ['international', 'national', 'local'].include?(item)}
        fail ArgumentError, 'invalid value for "not_source_scopes_level", must include one of international, national, local'
      end
      if !opts[:'source_links_in_count_min'].nil? && opts[:'source_links_in_count_min'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"source_links_in_count_min"]" when calling DefaultApi.list_trends, must be greater than 0.'
      end

      if !opts[:'source_links_in_count_max'].nil? && opts[:'source_links_in_count_max'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"source_links_in_count_max"]" when calling DefaultApi.list_trends, must be greater than 0.'
      end

      if !opts[:'source_rankings_alexa_rank_min'].nil? && opts[:'source_rankings_alexa_rank_min'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"source_rankings_alexa_rank_min"]" when calling DefaultApi.list_trends, must be greater than 0.'
      end

      if !opts[:'source_rankings_alexa_rank_max'].nil? && opts[:'source_rankings_alexa_rank_max'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"source_rankings_alexa_rank_max"]" when calling DefaultApi.list_trends, must be greater than 0.'
      end

      if !opts[:'social_shares_count_facebook_min'].nil? && opts[:'social_shares_count_facebook_min'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"social_shares_count_facebook_min"]" when calling DefaultApi.list_trends, must be greater than 0.'
      end

      if !opts[:'social_shares_count_facebook_max'].nil? && opts[:'social_shares_count_facebook_max'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"social_shares_count_facebook_max"]" when calling DefaultApi.list_trends, must be greater than 0.'
      end

      if !opts[:'social_shares_count_google_plus_min'].nil? && opts[:'social_shares_count_google_plus_min'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"social_shares_count_google_plus_min"]" when calling DefaultApi.list_trends, must be greater than 0.'
      end

      if !opts[:'social_shares_count_google_plus_max'].nil? && opts[:'social_shares_count_google_plus_max'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"social_shares_count_google_plus_max"]" when calling DefaultApi.list_trends, must be greater than 0.'
      end

      if !opts[:'social_shares_count_linkedin_min'].nil? && opts[:'social_shares_count_linkedin_min'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"social_shares_count_linkedin_min"]" when calling DefaultApi.list_trends, must be greater than 0.'
      end

      if !opts[:'social_shares_count_linkedin_max'].nil? && opts[:'social_shares_count_linkedin_max'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"social_shares_count_linkedin_max"]" when calling DefaultApi.list_trends, must be greater than 0.'
      end

      if !opts[:'social_shares_count_reddit_min'].nil? && opts[:'social_shares_count_reddit_min'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"social_shares_count_reddit_min"]" when calling DefaultApi.list_trends, must be greater than 0.'
      end

      if !opts[:'social_shares_count_reddit_max'].nil? && opts[:'social_shares_count_reddit_max'] <= 0
        fail ArgumentError, 'invalid value for "opts[:"social_shares_count_reddit_max"]" when calling DefaultApi.list_trends, must be greater than 0.'
      end

      # resource path
      local_var_path = "/trends".sub('{format}','json')

      # query parameters
      query_params = {}
      query_params[:'field'] = field
      query_params[:'id[]'] = @api_client.build_collection_param(opts[:'id'], :multi) if !opts[:'id'].nil?
      query_params[:'!id[]'] = @api_client.build_collection_param(opts[:'not_id'], :multi) if !opts[:'not_id'].nil?
      query_params[:'title'] = opts[:'title'] if !opts[:'title'].nil?
      query_params[:'body'] = opts[:'body'] if !opts[:'body'].nil?
      query_params[:'text'] = opts[:'text'] if !opts[:'text'].nil?
      query_params[:'language[]'] = @api_client.build_collection_param(opts[:'language'], :multi) if !opts[:'language'].nil?
      query_params[:'!language[]'] = @api_client.build_collection_param(opts[:'not_language'], :multi) if !opts[:'not_language'].nil?
      query_params[:'published_at.start'] = opts[:'published_at_start'] if !opts[:'published_at_start'].nil?
      query_params[:'published_at.end'] = opts[:'published_at_end'] if !opts[:'published_at_end'].nil?
      query_params[:'categories.taxonomy'] = opts[:'categories_taxonomy'] if !opts[:'categories_taxonomy'].nil?
      query_params[:'categories.confident'] = opts[:'categories_confident'] if !opts[:'categories_confident'].nil?
      query_params[:'categories.id[]'] = @api_client.build_collection_param(opts[:'categories_id'], :multi) if !opts[:'categories_id'].nil?
      query_params[:'!categories.id[]'] = @api_client.build_collection_param(opts[:'not_categories_id'], :multi) if !opts[:'not_categories_id'].nil?
      query_params[:'categories.level[]'] = @api_client.build_collection_param(opts[:'categories_level'], :multi) if !opts[:'categories_level'].nil?
      query_params[:'!categories.level[]'] = @api_client.build_collection_param(opts[:'not_categories_level'], :multi) if !opts[:'not_categories_level'].nil?
      query_params[:'entities.title.text[]'] = @api_client.build_collection_param(opts[:'entities_title_text'], :multi) if !opts[:'entities_title_text'].nil?
      query_params[:'!entities.title.text[]'] = @api_client.build_collection_param(opts[:'not_entities_title_text'], :multi) if !opts[:'not_entities_title_text'].nil?
      query_params[:'entities.title.type[]'] = @api_client.build_collection_param(opts[:'entities_title_type'], :multi) if !opts[:'entities_title_type'].nil?
      query_params[:'!entities.title.type[]'] = @api_client.build_collection_param(opts[:'not_entities_title_type'], :multi) if !opts[:'not_entities_title_type'].nil?
      query_params[:'entities.title.links.dbpedia[]'] = @api_client.build_collection_param(opts[:'entities_title_links_dbpedia'], :multi) if !opts[:'entities_title_links_dbpedia'].nil?
      query_params[:'!entities.title.links.dbpedia[]'] = @api_client.build_collection_param(opts[:'not_entities_title_links_dbpedia'], :multi) if !opts[:'not_entities_title_links_dbpedia'].nil?
      query_params[:'entities.body.text[]'] = @api_client.build_collection_param(opts[:'entities_body_text'], :multi) if !opts[:'entities_body_text'].nil?
      query_params[:'!entities.body.text[]'] = @api_client.build_collection_param(opts[:'not_entities_body_text'], :multi) if !opts[:'not_entities_body_text'].nil?
      query_params[:'entities.body.type[]'] = @api_client.build_collection_param(opts[:'entities_body_type'], :multi) if !opts[:'entities_body_type'].nil?
      query_params[:'!entities.body.type[]'] = @api_client.build_collection_param(opts[:'not_entities_body_type'], :multi) if !opts[:'not_entities_body_type'].nil?
      query_params[:'entities.body.links.dbpedia[]'] = @api_client.build_collection_param(opts[:'entities_body_links_dbpedia'], :multi) if !opts[:'entities_body_links_dbpedia'].nil?
      query_params[:'!entities.body.links.dbpedia[]'] = @api_client.build_collection_param(opts[:'not_entities_body_links_dbpedia'], :multi) if !opts[:'not_entities_body_links_dbpedia'].nil?
      query_params[:'sentiment.title.polarity'] = opts[:'sentiment_title_polarity'] if !opts[:'sentiment_title_polarity'].nil?
      query_params[:'!sentiment.title.polarity'] = opts[:'not_sentiment_title_polarity'] if !opts[:'not_sentiment_title_polarity'].nil?
      query_params[:'sentiment.body.polarity'] = opts[:'sentiment_body_polarity'] if !opts[:'sentiment_body_polarity'].nil?
      query_params[:'!sentiment.body.polarity'] = opts[:'not_sentiment_body_polarity'] if !opts[:'not_sentiment_body_polarity'].nil?
      query_params[:'media.images.count.min'] = opts[:'media_images_count_min'] if !opts[:'media_images_count_min'].nil?
      query_params[:'media.images.count.max'] = opts[:'media_images_count_max'] if !opts[:'media_images_count_max'].nil?
      query_params[:'media.images.width.min'] = opts[:'media_images_width_min'] if !opts[:'media_images_width_min'].nil?
      query_params[:'media.images.width.max'] = opts[:'media_images_width_max'] if !opts[:'media_images_width_max'].nil?
      query_params[:'media.images.height.min'] = opts[:'media_images_height_min'] if !opts[:'media_images_height_min'].nil?
      query_params[:'media.images.height.max'] = opts[:'media_images_height_max'] if !opts[:'media_images_height_max'].nil?
      query_params[:'media.images.content_length.min'] = opts[:'media_images_content_length_min'] if !opts[:'media_images_content_length_min'].nil?
      query_params[:'media.images.content_length.max'] = opts[:'media_images_content_length_max'] if !opts[:'media_images_content_length_max'].nil?
      query_params[:'media.images.format[]'] = @api_client.build_collection_param(opts[:'media_images_format'], :multi) if !opts[:'media_images_format'].nil?
      query_params[:'!media.images.format[]'] = @api_client.build_collection_param(opts[:'not_media_images_format'], :multi) if !opts[:'not_media_images_format'].nil?
      query_params[:'media.videos.count.min'] = opts[:'media_videos_count_min'] if !opts[:'media_videos_count_min'].nil?
      query_params[:'media.videos.count.max'] = opts[:'media_videos_count_max'] if !opts[:'media_videos_count_max'].nil?
      query_params[:'author.id[]'] = @api_client.build_collection_param(opts[:'author_id'], :multi) if !opts[:'author_id'].nil?
      query_params[:'!author.id[]'] = @api_client.build_collection_param(opts[:'not_author_id'], :multi) if !opts[:'not_author_id'].nil?
      query_params[:'author.name'] = opts[:'author_name'] if !opts[:'author_name'].nil?
      query_params[:'!author.name'] = opts[:'not_author_name'] if !opts[:'not_author_name'].nil?
      query_params[:'source.id[]'] = @api_client.build_collection_param(opts[:'source_id'], :multi) if !opts[:'source_id'].nil?
      query_params[:'!source.id[]'] = @api_client.build_collection_param(opts[:'not_source_id'], :multi) if !opts[:'not_source_id'].nil?
      query_params[:'source.name[]'] = @api_client.build_collection_param(opts[:'source_name'], :multi) if !opts[:'source_name'].nil?
      query_params[:'!source.name[]'] = @api_client.build_collection_param(opts[:'not_source_name'], :multi) if !opts[:'not_source_name'].nil?
      query_params[:'source.domain[]'] = @api_client.build_collection_param(opts[:'source_domain'], :multi) if !opts[:'source_domain'].nil?
      query_params[:'!source.domain[]'] = @api_client.build_collection_param(opts[:'not_source_domain'], :multi) if !opts[:'not_source_domain'].nil?
      query_params[:'source.locations.country[]'] = @api_client.build_collection_param(opts[:'source_locations_country'], :multi) if !opts[:'source_locations_country'].nil?
      query_params[:'!source.locations.country[]'] = @api_client.build_collection_param(opts[:'not_source_locations_country'], :multi) if !opts[:'not_source_locations_country'].nil?
      query_params[:'source.locations.state[]'] = @api_client.build_collection_param(opts[:'source_locations_state'], :multi) if !opts[:'source_locations_state'].nil?
      query_params[:'!source.locations.state[]'] = @api_client.build_collection_param(opts[:'not_source_locations_state'], :multi) if !opts[:'not_source_locations_state'].nil?
      query_params[:'source.locations.city[]'] = @api_client.build_collection_param(opts[:'source_locations_city'], :multi) if !opts[:'source_locations_city'].nil?
      query_params[:'!source.locations.city[]'] = @api_client.build_collection_param(opts[:'not_source_locations_city'], :multi) if !opts[:'not_source_locations_city'].nil?
      query_params[:'source.scopes.country[]'] = @api_client.build_collection_param(opts[:'source_scopes_country'], :multi) if !opts[:'source_scopes_country'].nil?
      query_params[:'!source.scopes.country[]'] = @api_client.build_collection_param(opts[:'not_source_scopes_country'], :multi) if !opts[:'not_source_scopes_country'].nil?
      query_params[:'source.scopes.state[]'] = @api_client.build_collection_param(opts[:'source_scopes_state'], :multi) if !opts[:'source_scopes_state'].nil?
      query_params[:'!source.scopes.state[]'] = @api_client.build_collection_param(opts[:'not_source_scopes_state'], :multi) if !opts[:'not_source_scopes_state'].nil?
      query_params[:'source.scopes.city[]'] = @api_client.build_collection_param(opts[:'source_scopes_city'], :multi) if !opts[:'source_scopes_city'].nil?
      query_params[:'!source.scopes.city[]'] = @api_client.build_collection_param(opts[:'not_source_scopes_city'], :multi) if !opts[:'not_source_scopes_city'].nil?
      query_params[:'source.scopes.level[]'] = @api_client.build_collection_param(opts[:'source_scopes_level'], :multi) if !opts[:'source_scopes_level'].nil?
      query_params[:'!source.scopes.level[]'] = @api_client.build_collection_param(opts[:'not_source_scopes_level'], :multi) if !opts[:'not_source_scopes_level'].nil?
      query_params[:'source.links_in_count.min'] = opts[:'source_links_in_count_min'] if !opts[:'source_links_in_count_min'].nil?
      query_params[:'source.links_in_count.max'] = opts[:'source_links_in_count_max'] if !opts[:'source_links_in_count_max'].nil?
      query_params[:'source.rankings.alexa.rank.min'] = opts[:'source_rankings_alexa_rank_min'] if !opts[:'source_rankings_alexa_rank_min'].nil?
      query_params[:'source.rankings.alexa.rank.max'] = opts[:'source_rankings_alexa_rank_max'] if !opts[:'source_rankings_alexa_rank_max'].nil?
      query_params[:'source.rankings.alexa.country[]'] = @api_client.build_collection_param(opts[:'source_rankings_alexa_country'], :multi) if !opts[:'source_rankings_alexa_country'].nil?
      query_params[:'social_shares_count.facebook.min'] = opts[:'social_shares_count_facebook_min'] if !opts[:'social_shares_count_facebook_min'].nil?
      query_params[:'social_shares_count.facebook.max'] = opts[:'social_shares_count_facebook_max'] if !opts[:'social_shares_count_facebook_max'].nil?
      query_params[:'social_shares_count.google_plus.min'] = opts[:'social_shares_count_google_plus_min'] if !opts[:'social_shares_count_google_plus_min'].nil?
      query_params[:'social_shares_count.google_plus.max'] = opts[:'social_shares_count_google_plus_max'] if !opts[:'social_shares_count_google_plus_max'].nil?
      query_params[:'social_shares_count.linkedin.min'] = opts[:'social_shares_count_linkedin_min'] if !opts[:'social_shares_count_linkedin_min'].nil?
      query_params[:'social_shares_count.linkedin.max'] = opts[:'social_shares_count_linkedin_max'] if !opts[:'social_shares_count_linkedin_max'].nil?
      query_params[:'social_shares_count.reddit.min'] = opts[:'social_shares_count_reddit_min'] if !opts[:'social_shares_count_reddit_min'].nil?
      query_params[:'social_shares_count.reddit.max'] = opts[:'social_shares_count_reddit_max'] if !opts[:'social_shares_count_reddit_max'].nil?

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json', 'text/xml'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/x-www-form-urlencoded'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = ['app_key', 'app_id']
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'Trends')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: DefaultApi#list_trends\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
