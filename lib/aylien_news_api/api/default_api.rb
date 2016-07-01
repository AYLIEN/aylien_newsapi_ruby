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

      if opts[:'language'] && !['en', 'de', 'fr', 'it', 'es', 'pt'].include?(opts[:'language'])
        fail ArgumentError, 'invalid value for "language", must be one of en, de, fr, it, es, pt'
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
      local_header_accept = ['application/json', 'text/xml']
      local_header_accept_result = @api_client.select_header_accept(local_header_accept) and header_params['Accept'] = local_header_accept_result

      # HTTP header 'Content-Type'
      local_header_content_type = ['application/x-www-form-urlencoded']
      header_params['Content-Type'] = @api_client.select_header_content_type(local_header_content_type)

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
    # @option opts [Array<Integer>] :id This parameter is used for finding stroies by story id.
    # @option opts [String] :title This parameter is used for finding stories whose title contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
    # @option opts [String] :body This parameter is used for finding stories whose body contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
    # @option opts [String] :text This parameter is used for finding stories whose title or body contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
    # @option opts [Array<String>] :language This parameter is used for finding stories whose language is the specified value. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes.
    # @option opts [String] :published_at_start This parameter is used for finding stories whose published at time is greater than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates).
    # @option opts [String] :published_at_end This parameter is used for finding stories whose published at time is less than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates).
    # @option opts [String] :categories_taxonomy This parameter is used for defining the type of the taxonomy for the rest of the categories queries.
    # @option opts [BOOLEAN] :categories_confident This parameter is used for finding stories whose categories are confident. (default to true)
    # @option opts [Array<String>] :categories_id This parameter is used for finding stories by categories id.
    # @option opts [Array<Integer>] :categories_level This parameter is used for finding stories by categories level.
    # @option opts [Array<String>] :entities_title_text This parameter is used to find stories based on the specified entities &#x60;text&#x60; in story titles.
    # @option opts [Array<String>] :entities_title_type This parameter is used to find stories based on the specified entities &#x60;type&#x60; in story titles.
    # @option opts [Array<String>] :entities_title_links_dbpedia This parameter is used to find stories based on the specified entities dbpedia URL in story titles.
    # @option opts [Array<String>] :entities_body_text This parameter is used to find stories based on the specified entities &#x60;text&#x60; in the body of stories.
    # @option opts [Array<String>] :entities_body_type This parameter is used to find stories based on the specified entities &#x60;type&#x60; in the body of stories.
    # @option opts [Array<String>] :entities_body_links_dbpedia This parameter is used to find stories based on the specified entities dbpedia URL in the body of stories.
    # @option opts [String] :sentiment_title_polarity This parameter is used for finding stories whose title sentiment is the specified value.
    # @option opts [String] :sentiment_body_polarity This parameter is used for finding stories whose body sentiment is the specified value.
    # @option opts [Integer] :media_images_count_min This parameter is used for finding stories whose number of images is greater than or equal to the specified value.
    # @option opts [Integer] :media_images_count_max This parameter is used for finding stories whose number of images is less than or equal to the specified value.
    # @option opts [Integer] :media_videos_count_min This parameter is used for finding stories whose number of videos is greater than or equal to the specified value.
    # @option opts [Integer] :media_videos_count_max This parameter is used for finding stories whose number of videos is less than or equal to the specified value.
    # @option opts [Array<Integer>] :author_id This parameter is used for finding stories whose author id is the specified value.
    # @option opts [String] :author_name This parameter is used for finding stories whose author full name contains the specified value.
    # @option opts [Array<Integer>] :source_id This parameter is used for finding stories whose source id is the specified value.
    # @option opts [Array<String>] :source_name This parameter is used for finding stories whose source name contains the specified value.
    # @option opts [Array<String>] :source_domain This parameter is used for finding stories whose source domain is the specified value.
    # @option opts [Array<String>] :source_locations_country This parameter is used for finding stories whose source country is the specified value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_locations_state This parameter is used for finding stories whose source state/province is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_locations_city This parameter is used for finding stories whose source city is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_scopes_country This parameter is used for finding stories whose source scopes  is the specified country value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_scopes_state This parameter is used for finding stories whose source scopes is the specified state/province value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_scopes_city This parameter is used for finding stories whose source scopes is the specified city value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_scopes_level This parameter is used for finding stories whose source scopes  is the specified level value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [BOOLEAN] :cluster This parameter enables clustering for the returned stories. (default to false)
    # @option opts [String] :cluster_algorithm This parameter is used for specifying the clustering algorithm you wish to use. It supprts STC, Lingo and [k-means](https://en.wikipedia.org/wiki/K-means_clustering) algorithms. (default to lingo)
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
    # @option opts [Array<Integer>] :id This parameter is used for finding stroies by story id.
    # @option opts [String] :title This parameter is used for finding stories whose title contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
    # @option opts [String] :body This parameter is used for finding stories whose body contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
    # @option opts [String] :text This parameter is used for finding stories whose title or body contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
    # @option opts [Array<String>] :language This parameter is used for finding stories whose language is the specified value. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes.
    # @option opts [String] :published_at_start This parameter is used for finding stories whose published at time is greater than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates).
    # @option opts [String] :published_at_end This parameter is used for finding stories whose published at time is less than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates).
    # @option opts [String] :categories_taxonomy This parameter is used for defining the type of the taxonomy for the rest of the categories queries.
    # @option opts [BOOLEAN] :categories_confident This parameter is used for finding stories whose categories are confident.
    # @option opts [Array<String>] :categories_id This parameter is used for finding stories by categories id.
    # @option opts [Array<Integer>] :categories_level This parameter is used for finding stories by categories level.
    # @option opts [Array<String>] :entities_title_text This parameter is used to find stories based on the specified entities &#x60;text&#x60; in story titles.
    # @option opts [Array<String>] :entities_title_type This parameter is used to find stories based on the specified entities &#x60;type&#x60; in story titles.
    # @option opts [Array<String>] :entities_title_links_dbpedia This parameter is used to find stories based on the specified entities dbpedia URL in story titles.
    # @option opts [Array<String>] :entities_body_text This parameter is used to find stories based on the specified entities &#x60;text&#x60; in the body of stories.
    # @option opts [Array<String>] :entities_body_type This parameter is used to find stories based on the specified entities &#x60;type&#x60; in the body of stories.
    # @option opts [Array<String>] :entities_body_links_dbpedia This parameter is used to find stories based on the specified entities dbpedia URL in the body of stories.
    # @option opts [String] :sentiment_title_polarity This parameter is used for finding stories whose title sentiment is the specified value.
    # @option opts [String] :sentiment_body_polarity This parameter is used for finding stories whose body sentiment is the specified value.
    # @option opts [Integer] :media_images_count_min This parameter is used for finding stories whose number of images is greater than or equal to the specified value.
    # @option opts [Integer] :media_images_count_max This parameter is used for finding stories whose number of images is less than or equal to the specified value.
    # @option opts [Integer] :media_videos_count_min This parameter is used for finding stories whose number of videos is greater than or equal to the specified value.
    # @option opts [Integer] :media_videos_count_max This parameter is used for finding stories whose number of videos is less than or equal to the specified value.
    # @option opts [Array<Integer>] :author_id This parameter is used for finding stories whose author id is the specified value.
    # @option opts [String] :author_name This parameter is used for finding stories whose author full name contains the specified value.
    # @option opts [Array<Integer>] :source_id This parameter is used for finding stories whose source id is the specified value.
    # @option opts [Array<String>] :source_name This parameter is used for finding stories whose source name contains the specified value.
    # @option opts [Array<String>] :source_domain This parameter is used for finding stories whose source domain is the specified value.
    # @option opts [Array<String>] :source_locations_country This parameter is used for finding stories whose source country is the specified value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_locations_state This parameter is used for finding stories whose source state/province is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_locations_city This parameter is used for finding stories whose source city is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_scopes_country This parameter is used for finding stories whose source scopes  is the specified country value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_scopes_state This parameter is used for finding stories whose source scopes is the specified state/province value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_scopes_city This parameter is used for finding stories whose source scopes is the specified city value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_scopes_level This parameter is used for finding stories whose source scopes  is the specified level value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [BOOLEAN] :cluster This parameter enables clustering for the returned stories.
    # @option opts [String] :cluster_algorithm This parameter is used for specifying the clustering algorithm you wish to use. It supprts STC, Lingo and [k-means](https://en.wikipedia.org/wiki/K-means_clustering) algorithms.
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
      if opts[:'categories_taxonomy'] && !['iab-qag', 'iptc-subjectcode'].include?(opts[:'categories_taxonomy'])
        fail ArgumentError, 'invalid value for "categories_taxonomy", must be one of iab-qag, iptc-subjectcode'
      end
      if opts[:'sentiment_title_polarity'] && !['positive', 'neutral', 'negative'].include?(opts[:'sentiment_title_polarity'])
        fail ArgumentError, 'invalid value for "sentiment_title_polarity", must be one of positive, neutral, negative'
      end
      if opts[:'sentiment_body_polarity'] && !['positive', 'neutral', 'negative'].include?(opts[:'sentiment_body_polarity'])
        fail ArgumentError, 'invalid value for "sentiment_body_polarity", must be one of positive, neutral, negative'
      end

      if opts[:'cluster_algorithm'] && !['stc', 'lingo', 'kmeans'].include?(opts[:'cluster_algorithm'])
        fail ArgumentError, 'invalid value for "cluster_algorithm", must be one of stc, lingo, kmeans'
      end
      if opts[:'story_language'] && !['auto', 'en', 'de', 'fr', 'it', 'es', 'pt'].include?(opts[:'story_language'])
        fail ArgumentError, 'invalid value for "story_language", must be one of auto, en, de, fr, it, es, pt'
      end

      # resource path
      local_var_path = "/coverages".sub('{format}','json')

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}

      # HTTP header 'Accept' (if needed)
      local_header_accept = ['application/json', 'text/xml']
      local_header_accept_result = @api_client.select_header_accept(local_header_accept) and header_params['Accept'] = local_header_accept_result

      # HTTP header 'Content-Type'
      local_header_content_type = ['application/x-www-form-urlencoded']
      header_params['Content-Type'] = @api_client.select_header_content_type(local_header_content_type)

      # form parameters
      form_params = {}
      form_params["id[]"] = @api_client.build_collection_param(opts[:'id'], :multi) if !opts[:'id'].nil?
      form_params["title"] = opts[:'title'] if !opts[:'title'].nil?
      form_params["body"] = opts[:'body'] if !opts[:'body'].nil?
      form_params["text"] = opts[:'text'] if !opts[:'text'].nil?
      form_params["language[]"] = @api_client.build_collection_param(opts[:'language'], :multi) if !opts[:'language'].nil?
      form_params["published_at.start"] = opts[:'published_at_start'] if !opts[:'published_at_start'].nil?
      form_params["published_at.end"] = opts[:'published_at_end'] if !opts[:'published_at_end'].nil?
      form_params["categories.taxonomy"] = opts[:'categories_taxonomy'] if !opts[:'categories_taxonomy'].nil?
      form_params["categories.confident"] = opts[:'categories_confident'] if !opts[:'categories_confident'].nil?
      form_params["categories.id[]"] = @api_client.build_collection_param(opts[:'categories_id'], :multi) if !opts[:'categories_id'].nil?
      form_params["categories.level[]"] = @api_client.build_collection_param(opts[:'categories_level'], :multi) if !opts[:'categories_level'].nil?
      form_params["entities.title.text[]"] = @api_client.build_collection_param(opts[:'entities_title_text'], :multi) if !opts[:'entities_title_text'].nil?
      form_params["entities.title.type[]"] = @api_client.build_collection_param(opts[:'entities_title_type'], :multi) if !opts[:'entities_title_type'].nil?
      form_params["entities.title.links.dbpedia[]"] = @api_client.build_collection_param(opts[:'entities_title_links_dbpedia'], :multi) if !opts[:'entities_title_links_dbpedia'].nil?
      form_params["entities.body.text[]"] = @api_client.build_collection_param(opts[:'entities_body_text'], :multi) if !opts[:'entities_body_text'].nil?
      form_params["entities.body.type[]"] = @api_client.build_collection_param(opts[:'entities_body_type'], :multi) if !opts[:'entities_body_type'].nil?
      form_params["entities.body.links.dbpedia[]"] = @api_client.build_collection_param(opts[:'entities_body_links_dbpedia'], :multi) if !opts[:'entities_body_links_dbpedia'].nil?
      form_params["sentiment.title.polarity"] = opts[:'sentiment_title_polarity'] if !opts[:'sentiment_title_polarity'].nil?
      form_params["sentiment.body.polarity"] = opts[:'sentiment_body_polarity'] if !opts[:'sentiment_body_polarity'].nil?
      form_params["media.images.count.min"] = opts[:'media_images_count_min'] if !opts[:'media_images_count_min'].nil?
      form_params["media.images.count.max"] = opts[:'media_images_count_max'] if !opts[:'media_images_count_max'].nil?
      form_params["media.videos.count.min"] = opts[:'media_videos_count_min'] if !opts[:'media_videos_count_min'].nil?
      form_params["media.videos.count.max"] = opts[:'media_videos_count_max'] if !opts[:'media_videos_count_max'].nil?
      form_params["author.id[]"] = @api_client.build_collection_param(opts[:'author_id'], :multi) if !opts[:'author_id'].nil?
      form_params["author.name"] = opts[:'author_name'] if !opts[:'author_name'].nil?
      form_params["source.id[]"] = @api_client.build_collection_param(opts[:'source_id'], :multi) if !opts[:'source_id'].nil?
      form_params["source.name[]"] = @api_client.build_collection_param(opts[:'source_name'], :multi) if !opts[:'source_name'].nil?
      form_params["source.domain[]"] = @api_client.build_collection_param(opts[:'source_domain'], :multi) if !opts[:'source_domain'].nil?
      form_params["source.locations.country[]"] = @api_client.build_collection_param(opts[:'source_locations_country'], :multi) if !opts[:'source_locations_country'].nil?
      form_params["source.locations.state[]"] = @api_client.build_collection_param(opts[:'source_locations_state'], :multi) if !opts[:'source_locations_state'].nil?
      form_params["source.locations.city[]"] = @api_client.build_collection_param(opts[:'source_locations_city'], :multi) if !opts[:'source_locations_city'].nil?
      form_params["source.scopes.country[]"] = @api_client.build_collection_param(opts[:'source_scopes_country'], :multi) if !opts[:'source_scopes_country'].nil?
      form_params["source.scopes.state[]"] = @api_client.build_collection_param(opts[:'source_scopes_state'], :multi) if !opts[:'source_scopes_state'].nil?
      form_params["source.scopes.city[]"] = @api_client.build_collection_param(opts[:'source_scopes_city'], :multi) if !opts[:'source_scopes_city'].nil?
      form_params["source.scopes.level[]"] = @api_client.build_collection_param(opts[:'source_scopes_level'], :multi) if !opts[:'source_scopes_level'].nil?
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
    # @option opts [Array<Integer>] :id This parameter is used for finding stroies by story id.
    # @option opts [String] :title This parameter is used for finding stories whose title contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
    # @option opts [String] :body This parameter is used for finding stories whose body contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
    # @option opts [String] :text This parameter is used for finding stories whose title or body contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
    # @option opts [Array<String>] :language This parameter is used for finding stories whose language is the specified value. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes.
    # @option opts [String] :published_at_start This parameter is used for finding stories whose published at time is greater than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates).
    # @option opts [String] :published_at_end This parameter is used for finding stories whose published at time is less than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates).
    # @option opts [String] :categories_taxonomy This parameter is used for defining the type of the taxonomy for the rest of the categories queries.
    # @option opts [BOOLEAN] :categories_confident This parameter is used for finding stories whose categories are confident. (default to true)
    # @option opts [Array<String>] :categories_id This parameter is used for finding stories by categories id.
    # @option opts [Array<Integer>] :categories_level This parameter is used for finding stories by categories level.
    # @option opts [Array<String>] :entities_title_text This parameter is used to find stories based on the specified entities &#x60;text&#x60; in story titles.
    # @option opts [Array<String>] :entities_title_type This parameter is used to find stories based on the specified entities &#x60;type&#x60; in story titles.
    # @option opts [Array<String>] :entities_title_links_dbpedia This parameter is used to find stories based on the specified entities dbpedia URL in story titles.
    # @option opts [Array<String>] :entities_body_text This parameter is used to find stories based on the specified entities &#x60;text&#x60; in the body of stories.
    # @option opts [Array<String>] :entities_body_type This parameter is used to find stories based on the specified entities &#x60;type&#x60; in the body of stories.
    # @option opts [Array<String>] :entities_body_links_dbpedia This parameter is used to find stories based on the specified entities dbpedia URL in the body of stories.
    # @option opts [String] :sentiment_title_polarity This parameter is used for finding stories whose title sentiment is the specified value.
    # @option opts [String] :sentiment_body_polarity This parameter is used for finding stories whose body sentiment is the specified value.
    # @option opts [Integer] :media_images_count_min This parameter is used for finding stories whose number of images is greater than or equal to the specified value.
    # @option opts [Integer] :media_images_count_max This parameter is used for finding stories whose number of images is less than or equal to the specified value.
    # @option opts [Integer] :media_videos_count_min This parameter is used for finding stories whose number of videos is greater than or equal to the specified value.
    # @option opts [Integer] :media_videos_count_max This parameter is used for finding stories whose number of videos is less than or equal to the specified value.
    # @option opts [Array<Integer>] :author_id This parameter is used for finding stories whose author id is the specified value.
    # @option opts [String] :author_name This parameter is used for finding stories whose author full name contains the specified value.
    # @option opts [Array<Integer>] :source_id This parameter is used for finding stories whose source id is the specified value.
    # @option opts [Array<String>] :source_name This parameter is used for finding stories whose source name contains the specified value.
    # @option opts [Array<String>] :source_domain This parameter is used for finding stories whose source domain is the specified value.
    # @option opts [Array<String>] :source_locations_country This parameter is used for finding stories whose source country is the specified value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_locations_state This parameter is used for finding stories whose source state/province is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_locations_city This parameter is used for finding stories whose source city is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_scopes_country This parameter is used for finding stories whose source scopes is the specified country value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_scopes_state This parameter is used for finding stories whose source scopes is the specified state/province value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_scopes_city This parameter is used for finding stories whose source scopes is the specified city value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_scopes_level This parameter is used for finding stories whose source scopes is the specified level value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
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
    # @option opts [Array<Integer>] :id This parameter is used for finding stroies by story id.
    # @option opts [String] :title This parameter is used for finding stories whose title contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
    # @option opts [String] :body This parameter is used for finding stories whose body contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
    # @option opts [String] :text This parameter is used for finding stories whose title or body contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
    # @option opts [Array<String>] :language This parameter is used for finding stories whose language is the specified value. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes.
    # @option opts [String] :published_at_start This parameter is used for finding stories whose published at time is greater than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates).
    # @option opts [String] :published_at_end This parameter is used for finding stories whose published at time is less than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates).
    # @option opts [String] :categories_taxonomy This parameter is used for defining the type of the taxonomy for the rest of the categories queries.
    # @option opts [BOOLEAN] :categories_confident This parameter is used for finding stories whose categories are confident.
    # @option opts [Array<String>] :categories_id This parameter is used for finding stories by categories id.
    # @option opts [Array<Integer>] :categories_level This parameter is used for finding stories by categories level.
    # @option opts [Array<String>] :entities_title_text This parameter is used to find stories based on the specified entities &#x60;text&#x60; in story titles.
    # @option opts [Array<String>] :entities_title_type This parameter is used to find stories based on the specified entities &#x60;type&#x60; in story titles.
    # @option opts [Array<String>] :entities_title_links_dbpedia This parameter is used to find stories based on the specified entities dbpedia URL in story titles.
    # @option opts [Array<String>] :entities_body_text This parameter is used to find stories based on the specified entities &#x60;text&#x60; in the body of stories.
    # @option opts [Array<String>] :entities_body_type This parameter is used to find stories based on the specified entities &#x60;type&#x60; in the body of stories.
    # @option opts [Array<String>] :entities_body_links_dbpedia This parameter is used to find stories based on the specified entities dbpedia URL in the body of stories.
    # @option opts [String] :sentiment_title_polarity This parameter is used for finding stories whose title sentiment is the specified value.
    # @option opts [String] :sentiment_body_polarity This parameter is used for finding stories whose body sentiment is the specified value.
    # @option opts [Integer] :media_images_count_min This parameter is used for finding stories whose number of images is greater than or equal to the specified value.
    # @option opts [Integer] :media_images_count_max This parameter is used for finding stories whose number of images is less than or equal to the specified value.
    # @option opts [Integer] :media_videos_count_min This parameter is used for finding stories whose number of videos is greater than or equal to the specified value.
    # @option opts [Integer] :media_videos_count_max This parameter is used for finding stories whose number of videos is less than or equal to the specified value.
    # @option opts [Array<Integer>] :author_id This parameter is used for finding stories whose author id is the specified value.
    # @option opts [String] :author_name This parameter is used for finding stories whose author full name contains the specified value.
    # @option opts [Array<Integer>] :source_id This parameter is used for finding stories whose source id is the specified value.
    # @option opts [Array<String>] :source_name This parameter is used for finding stories whose source name contains the specified value.
    # @option opts [Array<String>] :source_domain This parameter is used for finding stories whose source domain is the specified value.
    # @option opts [Array<String>] :source_locations_country This parameter is used for finding stories whose source country is the specified value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_locations_state This parameter is used for finding stories whose source state/province is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_locations_city This parameter is used for finding stories whose source city is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_scopes_country This parameter is used for finding stories whose source scopes is the specified country value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_scopes_state This parameter is used for finding stories whose source scopes is the specified state/province value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_scopes_city This parameter is used for finding stories whose source scopes is the specified city value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_scopes_level This parameter is used for finding stories whose source scopes is the specified level value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Integer] :interval_start This parameter is used for setting the start data point of histogram intervals.
    # @option opts [Integer] :interval_end This parameter is used for setting the end data point of histogram intervals.
    # @option opts [Integer] :interval_width This parameter is used for setting the width of histogram intervals.
    # @option opts [String] :field This parameter is used for specifying the y-axis variable for the histogram.
    # @return [Array<(Histograms, Fixnum, Hash)>] Histograms data, response status code and response headers
    def list_histograms_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: DefaultApi.list_histograms ..."
      end
      if opts[:'categories_taxonomy'] && !['iab-qag', 'iptc-subjectcode'].include?(opts[:'categories_taxonomy'])
        fail ArgumentError, 'invalid value for "categories_taxonomy", must be one of iab-qag, iptc-subjectcode'
      end
      if opts[:'sentiment_title_polarity'] && !['positive', 'neutral', 'negative'].include?(opts[:'sentiment_title_polarity'])
        fail ArgumentError, 'invalid value for "sentiment_title_polarity", must be one of positive, neutral, negative'
      end
      if opts[:'sentiment_body_polarity'] && !['positive', 'neutral', 'negative'].include?(opts[:'sentiment_body_polarity'])
        fail ArgumentError, 'invalid value for "sentiment_body_polarity", must be one of positive, neutral, negative'
      end

      if opts[:'field'] && !['social_shares_count', 'social_shares_count.facebook', 'social_shares_count.linkedin', 'social_shares_count.reddit', 'social_shares_count.google_plus', 'characters_count', 'words_count', 'sentences_count', 'paragraphs_count', 'media.images.count', 'media.videos.count'].include?(opts[:'field'])
        fail ArgumentError, 'invalid value for "field", must be one of social_shares_count, social_shares_count.facebook, social_shares_count.linkedin, social_shares_count.reddit, social_shares_count.google_plus, characters_count, words_count, sentences_count, paragraphs_count, media.images.count, media.videos.count'
      end
      # resource path
      local_var_path = "/histograms".sub('{format}','json')

      # query parameters
      query_params = {}
      query_params[:'id[]'] = @api_client.build_collection_param(opts[:'id'], :multi) if !opts[:'id'].nil?
      query_params[:'title'] = opts[:'title'] if !opts[:'title'].nil?
      query_params[:'body'] = opts[:'body'] if !opts[:'body'].nil?
      query_params[:'text'] = opts[:'text'] if !opts[:'text'].nil?
      query_params[:'language[]'] = @api_client.build_collection_param(opts[:'language'], :multi) if !opts[:'language'].nil?
      query_params[:'published_at.start'] = opts[:'published_at_start'] if !opts[:'published_at_start'].nil?
      query_params[:'published_at.end'] = opts[:'published_at_end'] if !opts[:'published_at_end'].nil?
      query_params[:'categories.taxonomy'] = opts[:'categories_taxonomy'] if !opts[:'categories_taxonomy'].nil?
      query_params[:'categories.confident'] = opts[:'categories_confident'] if !opts[:'categories_confident'].nil?
      query_params[:'categories.id[]'] = @api_client.build_collection_param(opts[:'categories_id'], :multi) if !opts[:'categories_id'].nil?
      query_params[:'categories.level[]'] = @api_client.build_collection_param(opts[:'categories_level'], :multi) if !opts[:'categories_level'].nil?
      query_params[:'entities.title.text[]'] = @api_client.build_collection_param(opts[:'entities_title_text'], :multi) if !opts[:'entities_title_text'].nil?
      query_params[:'entities.title.type[]'] = @api_client.build_collection_param(opts[:'entities_title_type'], :multi) if !opts[:'entities_title_type'].nil?
      query_params[:'entities.title.links.dbpedia[]'] = @api_client.build_collection_param(opts[:'entities_title_links_dbpedia'], :multi) if !opts[:'entities_title_links_dbpedia'].nil?
      query_params[:'entities.body.text[]'] = @api_client.build_collection_param(opts[:'entities_body_text'], :multi) if !opts[:'entities_body_text'].nil?
      query_params[:'entities.body.type[]'] = @api_client.build_collection_param(opts[:'entities_body_type'], :multi) if !opts[:'entities_body_type'].nil?
      query_params[:'entities.body.links.dbpedia[]'] = @api_client.build_collection_param(opts[:'entities_body_links_dbpedia'], :multi) if !opts[:'entities_body_links_dbpedia'].nil?
      query_params[:'sentiment.title.polarity'] = opts[:'sentiment_title_polarity'] if !opts[:'sentiment_title_polarity'].nil?
      query_params[:'sentiment.body.polarity'] = opts[:'sentiment_body_polarity'] if !opts[:'sentiment_body_polarity'].nil?
      query_params[:'media.images.count.min'] = opts[:'media_images_count_min'] if !opts[:'media_images_count_min'].nil?
      query_params[:'media.images.count.max'] = opts[:'media_images_count_max'] if !opts[:'media_images_count_max'].nil?
      query_params[:'media.videos.count.min'] = opts[:'media_videos_count_min'] if !opts[:'media_videos_count_min'].nil?
      query_params[:'media.videos.count.max'] = opts[:'media_videos_count_max'] if !opts[:'media_videos_count_max'].nil?
      query_params[:'author.id[]'] = @api_client.build_collection_param(opts[:'author_id'], :multi) if !opts[:'author_id'].nil?
      query_params[:'author.name'] = opts[:'author_name'] if !opts[:'author_name'].nil?
      query_params[:'source.id[]'] = @api_client.build_collection_param(opts[:'source_id'], :multi) if !opts[:'source_id'].nil?
      query_params[:'source.name[]'] = @api_client.build_collection_param(opts[:'source_name'], :multi) if !opts[:'source_name'].nil?
      query_params[:'source.domain[]'] = @api_client.build_collection_param(opts[:'source_domain'], :multi) if !opts[:'source_domain'].nil?
      query_params[:'source.locations.country[]'] = @api_client.build_collection_param(opts[:'source_locations_country'], :multi) if !opts[:'source_locations_country'].nil?
      query_params[:'source.locations.state[]'] = @api_client.build_collection_param(opts[:'source_locations_state'], :multi) if !opts[:'source_locations_state'].nil?
      query_params[:'source.locations.city[]'] = @api_client.build_collection_param(opts[:'source_locations_city'], :multi) if !opts[:'source_locations_city'].nil?
      query_params[:'source.scopes.country[]'] = @api_client.build_collection_param(opts[:'source_scopes_country'], :multi) if !opts[:'source_scopes_country'].nil?
      query_params[:'source.scopes.state[]'] = @api_client.build_collection_param(opts[:'source_scopes_state'], :multi) if !opts[:'source_scopes_state'].nil?
      query_params[:'source.scopes.city[]'] = @api_client.build_collection_param(opts[:'source_scopes_city'], :multi) if !opts[:'source_scopes_city'].nil?
      query_params[:'source.scopes.level[]'] = @api_client.build_collection_param(opts[:'source_scopes_level'], :multi) if !opts[:'source_scopes_level'].nil?
      query_params[:'interval.start'] = opts[:'interval_start'] if !opts[:'interval_start'].nil?
      query_params[:'interval.end'] = opts[:'interval_end'] if !opts[:'interval_end'].nil?
      query_params[:'interval.width'] = opts[:'interval_width'] if !opts[:'interval_width'].nil?
      query_params[:'field'] = opts[:'field'] if !opts[:'field'].nil?

      # header parameters
      header_params = {}

      # HTTP header 'Accept' (if needed)
      local_header_accept = ['application/json', 'text/xml']
      local_header_accept_result = @api_client.select_header_accept(local_header_accept) and header_params['Accept'] = local_header_accept_result

      # HTTP header 'Content-Type'
      local_header_content_type = ['application/x-www-form-urlencoded']
      header_params['Content-Type'] = @api_client.select_header_content_type(local_header_content_type)

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
    # @option opts [Array<Integer>] :id This parameter is used for finding stroies by story id.
    # @option opts [String] :title This parameter is used for finding stories whose title contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
    # @option opts [String] :body This parameter is used for finding stories whose body contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
    # @option opts [String] :text This parameter is used for finding stories whose title or body contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
    # @option opts [Array<String>] :language This parameter is used for finding stories whose language is the specified value. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes.
    # @option opts [String] :published_at_start This parameter is used for finding stories whose published at time is greater than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates).
    # @option opts [String] :published_at_end This parameter is used for finding stories whose published at time is less than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates).
    # @option opts [String] :categories_taxonomy This parameter is used for defining the type of the taxonomy for the rest of the categories queries.
    # @option opts [BOOLEAN] :categories_confident This parameter is used for finding stories whose categories are confident. (default to true)
    # @option opts [Array<String>] :categories_id This parameter is used for finding stories by categories id.
    # @option opts [Array<Integer>] :categories_level This parameter is used for finding stories by categories level.
    # @option opts [Array<String>] :entities_title_text This parameter is used to find stories based on the specified entities &#x60;text&#x60; in story titles.
    # @option opts [Array<String>] :entities_title_type This parameter is used to find stories based on the specified entities &#x60;type&#x60; in story titles.
    # @option opts [Array<String>] :entities_title_links_dbpedia This parameter is used to find stories based on the specified entities dbpedia URL in story titles.
    # @option opts [Array<String>] :entities_body_text This parameter is used to find stories based on the specified entities &#x60;text&#x60; in the body of stories.
    # @option opts [Array<String>] :entities_body_type This parameter is used to find stories based on the specified entities &#x60;type&#x60; in the body of stories.
    # @option opts [Array<String>] :entities_body_links_dbpedia This parameter is used to find stories based on the specified entities dbpedia URL in the body of stories.
    # @option opts [String] :sentiment_title_polarity This parameter is used for finding stories whose title sentiment is the specified value.
    # @option opts [String] :sentiment_body_polarity This parameter is used for finding stories whose body sentiment is the specified value.
    # @option opts [Integer] :media_images_count_min This parameter is used for finding stories whose number of images is greater than or equal to the specified value.
    # @option opts [Integer] :media_images_count_max This parameter is used for finding stories whose number of images is less than or equal to the specified value.
    # @option opts [Integer] :media_videos_count_min This parameter is used for finding stories whose number of videos is greater than or equal to the specified value.
    # @option opts [Integer] :media_videos_count_max This parameter is used for finding stories whose number of videos is less than or equal to the specified value.
    # @option opts [Array<Integer>] :author_id This parameter is used for finding stories whose author id is the specified value.
    # @option opts [String] :author_name This parameter is used for finding stories whose author full name contains the specified value.
    # @option opts [Array<Integer>] :source_id This parameter is used for finding stories whose source id is the specified value.
    # @option opts [Array<String>] :source_name This parameter is used for finding stories whose source name contains the specified value.
    # @option opts [Array<String>] :source_domain This parameter is used for finding stories whose source domain is the specified value.
    # @option opts [Array<String>] :source_locations_country This parameter is used for finding stories whose source country is the specified value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_locations_state This parameter is used for finding stories whose source state/province is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_locations_city This parameter is used for finding stories whose source city is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_scopes_country This parameter is used for finding stories whose source scopes  is the specified country value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_scopes_state This parameter is used for finding stories whose source scopes is the specified state/province value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_scopes_city This parameter is used for finding stories whose source scopes is the specified city value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_scopes_level This parameter is used for finding stories whose source scopes  is the specified level value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [BOOLEAN] :cluster This parameter enables clustering for the returned stories. (default to false)
    # @option opts [String] :cluster_algorithm This parameter is used for specifying the clustering algorithm you wish to use. It supprts STC, Lingo and [k-means](https://en.wikipedia.org/wiki/K-means_clustering) algorithms. (default to lingo)
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
    # @option opts [Array<Integer>] :id This parameter is used for finding stroies by story id.
    # @option opts [String] :title This parameter is used for finding stories whose title contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
    # @option opts [String] :body This parameter is used for finding stories whose body contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
    # @option opts [String] :text This parameter is used for finding stories whose title or body contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
    # @option opts [Array<String>] :language This parameter is used for finding stories whose language is the specified value. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes.
    # @option opts [String] :published_at_start This parameter is used for finding stories whose published at time is greater than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates).
    # @option opts [String] :published_at_end This parameter is used for finding stories whose published at time is less than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates).
    # @option opts [String] :categories_taxonomy This parameter is used for defining the type of the taxonomy for the rest of the categories queries.
    # @option opts [BOOLEAN] :categories_confident This parameter is used for finding stories whose categories are confident.
    # @option opts [Array<String>] :categories_id This parameter is used for finding stories by categories id.
    # @option opts [Array<Integer>] :categories_level This parameter is used for finding stories by categories level.
    # @option opts [Array<String>] :entities_title_text This parameter is used to find stories based on the specified entities &#x60;text&#x60; in story titles.
    # @option opts [Array<String>] :entities_title_type This parameter is used to find stories based on the specified entities &#x60;type&#x60; in story titles.
    # @option opts [Array<String>] :entities_title_links_dbpedia This parameter is used to find stories based on the specified entities dbpedia URL in story titles.
    # @option opts [Array<String>] :entities_body_text This parameter is used to find stories based on the specified entities &#x60;text&#x60; in the body of stories.
    # @option opts [Array<String>] :entities_body_type This parameter is used to find stories based on the specified entities &#x60;type&#x60; in the body of stories.
    # @option opts [Array<String>] :entities_body_links_dbpedia This parameter is used to find stories based on the specified entities dbpedia URL in the body of stories.
    # @option opts [String] :sentiment_title_polarity This parameter is used for finding stories whose title sentiment is the specified value.
    # @option opts [String] :sentiment_body_polarity This parameter is used for finding stories whose body sentiment is the specified value.
    # @option opts [Integer] :media_images_count_min This parameter is used for finding stories whose number of images is greater than or equal to the specified value.
    # @option opts [Integer] :media_images_count_max This parameter is used for finding stories whose number of images is less than or equal to the specified value.
    # @option opts [Integer] :media_videos_count_min This parameter is used for finding stories whose number of videos is greater than or equal to the specified value.
    # @option opts [Integer] :media_videos_count_max This parameter is used for finding stories whose number of videos is less than or equal to the specified value.
    # @option opts [Array<Integer>] :author_id This parameter is used for finding stories whose author id is the specified value.
    # @option opts [String] :author_name This parameter is used for finding stories whose author full name contains the specified value.
    # @option opts [Array<Integer>] :source_id This parameter is used for finding stories whose source id is the specified value.
    # @option opts [Array<String>] :source_name This parameter is used for finding stories whose source name contains the specified value.
    # @option opts [Array<String>] :source_domain This parameter is used for finding stories whose source domain is the specified value.
    # @option opts [Array<String>] :source_locations_country This parameter is used for finding stories whose source country is the specified value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_locations_state This parameter is used for finding stories whose source state/province is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_locations_city This parameter is used for finding stories whose source city is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_scopes_country This parameter is used for finding stories whose source scopes  is the specified country value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_scopes_state This parameter is used for finding stories whose source scopes is the specified state/province value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_scopes_city This parameter is used for finding stories whose source scopes is the specified city value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_scopes_level This parameter is used for finding stories whose source scopes  is the specified level value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [BOOLEAN] :cluster This parameter enables clustering for the returned stories.
    # @option opts [String] :cluster_algorithm This parameter is used for specifying the clustering algorithm you wish to use. It supprts STC, Lingo and [k-means](https://en.wikipedia.org/wiki/K-means_clustering) algorithms.
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
      if opts[:'categories_taxonomy'] && !['iab-qag', 'iptc-subjectcode'].include?(opts[:'categories_taxonomy'])
        fail ArgumentError, 'invalid value for "categories_taxonomy", must be one of iab-qag, iptc-subjectcode'
      end
      if opts[:'sentiment_title_polarity'] && !['positive', 'neutral', 'negative'].include?(opts[:'sentiment_title_polarity'])
        fail ArgumentError, 'invalid value for "sentiment_title_polarity", must be one of positive, neutral, negative'
      end
      if opts[:'sentiment_body_polarity'] && !['positive', 'neutral', 'negative'].include?(opts[:'sentiment_body_polarity'])
        fail ArgumentError, 'invalid value for "sentiment_body_polarity", must be one of positive, neutral, negative'
      end

      if opts[:'cluster_algorithm'] && !['stc', 'lingo', 'kmeans'].include?(opts[:'cluster_algorithm'])
        fail ArgumentError, 'invalid value for "cluster_algorithm", must be one of stc, lingo, kmeans'
      end
      if opts[:'boost_by'] && !['recency', 'popularity'].include?(opts[:'boost_by'])
        fail ArgumentError, 'invalid value for "boost_by", must be one of recency, popularity'
      end
      if opts[:'story_language'] && !['auto', 'en', 'de', 'fr', 'it', 'es', 'pt'].include?(opts[:'story_language'])
        fail ArgumentError, 'invalid value for "story_language", must be one of auto, en, de, fr, it, es, pt'
      end

      # resource path
      local_var_path = "/related_stories".sub('{format}','json')

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}

      # HTTP header 'Accept' (if needed)
      local_header_accept = ['application/json', 'text/xml']
      local_header_accept_result = @api_client.select_header_accept(local_header_accept) and header_params['Accept'] = local_header_accept_result

      # HTTP header 'Content-Type'
      local_header_content_type = ['application/x-www-form-urlencoded']
      header_params['Content-Type'] = @api_client.select_header_content_type(local_header_content_type)

      # form parameters
      form_params = {}
      form_params["id[]"] = @api_client.build_collection_param(opts[:'id'], :multi) if !opts[:'id'].nil?
      form_params["title"] = opts[:'title'] if !opts[:'title'].nil?
      form_params["body"] = opts[:'body'] if !opts[:'body'].nil?
      form_params["text"] = opts[:'text'] if !opts[:'text'].nil?
      form_params["language[]"] = @api_client.build_collection_param(opts[:'language'], :multi) if !opts[:'language'].nil?
      form_params["published_at.start"] = opts[:'published_at_start'] if !opts[:'published_at_start'].nil?
      form_params["published_at.end"] = opts[:'published_at_end'] if !opts[:'published_at_end'].nil?
      form_params["categories.taxonomy"] = opts[:'categories_taxonomy'] if !opts[:'categories_taxonomy'].nil?
      form_params["categories.confident"] = opts[:'categories_confident'] if !opts[:'categories_confident'].nil?
      form_params["categories.id[]"] = @api_client.build_collection_param(opts[:'categories_id'], :multi) if !opts[:'categories_id'].nil?
      form_params["categories.level[]"] = @api_client.build_collection_param(opts[:'categories_level'], :multi) if !opts[:'categories_level'].nil?
      form_params["entities.title.text[]"] = @api_client.build_collection_param(opts[:'entities_title_text'], :multi) if !opts[:'entities_title_text'].nil?
      form_params["entities.title.type[]"] = @api_client.build_collection_param(opts[:'entities_title_type'], :multi) if !opts[:'entities_title_type'].nil?
      form_params["entities.title.links.dbpedia[]"] = @api_client.build_collection_param(opts[:'entities_title_links_dbpedia'], :multi) if !opts[:'entities_title_links_dbpedia'].nil?
      form_params["entities.body.text[]"] = @api_client.build_collection_param(opts[:'entities_body_text'], :multi) if !opts[:'entities_body_text'].nil?
      form_params["entities.body.type[]"] = @api_client.build_collection_param(opts[:'entities_body_type'], :multi) if !opts[:'entities_body_type'].nil?
      form_params["entities.body.links.dbpedia[]"] = @api_client.build_collection_param(opts[:'entities_body_links_dbpedia'], :multi) if !opts[:'entities_body_links_dbpedia'].nil?
      form_params["sentiment.title.polarity"] = opts[:'sentiment_title_polarity'] if !opts[:'sentiment_title_polarity'].nil?
      form_params["sentiment.body.polarity"] = opts[:'sentiment_body_polarity'] if !opts[:'sentiment_body_polarity'].nil?
      form_params["media.images.count.min"] = opts[:'media_images_count_min'] if !opts[:'media_images_count_min'].nil?
      form_params["media.images.count.max"] = opts[:'media_images_count_max'] if !opts[:'media_images_count_max'].nil?
      form_params["media.videos.count.min"] = opts[:'media_videos_count_min'] if !opts[:'media_videos_count_min'].nil?
      form_params["media.videos.count.max"] = opts[:'media_videos_count_max'] if !opts[:'media_videos_count_max'].nil?
      form_params["author.id[]"] = @api_client.build_collection_param(opts[:'author_id'], :multi) if !opts[:'author_id'].nil?
      form_params["author.name"] = opts[:'author_name'] if !opts[:'author_name'].nil?
      form_params["source.id[]"] = @api_client.build_collection_param(opts[:'source_id'], :multi) if !opts[:'source_id'].nil?
      form_params["source.name[]"] = @api_client.build_collection_param(opts[:'source_name'], :multi) if !opts[:'source_name'].nil?
      form_params["source.domain[]"] = @api_client.build_collection_param(opts[:'source_domain'], :multi) if !opts[:'source_domain'].nil?
      form_params["source.locations.country[]"] = @api_client.build_collection_param(opts[:'source_locations_country'], :multi) if !opts[:'source_locations_country'].nil?
      form_params["source.locations.state[]"] = @api_client.build_collection_param(opts[:'source_locations_state'], :multi) if !opts[:'source_locations_state'].nil?
      form_params["source.locations.city[]"] = @api_client.build_collection_param(opts[:'source_locations_city'], :multi) if !opts[:'source_locations_city'].nil?
      form_params["source.scopes.country[]"] = @api_client.build_collection_param(opts[:'source_scopes_country'], :multi) if !opts[:'source_scopes_country'].nil?
      form_params["source.scopes.state[]"] = @api_client.build_collection_param(opts[:'source_scopes_state'], :multi) if !opts[:'source_scopes_state'].nil?
      form_params["source.scopes.city[]"] = @api_client.build_collection_param(opts[:'source_scopes_city'], :multi) if !opts[:'source_scopes_city'].nil?
      form_params["source.scopes.level[]"] = @api_client.build_collection_param(opts[:'source_scopes_level'], :multi) if !opts[:'source_scopes_level'].nil?
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
    # @option opts [Array<Integer>] :id This parameter is used for finding stroies by story id.
    # @option opts [String] :title This parameter is used for finding stories whose title contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
    # @option opts [String] :body This parameter is used for finding stories whose body contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
    # @option opts [String] :text This parameter is used for finding stories whose title or body contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
    # @option opts [Array<String>] :language This parameter is used for finding stories whose language is the specified value. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes.
    # @option opts [String] :published_at_start This parameter is used for finding stories whose published at time is greater than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates).
    # @option opts [String] :published_at_end This parameter is used for finding stories whose published at time is less than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates).
    # @option opts [String] :categories_taxonomy This parameter is used for defining the type of the taxonomy for the rest of the categories queries.
    # @option opts [BOOLEAN] :categories_confident This parameter is used for finding stories whose categories are confident. (default to true)
    # @option opts [Array<String>] :categories_id This parameter is used for finding stories by categories id.
    # @option opts [Array<Integer>] :categories_level This parameter is used for finding stories by categories level.
    # @option opts [Array<String>] :entities_title_text This parameter is used to find stories based on the specified entities &#x60;text&#x60; in story titles.
    # @option opts [Array<String>] :entities_title_type This parameter is used to find stories based on the specified entities &#x60;type&#x60; in story titles.
    # @option opts [Array<String>] :entities_title_links_dbpedia This parameter is used to find stories based on the specified entities dbpedia URL in story titles.
    # @option opts [Array<String>] :entities_body_text This parameter is used to find stories based on the specified entities &#x60;text&#x60; in the body of stories.
    # @option opts [Array<String>] :entities_body_type This parameter is used to find stories based on the specified entities &#x60;type&#x60; in the body of stories.
    # @option opts [Array<String>] :entities_body_links_dbpedia This parameter is used to find stories based on the specified entities dbpedia URL in the body of stories.
    # @option opts [String] :sentiment_title_polarity This parameter is used for finding stories whose title sentiment is the specified value.
    # @option opts [String] :sentiment_body_polarity This parameter is used for finding stories whose body sentiment is the specified value.
    # @option opts [Integer] :media_images_count_min This parameter is used for finding stories whose number of images is greater than or equal to the specified value.
    # @option opts [Integer] :media_images_count_max This parameter is used for finding stories whose number of images is less than or equal to the specified value.
    # @option opts [Integer] :media_videos_count_min This parameter is used for finding stories whose number of videos is greater than or equal to the specified value.
    # @option opts [Integer] :media_videos_count_max This parameter is used for finding stories whose number of videos is less than or equal to the specified value.
    # @option opts [Array<Integer>] :author_id This parameter is used for finding stories whose author id is the specified value.
    # @option opts [String] :author_name This parameter is used for finding stories whose author full name contains the specified value.
    # @option opts [Array<Integer>] :source_id This parameter is used for finding stories whose source id is the specified value.
    # @option opts [Array<String>] :source_name This parameter is used for finding stories whose source name contains the specified value.
    # @option opts [Array<String>] :source_domain This parameter is used for finding stories whose source domain is the specified value.
    # @option opts [Array<String>] :source_locations_country This parameter is used for finding stories whose source country is the specified value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_locations_state This parameter is used for finding stories whose source state/province is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_locations_city This parameter is used for finding stories whose source city is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_scopes_country This parameter is used for finding stories whose source scopes is the specified country value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_scopes_state This parameter is used for finding stories whose source scopes is the specified state/province value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_scopes_city This parameter is used for finding stories whose source scopes is the specified city value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_scopes_level This parameter is used for finding stories whose source scopes is the specified level value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [BOOLEAN] :cluster This parameter enables clustering for the returned stories. (default to false)
    # @option opts [String] :cluster_algorithm This parameter is used for specifying the clustering algorithm you wish to use. It supprts STC, Lingo and [k-means](https://en.wikipedia.org/wiki/K-means_clustering) algorithms. (default to lingo)
    # @option opts [Array<String>] :_return This parameter is used for specifying return fields.
    # @option opts [String] :sort_by This parameter is used for changing the order column of the results. (default to published_at)
    # @option opts [String] :sort_direction This parameter is used for changing the order direction of the result. (default to desc)
    # @option opts [String] :cursor This parameter is used for finding a specific page. (default to *)
    # @option opts [Integer] :per_page This parameter is used for specifying number of items in each page. (default to 10)
    # @return [Stories]
    def list_stories(opts = {})
      data, _status_code, _headers = list_stories_with_http_info(opts)
      return data
    end

    # List Stories
    # This endpoint is used for getting a list of stories.
    # @param [Hash] opts the optional parameters
    # @option opts [Array<Integer>] :id This parameter is used for finding stroies by story id.
    # @option opts [String] :title This parameter is used for finding stories whose title contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
    # @option opts [String] :body This parameter is used for finding stories whose body contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
    # @option opts [String] :text This parameter is used for finding stories whose title or body contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
    # @option opts [Array<String>] :language This parameter is used for finding stories whose language is the specified value. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes.
    # @option opts [String] :published_at_start This parameter is used for finding stories whose published at time is greater than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates).
    # @option opts [String] :published_at_end This parameter is used for finding stories whose published at time is less than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates).
    # @option opts [String] :categories_taxonomy This parameter is used for defining the type of the taxonomy for the rest of the categories queries.
    # @option opts [BOOLEAN] :categories_confident This parameter is used for finding stories whose categories are confident.
    # @option opts [Array<String>] :categories_id This parameter is used for finding stories by categories id.
    # @option opts [Array<Integer>] :categories_level This parameter is used for finding stories by categories level.
    # @option opts [Array<String>] :entities_title_text This parameter is used to find stories based on the specified entities &#x60;text&#x60; in story titles.
    # @option opts [Array<String>] :entities_title_type This parameter is used to find stories based on the specified entities &#x60;type&#x60; in story titles.
    # @option opts [Array<String>] :entities_title_links_dbpedia This parameter is used to find stories based on the specified entities dbpedia URL in story titles.
    # @option opts [Array<String>] :entities_body_text This parameter is used to find stories based on the specified entities &#x60;text&#x60; in the body of stories.
    # @option opts [Array<String>] :entities_body_type This parameter is used to find stories based on the specified entities &#x60;type&#x60; in the body of stories.
    # @option opts [Array<String>] :entities_body_links_dbpedia This parameter is used to find stories based on the specified entities dbpedia URL in the body of stories.
    # @option opts [String] :sentiment_title_polarity This parameter is used for finding stories whose title sentiment is the specified value.
    # @option opts [String] :sentiment_body_polarity This parameter is used for finding stories whose body sentiment is the specified value.
    # @option opts [Integer] :media_images_count_min This parameter is used for finding stories whose number of images is greater than or equal to the specified value.
    # @option opts [Integer] :media_images_count_max This parameter is used for finding stories whose number of images is less than or equal to the specified value.
    # @option opts [Integer] :media_videos_count_min This parameter is used for finding stories whose number of videos is greater than or equal to the specified value.
    # @option opts [Integer] :media_videos_count_max This parameter is used for finding stories whose number of videos is less than or equal to the specified value.
    # @option opts [Array<Integer>] :author_id This parameter is used for finding stories whose author id is the specified value.
    # @option opts [String] :author_name This parameter is used for finding stories whose author full name contains the specified value.
    # @option opts [Array<Integer>] :source_id This parameter is used for finding stories whose source id is the specified value.
    # @option opts [Array<String>] :source_name This parameter is used for finding stories whose source name contains the specified value.
    # @option opts [Array<String>] :source_domain This parameter is used for finding stories whose source domain is the specified value.
    # @option opts [Array<String>] :source_locations_country This parameter is used for finding stories whose source country is the specified value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_locations_state This parameter is used for finding stories whose source state/province is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_locations_city This parameter is used for finding stories whose source city is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_scopes_country This parameter is used for finding stories whose source scopes is the specified country value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_scopes_state This parameter is used for finding stories whose source scopes is the specified state/province value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_scopes_city This parameter is used for finding stories whose source scopes is the specified city value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_scopes_level This parameter is used for finding stories whose source scopes is the specified level value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [BOOLEAN] :cluster This parameter enables clustering for the returned stories.
    # @option opts [String] :cluster_algorithm This parameter is used for specifying the clustering algorithm you wish to use. It supprts STC, Lingo and [k-means](https://en.wikipedia.org/wiki/K-means_clustering) algorithms.
    # @option opts [Array<String>] :_return This parameter is used for specifying return fields.
    # @option opts [String] :sort_by This parameter is used for changing the order column of the results.
    # @option opts [String] :sort_direction This parameter is used for changing the order direction of the result.
    # @option opts [String] :cursor This parameter is used for finding a specific page.
    # @option opts [Integer] :per_page This parameter is used for specifying number of items in each page.
    # @return [Array<(Stories, Fixnum, Hash)>] Stories data, response status code and response headers
    def list_stories_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: DefaultApi.list_stories ..."
      end
      if opts[:'categories_taxonomy'] && !['iab-qag', 'iptc-subjectcode'].include?(opts[:'categories_taxonomy'])
        fail ArgumentError, 'invalid value for "categories_taxonomy", must be one of iab-qag, iptc-subjectcode'
      end
      if opts[:'sentiment_title_polarity'] && !['positive', 'neutral', 'negative'].include?(opts[:'sentiment_title_polarity'])
        fail ArgumentError, 'invalid value for "sentiment_title_polarity", must be one of positive, neutral, negative'
      end
      if opts[:'sentiment_body_polarity'] && !['positive', 'neutral', 'negative'].include?(opts[:'sentiment_body_polarity'])
        fail ArgumentError, 'invalid value for "sentiment_body_polarity", must be one of positive, neutral, negative'
      end

      if opts[:'cluster_algorithm'] && !['stc', 'lingo', 'kmeans'].include?(opts[:'cluster_algorithm'])
        fail ArgumentError, 'invalid value for "cluster_algorithm", must be one of stc, lingo, kmeans'
      end
      if opts[:'sort_by'] && !['relevance', 'recency', 'hotness', 'published_at', 'social_shares_count', 'social_shares_count.facebook', 'social_shares_count.linkedin', 'social_shares_count.google_plus', 'social_shares_count.reddit', 'media.images.count', 'media.videos.count'].include?(opts[:'sort_by'])
        fail ArgumentError, 'invalid value for "sort_by", must be one of relevance, recency, hotness, published_at, social_shares_count, social_shares_count.facebook, social_shares_count.linkedin, social_shares_count.google_plus, social_shares_count.reddit, media.images.count, media.videos.count'
      end
      if opts[:'sort_direction'] && !['asc', 'desc'].include?(opts[:'sort_direction'])
        fail ArgumentError, 'invalid value for "sort_direction", must be one of asc, desc'
      end

      # resource path
      local_var_path = "/stories".sub('{format}','json')

      # query parameters
      query_params = {}
      query_params[:'id[]'] = @api_client.build_collection_param(opts[:'id'], :multi) if !opts[:'id'].nil?
      query_params[:'title'] = opts[:'title'] if !opts[:'title'].nil?
      query_params[:'body'] = opts[:'body'] if !opts[:'body'].nil?
      query_params[:'text'] = opts[:'text'] if !opts[:'text'].nil?
      query_params[:'language[]'] = @api_client.build_collection_param(opts[:'language'], :multi) if !opts[:'language'].nil?
      query_params[:'published_at.start'] = opts[:'published_at_start'] if !opts[:'published_at_start'].nil?
      query_params[:'published_at.end'] = opts[:'published_at_end'] if !opts[:'published_at_end'].nil?
      query_params[:'categories.taxonomy'] = opts[:'categories_taxonomy'] if !opts[:'categories_taxonomy'].nil?
      query_params[:'categories.confident'] = opts[:'categories_confident'] if !opts[:'categories_confident'].nil?
      query_params[:'categories.id[]'] = @api_client.build_collection_param(opts[:'categories_id'], :multi) if !opts[:'categories_id'].nil?
      query_params[:'categories.level[]'] = @api_client.build_collection_param(opts[:'categories_level'], :multi) if !opts[:'categories_level'].nil?
      query_params[:'entities.title.text[]'] = @api_client.build_collection_param(opts[:'entities_title_text'], :multi) if !opts[:'entities_title_text'].nil?
      query_params[:'entities.title.type[]'] = @api_client.build_collection_param(opts[:'entities_title_type'], :multi) if !opts[:'entities_title_type'].nil?
      query_params[:'entities.title.links.dbpedia[]'] = @api_client.build_collection_param(opts[:'entities_title_links_dbpedia'], :multi) if !opts[:'entities_title_links_dbpedia'].nil?
      query_params[:'entities.body.text[]'] = @api_client.build_collection_param(opts[:'entities_body_text'], :multi) if !opts[:'entities_body_text'].nil?
      query_params[:'entities.body.type[]'] = @api_client.build_collection_param(opts[:'entities_body_type'], :multi) if !opts[:'entities_body_type'].nil?
      query_params[:'entities.body.links.dbpedia[]'] = @api_client.build_collection_param(opts[:'entities_body_links_dbpedia'], :multi) if !opts[:'entities_body_links_dbpedia'].nil?
      query_params[:'sentiment.title.polarity'] = opts[:'sentiment_title_polarity'] if !opts[:'sentiment_title_polarity'].nil?
      query_params[:'sentiment.body.polarity'] = opts[:'sentiment_body_polarity'] if !opts[:'sentiment_body_polarity'].nil?
      query_params[:'media.images.count.min'] = opts[:'media_images_count_min'] if !opts[:'media_images_count_min'].nil?
      query_params[:'media.images.count.max'] = opts[:'media_images_count_max'] if !opts[:'media_images_count_max'].nil?
      query_params[:'media.videos.count.min'] = opts[:'media_videos_count_min'] if !opts[:'media_videos_count_min'].nil?
      query_params[:'media.videos.count.max'] = opts[:'media_videos_count_max'] if !opts[:'media_videos_count_max'].nil?
      query_params[:'author.id[]'] = @api_client.build_collection_param(opts[:'author_id'], :multi) if !opts[:'author_id'].nil?
      query_params[:'author.name'] = opts[:'author_name'] if !opts[:'author_name'].nil?
      query_params[:'source.id[]'] = @api_client.build_collection_param(opts[:'source_id'], :multi) if !opts[:'source_id'].nil?
      query_params[:'source.name[]'] = @api_client.build_collection_param(opts[:'source_name'], :multi) if !opts[:'source_name'].nil?
      query_params[:'source.domain[]'] = @api_client.build_collection_param(opts[:'source_domain'], :multi) if !opts[:'source_domain'].nil?
      query_params[:'source.locations.country[]'] = @api_client.build_collection_param(opts[:'source_locations_country'], :multi) if !opts[:'source_locations_country'].nil?
      query_params[:'source.locations.state[]'] = @api_client.build_collection_param(opts[:'source_locations_state'], :multi) if !opts[:'source_locations_state'].nil?
      query_params[:'source.locations.city[]'] = @api_client.build_collection_param(opts[:'source_locations_city'], :multi) if !opts[:'source_locations_city'].nil?
      query_params[:'source.scopes.country[]'] = @api_client.build_collection_param(opts[:'source_scopes_country'], :multi) if !opts[:'source_scopes_country'].nil?
      query_params[:'source.scopes.state[]'] = @api_client.build_collection_param(opts[:'source_scopes_state'], :multi) if !opts[:'source_scopes_state'].nil?
      query_params[:'source.scopes.city[]'] = @api_client.build_collection_param(opts[:'source_scopes_city'], :multi) if !opts[:'source_scopes_city'].nil?
      query_params[:'source.scopes.level[]'] = @api_client.build_collection_param(opts[:'source_scopes_level'], :multi) if !opts[:'source_scopes_level'].nil?
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
      local_header_accept = ['application/json', 'text/xml']
      local_header_accept_result = @api_client.select_header_accept(local_header_accept) and header_params['Accept'] = local_header_accept_result

      # HTTP header 'Content-Type'
      local_header_content_type = ['application/x-www-form-urlencoded']
      header_params['Content-Type'] = @api_client.select_header_content_type(local_header_content_type)

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
    # @option opts [Array<Integer>] :id This parameter is used for finding stroies by story id.
    # @option opts [String] :title This parameter is used for finding stories whose title contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
    # @option opts [String] :body This parameter is used for finding stories whose body contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
    # @option opts [String] :text This parameter is used for finding stories whose title or body contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
    # @option opts [Array<String>] :language This parameter is used for finding stories whose language is the specified value. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes.
    # @option opts [String] :categories_taxonomy This parameter is used for defining the type of the taxonomy for the rest of the categories queries.
    # @option opts [BOOLEAN] :categories_confident This parameter is used for finding stories whose categories are confident. (default to true)
    # @option opts [Array<String>] :categories_id This parameter is used for finding stories by categories id.
    # @option opts [Array<Integer>] :categories_level This parameter is used for finding stories by categories level.
    # @option opts [Array<String>] :entities_title_text This parameter is used to find stories based on the specified entities &#x60;text&#x60; in story titles.
    # @option opts [Array<String>] :entities_title_type This parameter is used to find stories based on the specified entities &#x60;type&#x60; in story titles.
    # @option opts [Array<String>] :entities_title_links_dbpedia This parameter is used to find stories based on the specified entities dbpedia URL in story titles.
    # @option opts [Array<String>] :entities_body_text This parameter is used to find stories based on the specified entities &#x60;text&#x60; in the body of stories.
    # @option opts [Array<String>] :entities_body_type This parameter is used to find stories based on the specified entities &#x60;type&#x60; in the body of stories.
    # @option opts [Array<String>] :entities_body_links_dbpedia This parameter is used to find stories based on the specified entities dbpedia URL in the body of stories.
    # @option opts [String] :sentiment_title_polarity This parameter is used for finding stories whose title sentiment is the specified value.
    # @option opts [String] :sentiment_body_polarity This parameter is used for finding stories whose body sentiment is the specified value.
    # @option opts [Integer] :media_images_count_min This parameter is used for finding stories whose number of images is greater than or equal to the specified value.
    # @option opts [Integer] :media_images_count_max This parameter is used for finding stories whose number of images is less than or equal to the specified value.
    # @option opts [Integer] :media_videos_count_min This parameter is used for finding stories whose number of videos is greater than or equal to the specified value.
    # @option opts [Integer] :media_videos_count_max This parameter is used for finding stories whose number of videos is less than or equal to the specified value.
    # @option opts [Array<Integer>] :author_id This parameter is used for finding stories whose author id is the specified value.
    # @option opts [String] :author_name This parameter is used for finding stories whose author full name contains the specified value.
    # @option opts [Array<Integer>] :source_id This parameter is used for finding stories whose source id is the specified value.
    # @option opts [Array<String>] :source_name This parameter is used for finding stories whose source name contains the specified value.
    # @option opts [Array<String>] :source_domain This parameter is used for finding stories whose source domain is the specified value.
    # @option opts [Array<String>] :source_locations_country This parameter is used for finding stories whose source country is the specified value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_locations_state This parameter is used for finding stories whose source state/province is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_locations_city This parameter is used for finding stories whose source city is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_scopes_country This parameter is used for finding stories whose source scopes is the specified country value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_scopes_state This parameter is used for finding stories whose source scopes is the specified state/province value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_scopes_city This parameter is used for finding stories whose source scopes is the specified city value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_scopes_level This parameter is used for finding stories whose source scopes is the specified level value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
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
    # @option opts [Array<Integer>] :id This parameter is used for finding stroies by story id.
    # @option opts [String] :title This parameter is used for finding stories whose title contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
    # @option opts [String] :body This parameter is used for finding stories whose body contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
    # @option opts [String] :text This parameter is used for finding stories whose title or body contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
    # @option opts [Array<String>] :language This parameter is used for finding stories whose language is the specified value. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes.
    # @option opts [String] :categories_taxonomy This parameter is used for defining the type of the taxonomy for the rest of the categories queries.
    # @option opts [BOOLEAN] :categories_confident This parameter is used for finding stories whose categories are confident.
    # @option opts [Array<String>] :categories_id This parameter is used for finding stories by categories id.
    # @option opts [Array<Integer>] :categories_level This parameter is used for finding stories by categories level.
    # @option opts [Array<String>] :entities_title_text This parameter is used to find stories based on the specified entities &#x60;text&#x60; in story titles.
    # @option opts [Array<String>] :entities_title_type This parameter is used to find stories based on the specified entities &#x60;type&#x60; in story titles.
    # @option opts [Array<String>] :entities_title_links_dbpedia This parameter is used to find stories based on the specified entities dbpedia URL in story titles.
    # @option opts [Array<String>] :entities_body_text This parameter is used to find stories based on the specified entities &#x60;text&#x60; in the body of stories.
    # @option opts [Array<String>] :entities_body_type This parameter is used to find stories based on the specified entities &#x60;type&#x60; in the body of stories.
    # @option opts [Array<String>] :entities_body_links_dbpedia This parameter is used to find stories based on the specified entities dbpedia URL in the body of stories.
    # @option opts [String] :sentiment_title_polarity This parameter is used for finding stories whose title sentiment is the specified value.
    # @option opts [String] :sentiment_body_polarity This parameter is used for finding stories whose body sentiment is the specified value.
    # @option opts [Integer] :media_images_count_min This parameter is used for finding stories whose number of images is greater than or equal to the specified value.
    # @option opts [Integer] :media_images_count_max This parameter is used for finding stories whose number of images is less than or equal to the specified value.
    # @option opts [Integer] :media_videos_count_min This parameter is used for finding stories whose number of videos is greater than or equal to the specified value.
    # @option opts [Integer] :media_videos_count_max This parameter is used for finding stories whose number of videos is less than or equal to the specified value.
    # @option opts [Array<Integer>] :author_id This parameter is used for finding stories whose author id is the specified value.
    # @option opts [String] :author_name This parameter is used for finding stories whose author full name contains the specified value.
    # @option opts [Array<Integer>] :source_id This parameter is used for finding stories whose source id is the specified value.
    # @option opts [Array<String>] :source_name This parameter is used for finding stories whose source name contains the specified value.
    # @option opts [Array<String>] :source_domain This parameter is used for finding stories whose source domain is the specified value.
    # @option opts [Array<String>] :source_locations_country This parameter is used for finding stories whose source country is the specified value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_locations_state This parameter is used for finding stories whose source state/province is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_locations_city This parameter is used for finding stories whose source city is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_scopes_country This parameter is used for finding stories whose source scopes is the specified country value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_scopes_state This parameter is used for finding stories whose source scopes is the specified state/province value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_scopes_city This parameter is used for finding stories whose source scopes is the specified city value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_scopes_level This parameter is used for finding stories whose source scopes is the specified level value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [String] :published_at_start This parameter is used for finding stories whose published at time is less than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates).
    # @option opts [String] :published_at_end This parameter is used for finding stories whose published at time is greater than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates).
    # @option opts [String] :period The size of each date range is expressed as an interval to be added to the lower bound. It supports Date Math Syntax. Valid options are &#x60;+&#x60; following an integer number greater than 0 and one of the Date Math keywords. e.g. &#x60;+1DAY&#x60;, &#x60;+2MINUTES&#x60; and &#x60;+1MONTH&#x60;. Here are [Supported keywords](https://newsapi.aylien.com/docs/working-with-dates#date-math).
    # @return [Array<(TimeSeriesList, Fixnum, Hash)>] TimeSeriesList data, response status code and response headers
    def list_time_series_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: DefaultApi.list_time_series ..."
      end
      if opts[:'categories_taxonomy'] && !['iab-qag', 'iptc-subjectcode'].include?(opts[:'categories_taxonomy'])
        fail ArgumentError, 'invalid value for "categories_taxonomy", must be one of iab-qag, iptc-subjectcode'
      end
      if opts[:'sentiment_title_polarity'] && !['positive', 'neutral', 'negative'].include?(opts[:'sentiment_title_polarity'])
        fail ArgumentError, 'invalid value for "sentiment_title_polarity", must be one of positive, neutral, negative'
      end
      if opts[:'sentiment_body_polarity'] && !['positive', 'neutral', 'negative'].include?(opts[:'sentiment_body_polarity'])
        fail ArgumentError, 'invalid value for "sentiment_body_polarity", must be one of positive, neutral, negative'
      end

      # resource path
      local_var_path = "/time_series".sub('{format}','json')

      # query parameters
      query_params = {}
      query_params[:'id[]'] = @api_client.build_collection_param(opts[:'id'], :multi) if !opts[:'id'].nil?
      query_params[:'title'] = opts[:'title'] if !opts[:'title'].nil?
      query_params[:'body'] = opts[:'body'] if !opts[:'body'].nil?
      query_params[:'text'] = opts[:'text'] if !opts[:'text'].nil?
      query_params[:'language[]'] = @api_client.build_collection_param(opts[:'language'], :multi) if !opts[:'language'].nil?
      query_params[:'categories.taxonomy'] = opts[:'categories_taxonomy'] if !opts[:'categories_taxonomy'].nil?
      query_params[:'categories.confident'] = opts[:'categories_confident'] if !opts[:'categories_confident'].nil?
      query_params[:'categories.id[]'] = @api_client.build_collection_param(opts[:'categories_id'], :multi) if !opts[:'categories_id'].nil?
      query_params[:'categories.level[]'] = @api_client.build_collection_param(opts[:'categories_level'], :multi) if !opts[:'categories_level'].nil?
      query_params[:'entities.title.text[]'] = @api_client.build_collection_param(opts[:'entities_title_text'], :multi) if !opts[:'entities_title_text'].nil?
      query_params[:'entities.title.type[]'] = @api_client.build_collection_param(opts[:'entities_title_type'], :multi) if !opts[:'entities_title_type'].nil?
      query_params[:'entities.title.links.dbpedia[]'] = @api_client.build_collection_param(opts[:'entities_title_links_dbpedia'], :multi) if !opts[:'entities_title_links_dbpedia'].nil?
      query_params[:'entities.body.text[]'] = @api_client.build_collection_param(opts[:'entities_body_text'], :multi) if !opts[:'entities_body_text'].nil?
      query_params[:'entities.body.type[]'] = @api_client.build_collection_param(opts[:'entities_body_type'], :multi) if !opts[:'entities_body_type'].nil?
      query_params[:'entities.body.links.dbpedia[]'] = @api_client.build_collection_param(opts[:'entities_body_links_dbpedia'], :multi) if !opts[:'entities_body_links_dbpedia'].nil?
      query_params[:'sentiment.title.polarity'] = opts[:'sentiment_title_polarity'] if !opts[:'sentiment_title_polarity'].nil?
      query_params[:'sentiment.body.polarity'] = opts[:'sentiment_body_polarity'] if !opts[:'sentiment_body_polarity'].nil?
      query_params[:'media.images.count.min'] = opts[:'media_images_count_min'] if !opts[:'media_images_count_min'].nil?
      query_params[:'media.images.count.max'] = opts[:'media_images_count_max'] if !opts[:'media_images_count_max'].nil?
      query_params[:'media.videos.count.min'] = opts[:'media_videos_count_min'] if !opts[:'media_videos_count_min'].nil?
      query_params[:'media.videos.count.max'] = opts[:'media_videos_count_max'] if !opts[:'media_videos_count_max'].nil?
      query_params[:'author.id[]'] = @api_client.build_collection_param(opts[:'author_id'], :multi) if !opts[:'author_id'].nil?
      query_params[:'author.name'] = opts[:'author_name'] if !opts[:'author_name'].nil?
      query_params[:'source.id[]'] = @api_client.build_collection_param(opts[:'source_id'], :multi) if !opts[:'source_id'].nil?
      query_params[:'source.name[]'] = @api_client.build_collection_param(opts[:'source_name'], :multi) if !opts[:'source_name'].nil?
      query_params[:'source.domain[]'] = @api_client.build_collection_param(opts[:'source_domain'], :multi) if !opts[:'source_domain'].nil?
      query_params[:'source.locations.country[]'] = @api_client.build_collection_param(opts[:'source_locations_country'], :multi) if !opts[:'source_locations_country'].nil?
      query_params[:'source.locations.state[]'] = @api_client.build_collection_param(opts[:'source_locations_state'], :multi) if !opts[:'source_locations_state'].nil?
      query_params[:'source.locations.city[]'] = @api_client.build_collection_param(opts[:'source_locations_city'], :multi) if !opts[:'source_locations_city'].nil?
      query_params[:'source.scopes.country[]'] = @api_client.build_collection_param(opts[:'source_scopes_country'], :multi) if !opts[:'source_scopes_country'].nil?
      query_params[:'source.scopes.state[]'] = @api_client.build_collection_param(opts[:'source_scopes_state'], :multi) if !opts[:'source_scopes_state'].nil?
      query_params[:'source.scopes.city[]'] = @api_client.build_collection_param(opts[:'source_scopes_city'], :multi) if !opts[:'source_scopes_city'].nil?
      query_params[:'source.scopes.level[]'] = @api_client.build_collection_param(opts[:'source_scopes_level'], :multi) if !opts[:'source_scopes_level'].nil?
      query_params[:'published_at.start'] = opts[:'published_at_start'] if !opts[:'published_at_start'].nil?
      query_params[:'published_at.end'] = opts[:'published_at_end'] if !opts[:'published_at_end'].nil?
      query_params[:'period'] = opts[:'period'] if !opts[:'period'].nil?

      # header parameters
      header_params = {}

      # HTTP header 'Accept' (if needed)
      local_header_accept = ['application/json', 'text/xml']
      local_header_accept_result = @api_client.select_header_accept(local_header_accept) and header_params['Accept'] = local_header_accept_result

      # HTTP header 'Content-Type'
      local_header_content_type = ['application/x-www-form-urlencoded']
      header_params['Content-Type'] = @api_client.select_header_content_type(local_header_content_type)

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
    # @param [Hash] opts the optional parameters
    # @option opts [Array<Integer>] :id This parameter is used for finding stroies by story id.
    # @option opts [String] :title This parameter is used for finding stories whose title contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
    # @option opts [String] :body This parameter is used for finding stories whose body contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
    # @option opts [String] :text This parameter is used for finding stories whose title or body contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
    # @option opts [Array<String>] :language This parameter is used for finding stories whose language is the specified value. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes.
    # @option opts [String] :published_at_start This parameter is used for finding stories whose published at time is greater than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates).
    # @option opts [String] :published_at_end This parameter is used for finding stories whose published at time is less than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates).
    # @option opts [String] :categories_taxonomy This parameter is used for defining the type of the taxonomy for the rest of the categories queries.
    # @option opts [BOOLEAN] :categories_confident This parameter is used for finding stories whose categories are confident. (default to true)
    # @option opts [Array<String>] :categories_id This parameter is used for finding stories by categories id.
    # @option opts [Array<Integer>] :categories_level This parameter is used for finding stories by categories level.
    # @option opts [Array<String>] :entities_title_text This parameter is used to find stories based on the specified entities &#x60;text&#x60; in story titles.
    # @option opts [Array<String>] :entities_title_type This parameter is used to find stories based on the specified entities &#x60;type&#x60; in story titles.
    # @option opts [Array<String>] :entities_title_links_dbpedia This parameter is used to find stories based on the specified entities dbpedia URL in story titles.
    # @option opts [Array<String>] :entities_body_text This parameter is used to find stories based on the specified entities &#x60;text&#x60; in the body of stories.
    # @option opts [Array<String>] :entities_body_type This parameter is used to find stories based on the specified entities &#x60;type&#x60; in the body of stories.
    # @option opts [Array<String>] :entities_body_links_dbpedia This parameter is used to find stories based on the specified entities dbpedia URL in the body of stories.
    # @option opts [String] :sentiment_title_polarity This parameter is used for finding stories whose title sentiment is the specified value.
    # @option opts [String] :sentiment_body_polarity This parameter is used for finding stories whose body sentiment is the specified value.
    # @option opts [Integer] :media_images_count_min This parameter is used for finding stories whose number of images is greater than or equal to the specified value.
    # @option opts [Integer] :media_images_count_max This parameter is used for finding stories whose number of images is less than or equal to the specified value.
    # @option opts [Integer] :media_videos_count_min This parameter is used for finding stories whose number of videos is greater than or equal to the specified value.
    # @option opts [Integer] :media_videos_count_max This parameter is used for finding stories whose number of videos is less than or equal to the specified value.
    # @option opts [Array<Integer>] :author_id This parameter is used for finding stories whose author id is the specified value.
    # @option opts [String] :author_name This parameter is used for finding stories whose author full name contains the specified value.
    # @option opts [Array<Integer>] :source_id This parameter is used for finding stories whose source id is the specified value.
    # @option opts [Array<String>] :source_name This parameter is used for finding stories whose source name contains the specified value.
    # @option opts [Array<String>] :source_domain This parameter is used for finding stories whose source domain is the specified value.
    # @option opts [Array<String>] :source_locations_country This parameter is used for finding stories whose source country is the specified value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_locations_state This parameter is used for finding stories whose source state/province is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_locations_city This parameter is used for finding stories whose source city is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_scopes_country This parameter is used for finding stories whose source scopes is the specified country value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_scopes_state This parameter is used for finding stories whose source scopes is the specified state/province value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_scopes_city This parameter is used for finding stories whose source scopes is the specified city value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_scopes_level This parameter is used for finding stories whose source scopes is the specified level value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [String] :field This parameter is used to specify the trend field.
    # @return [Trends]
    def list_trends(opts = {})
      data, _status_code, _headers = list_trends_with_http_info(opts)
      return data
    end

    # List trends
    # This endpoint is used for finding trends based on stories.
    # @param [Hash] opts the optional parameters
    # @option opts [Array<Integer>] :id This parameter is used for finding stroies by story id.
    # @option opts [String] :title This parameter is used for finding stories whose title contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
    # @option opts [String] :body This parameter is used for finding stories whose body contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
    # @option opts [String] :text This parameter is used for finding stories whose title or body contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
    # @option opts [Array<String>] :language This parameter is used for finding stories whose language is the specified value. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes.
    # @option opts [String] :published_at_start This parameter is used for finding stories whose published at time is greater than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates).
    # @option opts [String] :published_at_end This parameter is used for finding stories whose published at time is less than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates).
    # @option opts [String] :categories_taxonomy This parameter is used for defining the type of the taxonomy for the rest of the categories queries.
    # @option opts [BOOLEAN] :categories_confident This parameter is used for finding stories whose categories are confident.
    # @option opts [Array<String>] :categories_id This parameter is used for finding stories by categories id.
    # @option opts [Array<Integer>] :categories_level This parameter is used for finding stories by categories level.
    # @option opts [Array<String>] :entities_title_text This parameter is used to find stories based on the specified entities &#x60;text&#x60; in story titles.
    # @option opts [Array<String>] :entities_title_type This parameter is used to find stories based on the specified entities &#x60;type&#x60; in story titles.
    # @option opts [Array<String>] :entities_title_links_dbpedia This parameter is used to find stories based on the specified entities dbpedia URL in story titles.
    # @option opts [Array<String>] :entities_body_text This parameter is used to find stories based on the specified entities &#x60;text&#x60; in the body of stories.
    # @option opts [Array<String>] :entities_body_type This parameter is used to find stories based on the specified entities &#x60;type&#x60; in the body of stories.
    # @option opts [Array<String>] :entities_body_links_dbpedia This parameter is used to find stories based on the specified entities dbpedia URL in the body of stories.
    # @option opts [String] :sentiment_title_polarity This parameter is used for finding stories whose title sentiment is the specified value.
    # @option opts [String] :sentiment_body_polarity This parameter is used for finding stories whose body sentiment is the specified value.
    # @option opts [Integer] :media_images_count_min This parameter is used for finding stories whose number of images is greater than or equal to the specified value.
    # @option opts [Integer] :media_images_count_max This parameter is used for finding stories whose number of images is less than or equal to the specified value.
    # @option opts [Integer] :media_videos_count_min This parameter is used for finding stories whose number of videos is greater than or equal to the specified value.
    # @option opts [Integer] :media_videos_count_max This parameter is used for finding stories whose number of videos is less than or equal to the specified value.
    # @option opts [Array<Integer>] :author_id This parameter is used for finding stories whose author id is the specified value.
    # @option opts [String] :author_name This parameter is used for finding stories whose author full name contains the specified value.
    # @option opts [Array<Integer>] :source_id This parameter is used for finding stories whose source id is the specified value.
    # @option opts [Array<String>] :source_name This parameter is used for finding stories whose source name contains the specified value.
    # @option opts [Array<String>] :source_domain This parameter is used for finding stories whose source domain is the specified value.
    # @option opts [Array<String>] :source_locations_country This parameter is used for finding stories whose source country is the specified value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_locations_state This parameter is used for finding stories whose source state/province is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_locations_city This parameter is used for finding stories whose source city is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_scopes_country This parameter is used for finding stories whose source scopes is the specified country value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_scopes_state This parameter is used for finding stories whose source scopes is the specified state/province value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_scopes_city This parameter is used for finding stories whose source scopes is the specified city value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [Array<String>] :source_scopes_level This parameter is used for finding stories whose source scopes is the specified level value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
    # @option opts [String] :field This parameter is used to specify the trend field.
    # @return [Array<(Trends, Fixnum, Hash)>] Trends data, response status code and response headers
    def list_trends_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: DefaultApi.list_trends ..."
      end
      if opts[:'categories_taxonomy'] && !['iab-qag', 'iptc-subjectcode'].include?(opts[:'categories_taxonomy'])
        fail ArgumentError, 'invalid value for "categories_taxonomy", must be one of iab-qag, iptc-subjectcode'
      end
      if opts[:'sentiment_title_polarity'] && !['positive', 'neutral', 'negative'].include?(opts[:'sentiment_title_polarity'])
        fail ArgumentError, 'invalid value for "sentiment_title_polarity", must be one of positive, neutral, negative'
      end
      if opts[:'sentiment_body_polarity'] && !['positive', 'neutral', 'negative'].include?(opts[:'sentiment_body_polarity'])
        fail ArgumentError, 'invalid value for "sentiment_body_polarity", must be one of positive, neutral, negative'
      end

      if opts[:'field'] && !['author.name', 'source.name', 'source.domain', 'keywords', 'entities.title.text', 'entities.title.type', 'entities.title.links.dbpedia', 'entities.body.text', 'entities.body.type', 'entities.body.links.dbpedia', 'hashtags', 'categories.id', 'sentiment.title.polarity', 'sentiment.body.polarity'].include?(opts[:'field'])
        fail ArgumentError, 'invalid value for "field", must be one of author.name, source.name, source.domain, keywords, entities.title.text, entities.title.type, entities.title.links.dbpedia, entities.body.text, entities.body.type, entities.body.links.dbpedia, hashtags, categories.id, sentiment.title.polarity, sentiment.body.polarity'
      end
      # resource path
      local_var_path = "/trends".sub('{format}','json')

      # query parameters
      query_params = {}
      query_params[:'id[]'] = @api_client.build_collection_param(opts[:'id'], :multi) if !opts[:'id'].nil?
      query_params[:'title'] = opts[:'title'] if !opts[:'title'].nil?
      query_params[:'body'] = opts[:'body'] if !opts[:'body'].nil?
      query_params[:'text'] = opts[:'text'] if !opts[:'text'].nil?
      query_params[:'language[]'] = @api_client.build_collection_param(opts[:'language'], :multi) if !opts[:'language'].nil?
      query_params[:'published_at.start'] = opts[:'published_at_start'] if !opts[:'published_at_start'].nil?
      query_params[:'published_at.end'] = opts[:'published_at_end'] if !opts[:'published_at_end'].nil?
      query_params[:'categories.taxonomy'] = opts[:'categories_taxonomy'] if !opts[:'categories_taxonomy'].nil?
      query_params[:'categories.confident'] = opts[:'categories_confident'] if !opts[:'categories_confident'].nil?
      query_params[:'categories.id[]'] = @api_client.build_collection_param(opts[:'categories_id'], :multi) if !opts[:'categories_id'].nil?
      query_params[:'categories.level[]'] = @api_client.build_collection_param(opts[:'categories_level'], :multi) if !opts[:'categories_level'].nil?
      query_params[:'entities.title.text[]'] = @api_client.build_collection_param(opts[:'entities_title_text'], :multi) if !opts[:'entities_title_text'].nil?
      query_params[:'entities.title.type[]'] = @api_client.build_collection_param(opts[:'entities_title_type'], :multi) if !opts[:'entities_title_type'].nil?
      query_params[:'entities.title.links.dbpedia[]'] = @api_client.build_collection_param(opts[:'entities_title_links_dbpedia'], :multi) if !opts[:'entities_title_links_dbpedia'].nil?
      query_params[:'entities.body.text[]'] = @api_client.build_collection_param(opts[:'entities_body_text'], :multi) if !opts[:'entities_body_text'].nil?
      query_params[:'entities.body.type[]'] = @api_client.build_collection_param(opts[:'entities_body_type'], :multi) if !opts[:'entities_body_type'].nil?
      query_params[:'entities.body.links.dbpedia[]'] = @api_client.build_collection_param(opts[:'entities_body_links_dbpedia'], :multi) if !opts[:'entities_body_links_dbpedia'].nil?
      query_params[:'sentiment.title.polarity'] = opts[:'sentiment_title_polarity'] if !opts[:'sentiment_title_polarity'].nil?
      query_params[:'sentiment.body.polarity'] = opts[:'sentiment_body_polarity'] if !opts[:'sentiment_body_polarity'].nil?
      query_params[:'media.images.count.min'] = opts[:'media_images_count_min'] if !opts[:'media_images_count_min'].nil?
      query_params[:'media.images.count.max'] = opts[:'media_images_count_max'] if !opts[:'media_images_count_max'].nil?
      query_params[:'media.videos.count.min'] = opts[:'media_videos_count_min'] if !opts[:'media_videos_count_min'].nil?
      query_params[:'media.videos.count.max'] = opts[:'media_videos_count_max'] if !opts[:'media_videos_count_max'].nil?
      query_params[:'author.id[]'] = @api_client.build_collection_param(opts[:'author_id'], :multi) if !opts[:'author_id'].nil?
      query_params[:'author.name'] = opts[:'author_name'] if !opts[:'author_name'].nil?
      query_params[:'source.id[]'] = @api_client.build_collection_param(opts[:'source_id'], :multi) if !opts[:'source_id'].nil?
      query_params[:'source.name[]'] = @api_client.build_collection_param(opts[:'source_name'], :multi) if !opts[:'source_name'].nil?
      query_params[:'source.domain[]'] = @api_client.build_collection_param(opts[:'source_domain'], :multi) if !opts[:'source_domain'].nil?
      query_params[:'source.locations.country[]'] = @api_client.build_collection_param(opts[:'source_locations_country'], :multi) if !opts[:'source_locations_country'].nil?
      query_params[:'source.locations.state[]'] = @api_client.build_collection_param(opts[:'source_locations_state'], :multi) if !opts[:'source_locations_state'].nil?
      query_params[:'source.locations.city[]'] = @api_client.build_collection_param(opts[:'source_locations_city'], :multi) if !opts[:'source_locations_city'].nil?
      query_params[:'source.scopes.country[]'] = @api_client.build_collection_param(opts[:'source_scopes_country'], :multi) if !opts[:'source_scopes_country'].nil?
      query_params[:'source.scopes.state[]'] = @api_client.build_collection_param(opts[:'source_scopes_state'], :multi) if !opts[:'source_scopes_state'].nil?
      query_params[:'source.scopes.city[]'] = @api_client.build_collection_param(opts[:'source_scopes_city'], :multi) if !opts[:'source_scopes_city'].nil?
      query_params[:'source.scopes.level[]'] = @api_client.build_collection_param(opts[:'source_scopes_level'], :multi) if !opts[:'source_scopes_level'].nil?
      query_params[:'field'] = opts[:'field'] if !opts[:'field'].nil?

      # header parameters
      header_params = {}

      # HTTP header 'Accept' (if needed)
      local_header_accept = ['application/json', 'text/xml']
      local_header_accept_result = @api_client.select_header_accept(local_header_accept) and header_params['Accept'] = local_header_accept_result

      # HTTP header 'Content-Type'
      local_header_content_type = ['application/x-www-form-urlencoded']
      header_params['Content-Type'] = @api_client.select_header_content_type(local_header_content_type)

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
