# AylienNewsApi::CoverageApi

All URIs are relative to *https://api.aylien.com/news*

Method | HTTP request | Description
------------- | ------------- | -------------
[**list_coverages_get**](CoverageApi.md#list_coverages_get) | **GET** /coverages | 
[**list_coverages_post**](CoverageApi.md#list_coverages_post) | **POST** /coverages | 



## list_coverages_get

> Coverages list_coverages_get(opts)



### Example

```ruby
# load the gem
require 'aylien_news_api'
# setup authorization
AylienNewsApi.configure do |config|
  # Configure API key authorization: app_id
  config.api_key['X-AYLIEN-NewsAPI-Application-ID'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['X-AYLIEN-NewsAPI-Application-ID'] = 'Bearer'

  # Configure API key authorization: app_key
  config.api_key['X-AYLIEN-NewsAPI-Application-Key'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['X-AYLIEN-NewsAPI-Application-Key'] = 'Bearer'
end

api_instance = AylienNewsApi::CoverageApi.new
opts = {
  id: [56], # Array<Integer> | This parameter is used for finding stories by story id. 
  id2: [56], # Array<Integer> | This parameter is used for excluding stories by story id. 
  title: 'title_example', # String | This parameter is used for finding stories whose title contains a specific keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators). 
  body: 'body_example', # String | This parameter is used for finding stories whose body contains a specific keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators). 
  text: 'text_example', # String | This parameter is used for finding stories whose title or body contains a specific keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators). 
  translations_en_title: 'translations_en_title_example', # String | This parameter is used for finding stories whose translation title contains a specific keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators). 
  translations_en_body: 'translations_en_body_example', # String | This parameter is used for finding stories whose translation body contains a specific keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators). 
  translations_en_text: 'translations_en_text_example', # String | This parameter is used for finding stories whose translation title or body contains a specific keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators). 
  links_permalink: ['links_permalink_example'], # Array<String> | This parameter is used to find stories based on their url. 
  links_permalink2: ['links_permalink_example'], # Array<String> | This parameter is used to exclude stories based on their url. 
  language: ['language_example'], # Array<String> | This parameter is used for finding stories whose language is the specified value. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes. 
  language2: ['language_example'], # Array<String> | This parameter is used for excluding stories whose language is the specified value. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes. 
  published_at_start: 'published_at_start_example', # String | This parameter is used for finding stories whose published at time is greater than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates). 
  published_at_end: 'published_at_end_example', # String | This parameter is used for finding stories whose published at time is less than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates). 
  categories_taxonomy: 'categories_taxonomy_example', # String | This parameter is used for defining the type of the taxonomy for the rest of the categories queries. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories). 
  categories_confident: true, # Boolean | This parameter is used for finding stories whose categories are confident. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories). 
  categories_id: ['categories_id_example'], # Array<String> | This parameter is used for finding stories by categories id. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories). 
  categories_id2: ['categories_id_example'], # Array<String> | This parameter is used for excluding stories by categories id. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories). 
  categories_label: ['categories_label_example'], # Array<String> | This parameter is used for finding stories by categories label. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories). 
  categories_label2: ['categories_label_example'], # Array<String> | This parameter is used for excluding stories by categories label. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories). 
  categories_level: [56], # Array<Integer> | This parameter is used for finding stories by categories level. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories). 
  categories_level2: [56], # Array<Integer> | This parameter is used for excluding stories by categories level. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories). 
  entities_title_text: ['entities_title_text_example'], # Array<String> | This parameter is used to find stories based on the specified entities `text` in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  entities_title_text2: ['entities_title_text_example'], # Array<String> | This parameter is used to exclude stories based on the specified entities `text` in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  entities_title_type: ['entities_title_type_example'], # Array<String> | This parameter is used to find stories based on the specified entities `type` in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  entities_title_type2: ['entities_title_type_example'], # Array<String> | This parameter is used to exclude stories based on the specified entities `type` in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  entities_title_links_dbpedia: ['entities_title_links_dbpedia_example'], # Array<String> | This parameter is used to find stories based on the specified entities dbpedia URL in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  entities_title_links_dbpedia2: ['entities_title_links_dbpedia_example'], # Array<String> | This parameter is used to exclude stories based on the specified entities dbpedia URL in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  entities_body_text: ['entities_body_text_example'], # Array<String> | This parameter is used to find stories based on the specified entities `text` in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  entities_body_text2: ['entities_body_text_example'], # Array<String> | This parameter is used to exclude stories based on the specified entities `text` in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  entities_body_type: ['entities_body_type_example'], # Array<String> | This parameter is used to find stories based on the specified entities `type` in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  entities_body_type2: ['entities_body_type_example'], # Array<String> | This parameter is used to exclude stories based on the specified entities `type` in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  entities_body_links_dbpedia: ['entities_body_links_dbpedia_example'], # Array<String> | This parameter is used to find stories based on the specified entities dbpedia URL in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  entities_body_links_dbpedia2: ['entities_body_links_dbpedia_example'], # Array<String> | This parameter is used to exclude stories based on the specified entities dbpedia URL in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  sentiment_title_polarity: 'sentiment_title_polarity_example', # String | This parameter is used for finding stories whose title sentiment is the specified value. 
  sentiment_title_polarity2: 'sentiment_title_polarity_example', # String | This parameter is used for excluding stories whose title sentiment is the specified value. 
  sentiment_body_polarity: 'sentiment_body_polarity_example', # String | This parameter is used for finding stories whose body sentiment is the specified value. 
  sentiment_body_polarity2: 'sentiment_body_polarity_example', # String | This parameter is used for excluding stories whose body sentiment is the specified value. 
  media_images_count_min: 56, # Integer | This parameter is used for finding stories whose number of images is greater than or equal to the specified value. 
  media_images_count_max: 56, # Integer | This parameter is used for finding stories whose number of images is less than or equal to the specified value. 
  media_images_width_min: 56, # Integer | This parameter is used for finding stories whose width of images are greater than or equal to the specified value. 
  media_images_width_max: 56, # Integer | This parameter is used for finding stories whose width of images are less than or equal to the specified value. 
  media_images_height_min: 56, # Integer | This parameter is used for finding stories whose height of images are greater than or equal to the specified value. 
  media_images_height_max: 56, # Integer | This parameter is used for finding stories whose height of images are less than or equal to the specified value. 
  media_images_content_length_min: 56, # Integer | This parameter is used for finding stories whose images content length are greater than or equal to the specified value. 
  media_images_content_length_max: 56, # Integer | This parameter is used for finding stories whose images content length are less than or equal to the specified value. 
  media_images_format: ['media_images_format_example'], # Array<String> | This parameter is used for finding stories whose images format are the specified value. 
  media_images_format2: ['media_images_format_example'], # Array<String> | This parameter is used for excluding stories whose images format are the specified value. 
  media_videos_count_min: 56, # Integer | This parameter is used for finding stories whose number of videos is greater than or equal to the specified value. 
  media_videos_count_max: 56, # Integer | This parameter is used for finding stories whose number of videos is less than or equal to the specified value. 
  author_id: [56], # Array<Integer> | This parameter is used for finding stories whose author id is the specified value. 
  author_id2: [56], # Array<Integer> | This parameter is used for excluding stories whose author id is the specified value. 
  author_name: 'author_name_example', # String | This parameter is used for finding stories whose author full name contains the specified value. 
  author_name2: 'author_name_example', # String | This parameter is used for excluding stories whose author full name contains the specified value. 
  source_id: [56], # Array<Integer> | This parameter is used for finding stories whose source id is the specified value. 
  source_id2: [56], # Array<Integer> | This parameter is used for excluding stories whose source id is the specified value. 
  source_name: ['source_name_example'], # Array<String> | This parameter is used for finding stories whose source name contains the specified value. 
  source_name2: ['source_name_example'], # Array<String> | This parameter is used for excluding stories whose source name contains the specified value. 
  source_domain: ['source_domain_example'], # Array<String> | This parameter is used for finding stories whose source domain is the specified value. 
  source_domain2: ['source_domain_example'], # Array<String> | This parameter is used for excluding stories whose source domain is the specified value. 
  source_locations_country: ['source_locations_country_example'], # Array<String> | This parameter is used for finding stories whose source country is the specified value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  source_locations_country2: ['source_locations_country_example'], # Array<String> | This parameter is used for excluding stories whose source country is the specified value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  source_locations_state: ['source_locations_state_example'], # Array<String> | This parameter is used for finding stories whose source state/province is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  source_locations_state2: ['source_locations_state_example'], # Array<String> | This parameter is used for excluding stories whose source state/province is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  source_locations_city: ['source_locations_city_example'], # Array<String> | This parameter is used for finding stories whose source city is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  source_locations_city2: ['source_locations_city_example'], # Array<String> | This parameter is used for excluding stories whose source city is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  source_scopes_country: ['source_scopes_country_example'], # Array<String> | This parameter is used for finding stories whose source scopes is the specified country value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  source_scopes_country2: ['source_scopes_country_example'], # Array<String> | This parameter is used for excluding stories whose source scopes is the specified country value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  source_scopes_state: ['source_scopes_state_example'], # Array<String> | This parameter is used for finding stories whose source scopes is the specified state/province value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  source_scopes_state2: ['source_scopes_state_example'], # Array<String> | This parameter is used for excluding stories whose source scopes is the specified state/province value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  source_scopes_city: ['source_scopes_city_example'], # Array<String> | This parameter is used for finding stories whose source scopes is the specified city value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  source_scopes_city2: ['source_scopes_city_example'], # Array<String> | This parameter is used for excluding stories whose source scopes is the specified city value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  source_scopes_level: ['source_scopes_level_example'], # Array<String> | This parameter is used for finding stories whose source scopes is the specified level value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  source_scopes_level2: ['source_scopes_level_example'], # Array<String> | This parameter is used for excluding stories whose source scopes is the specified level value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  source_links_in_count_min: 56, # Integer | This parameter is used for finding stories from sources whose Links in count is greater than or equal to the specified value. You can read more about working with Links in count [here](https://newsapi.aylien.com/docs/working-with-links-in-count). 
  source_links_in_count_max: 56, # Integer | This parameter is used for finding stories from sources whose Links in count is less than or equal to the specified value. You can read more about working with Links in count [here](https://newsapi.aylien.com/docs/working-with-links-in-count). 
  source_rankings_alexa_rank_min: 56, # Integer | This parameter is used for finding stories from sources whose Alexa rank is greater than or equal to the specified value. You can read more about working with Alexa ranks [here](https://newsapi.aylien.com/docs/working-with-alexa-ranks). 
  source_rankings_alexa_rank_max: 56, # Integer | This parameter is used for finding stories from sources whose Alexa rank is less than or equal to the specified value. You can read more about working with Alexa ranks [here](https://newsapi.aylien.com/docs/working-with-alexa-ranks). 
  source_rankings_alexa_country: ['source_rankings_alexa_country_example'], # Array<String> | This parameter is used for finding stories from sources whose Alexa rank is in the specified country value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. You can read more about working with Alexa ranks [here](https://newsapi.aylien.com/docs/working-with-alexa-ranks). 
  social_shares_count_facebook_min: 56, # Integer | This parameter is used for finding stories whose Facebook social shares count is greater than or equal to the specified value. 
  social_shares_count_facebook_max: 56, # Integer | This parameter is used for finding stories whose Facebook social shares count is less than or equal to the specified value. 
  social_shares_count_google_plus_min: 56, # Integer | This parameter is used for finding stories whose Google+ social shares count is greater than or equal to the specified value. 
  social_shares_count_google_plus_max: 56, # Integer | This parameter is used for finding stories whose Google+ social shares count is less than or equal to the specified value. 
  social_shares_count_linkedin_min: 56, # Integer | This parameter is used for finding stories whose LinkedIn social shares count is greater than or equal to the specified value. 
  social_shares_count_linkedin_max: 56, # Integer | This parameter is used for finding stories whose LinkedIn social shares count is less than or equal to the specified value. 
  social_shares_count_reddit_min: 56, # Integer | This parameter is used for finding stories whose Reddit social shares count is greater than or equal to the specified value. 
  social_shares_count_reddit_max: 56, # Integer | This parameter is used for finding stories whose Reddit social shares count is less than or equal to the specified value. 
  clusters: ['clusters_example'], # Array<String> | This parameter is used for finding stories with belonging to one of clusters in a specific set of clusters You can read more about working with clustering [here](https://newsapi.aylien.com/docs/working-with-clustering). 
  _return: ['_return_example'], # Array<String> | This parameter is used for specifying return fields.
  story_id: 56, # Integer | A story id
  story_url: 'story_url_example', # String | An article or webpage
  story_title: 'story_title_example', # String | Title of the article
  story_body: 'story_body_example', # String | Body of the article
  story_published_at: DateTime.parse('2013-10-20T19:20:30+01:00'), # DateTime | Publish date of the article. If you use a url or title and body of an article for getting coverages, this parameter is required. The format used is a restricted form of the canonical representation of dateTime in the [XML Schema specification (ISO 8601)](https://www.w3.org/TR/xmlschema-2/#dateTime). 
  story_language: 'auto', # String | This parameter is used for setting the language of the story. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes. 
  per_page: 3 # Integer | This parameter is used for specifying number of items in each page. 
}

begin
  result = api_instance.list_coverages_get(opts)
  p result
rescue AylienNewsApi::ApiError => e
  puts "Exception when calling CoverageApi->list_coverages_get: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | [**Array&lt;Integer&gt;**](Integer.md)| This parameter is used for finding stories by story id.  | [optional] 
 **id2** | [**Array&lt;Integer&gt;**](Integer.md)| This parameter is used for excluding stories by story id.  | [optional] 
 **title** | **String**| This parameter is used for finding stories whose title contains a specific keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).  | [optional] 
 **body** | **String**| This parameter is used for finding stories whose body contains a specific keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).  | [optional] 
 **text** | **String**| This parameter is used for finding stories whose title or body contains a specific keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).  | [optional] 
 **translations_en_title** | **String**| This parameter is used for finding stories whose translation title contains a specific keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).  | [optional] 
 **translations_en_body** | **String**| This parameter is used for finding stories whose translation body contains a specific keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).  | [optional] 
 **translations_en_text** | **String**| This parameter is used for finding stories whose translation title or body contains a specific keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).  | [optional] 
 **links_permalink** | [**Array&lt;String&gt;**](String.md)| This parameter is used to find stories based on their url.  | [optional] 
 **links_permalink2** | [**Array&lt;String&gt;**](String.md)| This parameter is used to exclude stories based on their url.  | [optional] 
 **language** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose language is the specified value. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes.  | [optional] 
 **language2** | [**Array&lt;String&gt;**](String.md)| This parameter is used for excluding stories whose language is the specified value. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes.  | [optional] 
 **published_at_start** | **String**| This parameter is used for finding stories whose published at time is greater than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates).  | [optional] 
 **published_at_end** | **String**| This parameter is used for finding stories whose published at time is less than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates).  | [optional] 
 **categories_taxonomy** | **String**| This parameter is used for defining the type of the taxonomy for the rest of the categories queries. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).  | [optional] 
 **categories_confident** | **Boolean**| This parameter is used for finding stories whose categories are confident. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).  | [optional] [default to true]
 **categories_id** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories by categories id. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).  | [optional] 
 **categories_id2** | [**Array&lt;String&gt;**](String.md)| This parameter is used for excluding stories by categories id. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).  | [optional] 
 **categories_label** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories by categories label. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).  | [optional] 
 **categories_label2** | [**Array&lt;String&gt;**](String.md)| This parameter is used for excluding stories by categories label. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).  | [optional] 
 **categories_level** | [**Array&lt;Integer&gt;**](Integer.md)| This parameter is used for finding stories by categories level. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).  | [optional] 
 **categories_level2** | [**Array&lt;Integer&gt;**](Integer.md)| This parameter is used for excluding stories by categories level. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).  | [optional] 
 **entities_title_text** | [**Array&lt;String&gt;**](String.md)| This parameter is used to find stories based on the specified entities &#x60;text&#x60; in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **entities_title_text2** | [**Array&lt;String&gt;**](String.md)| This parameter is used to exclude stories based on the specified entities &#x60;text&#x60; in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **entities_title_type** | [**Array&lt;String&gt;**](String.md)| This parameter is used to find stories based on the specified entities &#x60;type&#x60; in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **entities_title_type2** | [**Array&lt;String&gt;**](String.md)| This parameter is used to exclude stories based on the specified entities &#x60;type&#x60; in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **entities_title_links_dbpedia** | [**Array&lt;String&gt;**](String.md)| This parameter is used to find stories based on the specified entities dbpedia URL in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **entities_title_links_dbpedia2** | [**Array&lt;String&gt;**](String.md)| This parameter is used to exclude stories based on the specified entities dbpedia URL in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **entities_body_text** | [**Array&lt;String&gt;**](String.md)| This parameter is used to find stories based on the specified entities &#x60;text&#x60; in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **entities_body_text2** | [**Array&lt;String&gt;**](String.md)| This parameter is used to exclude stories based on the specified entities &#x60;text&#x60; in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **entities_body_type** | [**Array&lt;String&gt;**](String.md)| This parameter is used to find stories based on the specified entities &#x60;type&#x60; in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **entities_body_type2** | [**Array&lt;String&gt;**](String.md)| This parameter is used to exclude stories based on the specified entities &#x60;type&#x60; in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **entities_body_links_dbpedia** | [**Array&lt;String&gt;**](String.md)| This parameter is used to find stories based on the specified entities dbpedia URL in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **entities_body_links_dbpedia2** | [**Array&lt;String&gt;**](String.md)| This parameter is used to exclude stories based on the specified entities dbpedia URL in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **sentiment_title_polarity** | **String**| This parameter is used for finding stories whose title sentiment is the specified value.  | [optional] 
 **sentiment_title_polarity2** | **String**| This parameter is used for excluding stories whose title sentiment is the specified value.  | [optional] 
 **sentiment_body_polarity** | **String**| This parameter is used for finding stories whose body sentiment is the specified value.  | [optional] 
 **sentiment_body_polarity2** | **String**| This parameter is used for excluding stories whose body sentiment is the specified value.  | [optional] 
 **media_images_count_min** | **Integer**| This parameter is used for finding stories whose number of images is greater than or equal to the specified value.  | [optional] 
 **media_images_count_max** | **Integer**| This parameter is used for finding stories whose number of images is less than or equal to the specified value.  | [optional] 
 **media_images_width_min** | **Integer**| This parameter is used for finding stories whose width of images are greater than or equal to the specified value.  | [optional] 
 **media_images_width_max** | **Integer**| This parameter is used for finding stories whose width of images are less than or equal to the specified value.  | [optional] 
 **media_images_height_min** | **Integer**| This parameter is used for finding stories whose height of images are greater than or equal to the specified value.  | [optional] 
 **media_images_height_max** | **Integer**| This parameter is used for finding stories whose height of images are less than or equal to the specified value.  | [optional] 
 **media_images_content_length_min** | **Integer**| This parameter is used for finding stories whose images content length are greater than or equal to the specified value.  | [optional] 
 **media_images_content_length_max** | **Integer**| This parameter is used for finding stories whose images content length are less than or equal to the specified value.  | [optional] 
 **media_images_format** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose images format are the specified value.  | [optional] 
 **media_images_format2** | [**Array&lt;String&gt;**](String.md)| This parameter is used for excluding stories whose images format are the specified value.  | [optional] 
 **media_videos_count_min** | **Integer**| This parameter is used for finding stories whose number of videos is greater than or equal to the specified value.  | [optional] 
 **media_videos_count_max** | **Integer**| This parameter is used for finding stories whose number of videos is less than or equal to the specified value.  | [optional] 
 **author_id** | [**Array&lt;Integer&gt;**](Integer.md)| This parameter is used for finding stories whose author id is the specified value.  | [optional] 
 **author_id2** | [**Array&lt;Integer&gt;**](Integer.md)| This parameter is used for excluding stories whose author id is the specified value.  | [optional] 
 **author_name** | **String**| This parameter is used for finding stories whose author full name contains the specified value.  | [optional] 
 **author_name2** | **String**| This parameter is used for excluding stories whose author full name contains the specified value.  | [optional] 
 **source_id** | [**Array&lt;Integer&gt;**](Integer.md)| This parameter is used for finding stories whose source id is the specified value.  | [optional] 
 **source_id2** | [**Array&lt;Integer&gt;**](Integer.md)| This parameter is used for excluding stories whose source id is the specified value.  | [optional] 
 **source_name** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source name contains the specified value.  | [optional] 
 **source_name2** | [**Array&lt;String&gt;**](String.md)| This parameter is used for excluding stories whose source name contains the specified value.  | [optional] 
 **source_domain** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source domain is the specified value.  | [optional] 
 **source_domain2** | [**Array&lt;String&gt;**](String.md)| This parameter is used for excluding stories whose source domain is the specified value.  | [optional] 
 **source_locations_country** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source country is the specified value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **source_locations_country2** | [**Array&lt;String&gt;**](String.md)| This parameter is used for excluding stories whose source country is the specified value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **source_locations_state** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source state/province is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **source_locations_state2** | [**Array&lt;String&gt;**](String.md)| This parameter is used for excluding stories whose source state/province is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **source_locations_city** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source city is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **source_locations_city2** | [**Array&lt;String&gt;**](String.md)| This parameter is used for excluding stories whose source city is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **source_scopes_country** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source scopes is the specified country value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **source_scopes_country2** | [**Array&lt;String&gt;**](String.md)| This parameter is used for excluding stories whose source scopes is the specified country value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **source_scopes_state** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source scopes is the specified state/province value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **source_scopes_state2** | [**Array&lt;String&gt;**](String.md)| This parameter is used for excluding stories whose source scopes is the specified state/province value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **source_scopes_city** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source scopes is the specified city value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **source_scopes_city2** | [**Array&lt;String&gt;**](String.md)| This parameter is used for excluding stories whose source scopes is the specified city value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **source_scopes_level** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source scopes is the specified level value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **source_scopes_level2** | [**Array&lt;String&gt;**](String.md)| This parameter is used for excluding stories whose source scopes is the specified level value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **source_links_in_count_min** | **Integer**| This parameter is used for finding stories from sources whose Links in count is greater than or equal to the specified value. You can read more about working with Links in count [here](https://newsapi.aylien.com/docs/working-with-links-in-count).  | [optional] 
 **source_links_in_count_max** | **Integer**| This parameter is used for finding stories from sources whose Links in count is less than or equal to the specified value. You can read more about working with Links in count [here](https://newsapi.aylien.com/docs/working-with-links-in-count).  | [optional] 
 **source_rankings_alexa_rank_min** | **Integer**| This parameter is used for finding stories from sources whose Alexa rank is greater than or equal to the specified value. You can read more about working with Alexa ranks [here](https://newsapi.aylien.com/docs/working-with-alexa-ranks).  | [optional] 
 **source_rankings_alexa_rank_max** | **Integer**| This parameter is used for finding stories from sources whose Alexa rank is less than or equal to the specified value. You can read more about working with Alexa ranks [here](https://newsapi.aylien.com/docs/working-with-alexa-ranks).  | [optional] 
 **source_rankings_alexa_country** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories from sources whose Alexa rank is in the specified country value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. You can read more about working with Alexa ranks [here](https://newsapi.aylien.com/docs/working-with-alexa-ranks).  | [optional] 
 **social_shares_count_facebook_min** | **Integer**| This parameter is used for finding stories whose Facebook social shares count is greater than or equal to the specified value.  | [optional] 
 **social_shares_count_facebook_max** | **Integer**| This parameter is used for finding stories whose Facebook social shares count is less than or equal to the specified value.  | [optional] 
 **social_shares_count_google_plus_min** | **Integer**| This parameter is used for finding stories whose Google+ social shares count is greater than or equal to the specified value.  | [optional] 
 **social_shares_count_google_plus_max** | **Integer**| This parameter is used for finding stories whose Google+ social shares count is less than or equal to the specified value.  | [optional] 
 **social_shares_count_linkedin_min** | **Integer**| This parameter is used for finding stories whose LinkedIn social shares count is greater than or equal to the specified value.  | [optional] 
 **social_shares_count_linkedin_max** | **Integer**| This parameter is used for finding stories whose LinkedIn social shares count is less than or equal to the specified value.  | [optional] 
 **social_shares_count_reddit_min** | **Integer**| This parameter is used for finding stories whose Reddit social shares count is greater than or equal to the specified value.  | [optional] 
 **social_shares_count_reddit_max** | **Integer**| This parameter is used for finding stories whose Reddit social shares count is less than or equal to the specified value.  | [optional] 
 **clusters** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories with belonging to one of clusters in a specific set of clusters You can read more about working with clustering [here](https://newsapi.aylien.com/docs/working-with-clustering).  | [optional] 
 **_return** | [**Array&lt;String&gt;**](String.md)| This parameter is used for specifying return fields. | [optional] 
 **story_id** | **Integer**| A story id | [optional] 
 **story_url** | **String**| An article or webpage | [optional] 
 **story_title** | **String**| Title of the article | [optional] 
 **story_body** | **String**| Body of the article | [optional] 
 **story_published_at** | **DateTime**| Publish date of the article. If you use a url or title and body of an article for getting coverages, this parameter is required. The format used is a restricted form of the canonical representation of dateTime in the [XML Schema specification (ISO 8601)](https://www.w3.org/TR/xmlschema-2/#dateTime).  | [optional] 
 **story_language** | **String**| This parameter is used for setting the language of the story. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes.  | [optional] [default to &#39;auto&#39;]
 **per_page** | **Integer**| This parameter is used for specifying number of items in each page.  | [optional] [default to 3]

### Return type

[**Coverages**](Coverages.md)

### Authorization

[app_id](../README.md#app_id), [app_key](../README.md#app_key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json, text/xml


## list_coverages_post

> Coverages list_coverages_post(opts)



### Example

```ruby
# load the gem
require 'aylien_news_api'
# setup authorization
AylienNewsApi.configure do |config|
  # Configure API key authorization: app_id
  config.api_key['X-AYLIEN-NewsAPI-Application-ID'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['X-AYLIEN-NewsAPI-Application-ID'] = 'Bearer'

  # Configure API key authorization: app_key
  config.api_key['X-AYLIEN-NewsAPI-Application-Key'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['X-AYLIEN-NewsAPI-Application-Key'] = 'Bearer'
end

api_instance = AylienNewsApi::CoverageApi.new
opts = {
  id: [56], # Array<Integer> | This parameter is used for finding stories by story id. 
  id2: [56], # Array<Integer> | This parameter is used for excluding stories by story id. 
  title: 'title_example', # String | This parameter is used for finding stories whose title contains a specific keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators). 
  body: 'body_example', # String | This parameter is used for finding stories whose body contains a specific keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators). 
  text: 'text_example', # String | This parameter is used for finding stories whose title or body contains a specific keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators). 
  translations_en_title: 'translations_en_title_example', # String | This parameter is used for finding stories whose translation title contains a specific keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators). 
  translations_en_body: 'translations_en_body_example', # String | This parameter is used for finding stories whose translation body contains a specific keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators). 
  translations_en_text: 'translations_en_text_example', # String | This parameter is used for finding stories whose translation title or body contains a specific keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators). 
  links_permalink: ['links_permalink_example'], # Array<String> | This parameter is used to find stories based on their url. 
  links_permalink2: ['links_permalink_example'], # Array<String> | This parameter is used to exclude stories based on their url. 
  language: ['language_example'], # Array<String> | This parameter is used for finding stories whose language is the specified value. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes. 
  language2: ['language_example'], # Array<String> | This parameter is used for excluding stories whose language is the specified value. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes. 
  published_at_start: 'published_at_start_example', # String | This parameter is used for finding stories whose published at time is greater than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates). 
  published_at_end: 'published_at_end_example', # String | This parameter is used for finding stories whose published at time is less than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates). 
  categories_taxonomy: 'categories_taxonomy_example', # String | This parameter is used for defining the type of the taxonomy for the rest of the categories queries. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories). 
  categories_confident: true, # Boolean | This parameter is used for finding stories whose categories are confident. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories). 
  categories_id: ['categories_id_example'], # Array<String> | This parameter is used for finding stories by categories id. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories). 
  categories_id2: ['categories_id_example'], # Array<String> | This parameter is used for excluding stories by categories id. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories). 
  categories_label: ['categories_label_example'], # Array<String> | This parameter is used for finding stories by categories label. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories). 
  categories_label2: ['categories_label_example'], # Array<String> | This parameter is used for excluding stories by categories label. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories). 
  categories_level: [56], # Array<Integer> | This parameter is used for finding stories by categories level. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories). 
  categories_level2: [56], # Array<Integer> | This parameter is used for excluding stories by categories level. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories). 
  entities_title_text: ['entities_title_text_example'], # Array<String> | This parameter is used to find stories based on the specified entities `text` in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  entities_title_text2: ['entities_title_text_example'], # Array<String> | This parameter is used to exclude stories based on the specified entities `text` in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  entities_title_type: ['entities_title_type_example'], # Array<String> | This parameter is used to find stories based on the specified entities `type` in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  entities_title_type2: ['entities_title_type_example'], # Array<String> | This parameter is used to exclude stories based on the specified entities `type` in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  entities_title_links_dbpedia: ['entities_title_links_dbpedia_example'], # Array<String> | This parameter is used to find stories based on the specified entities dbpedia URL in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  entities_title_links_dbpedia2: ['entities_title_links_dbpedia_example'], # Array<String> | This parameter is used to exclude stories based on the specified entities dbpedia URL in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  entities_body_text: ['entities_body_text_example'], # Array<String> | This parameter is used to find stories based on the specified entities `text` in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  entities_body_text2: ['entities_body_text_example'], # Array<String> | This parameter is used to exclude stories based on the specified entities `text` in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  entities_body_type: ['entities_body_type_example'], # Array<String> | This parameter is used to find stories based on the specified entities `type` in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  entities_body_type2: ['entities_body_type_example'], # Array<String> | This parameter is used to exclude stories based on the specified entities `type` in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  entities_body_links_dbpedia: ['entities_body_links_dbpedia_example'], # Array<String> | This parameter is used to find stories based on the specified entities dbpedia URL in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  entities_body_links_dbpedia2: ['entities_body_links_dbpedia_example'], # Array<String> | This parameter is used to exclude stories based on the specified entities dbpedia URL in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  sentiment_title_polarity: 'sentiment_title_polarity_example', # String | This parameter is used for finding stories whose title sentiment is the specified value. 
  sentiment_title_polarity2: 'sentiment_title_polarity_example', # String | This parameter is used for excluding stories whose title sentiment is the specified value. 
  sentiment_body_polarity: 'sentiment_body_polarity_example', # String | This parameter is used for finding stories whose body sentiment is the specified value. 
  sentiment_body_polarity2: 'sentiment_body_polarity_example', # String | This parameter is used for excluding stories whose body sentiment is the specified value. 
  media_images_count_min: 56, # Integer | This parameter is used for finding stories whose number of images is greater than or equal to the specified value. 
  media_images_count_max: 56, # Integer | This parameter is used for finding stories whose number of images is less than or equal to the specified value. 
  media_images_width_min: 56, # Integer | This parameter is used for finding stories whose width of images are greater than or equal to the specified value. 
  media_images_width_max: 56, # Integer | This parameter is used for finding stories whose width of images are less than or equal to the specified value. 
  media_images_height_min: 56, # Integer | This parameter is used for finding stories whose height of images are greater than or equal to the specified value. 
  media_images_height_max: 56, # Integer | This parameter is used for finding stories whose height of images are less than or equal to the specified value. 
  media_images_content_length_min: 56, # Integer | This parameter is used for finding stories whose images content length are greater than or equal to the specified value. 
  media_images_content_length_max: 56, # Integer | This parameter is used for finding stories whose images content length are less than or equal to the specified value. 
  media_images_format: ['media_images_format_example'], # Array<String> | This parameter is used for finding stories whose images format are the specified value. 
  media_images_format2: ['media_images_format_example'], # Array<String> | This parameter is used for excluding stories whose images format are the specified value. 
  media_videos_count_min: 56, # Integer | This parameter is used for finding stories whose number of videos is greater than or equal to the specified value. 
  media_videos_count_max: 56, # Integer | This parameter is used for finding stories whose number of videos is less than or equal to the specified value. 
  author_id: [56], # Array<Integer> | This parameter is used for finding stories whose author id is the specified value. 
  author_id2: [56], # Array<Integer> | This parameter is used for excluding stories whose author id is the specified value. 
  author_name: 'author_name_example', # String | This parameter is used for finding stories whose author full name contains the specified value. 
  author_name2: 'author_name_example', # String | This parameter is used for excluding stories whose author full name contains the specified value. 
  source_id: [56], # Array<Integer> | This parameter is used for finding stories whose source id is the specified value. 
  source_id2: [56], # Array<Integer> | This parameter is used for excluding stories whose source id is the specified value. 
  source_name: ['source_name_example'], # Array<String> | This parameter is used for finding stories whose source name contains the specified value. 
  source_name2: ['source_name_example'], # Array<String> | This parameter is used for excluding stories whose source name contains the specified value. 
  source_domain: ['source_domain_example'], # Array<String> | This parameter is used for finding stories whose source domain is the specified value. 
  source_domain2: ['source_domain_example'], # Array<String> | This parameter is used for excluding stories whose source domain is the specified value. 
  source_locations_country: ['source_locations_country_example'], # Array<String> | This parameter is used for finding stories whose source country is the specified value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  source_locations_country2: ['source_locations_country_example'], # Array<String> | This parameter is used for excluding stories whose source country is the specified value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  source_locations_state: ['source_locations_state_example'], # Array<String> | This parameter is used for finding stories whose source state/province is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  source_locations_state2: ['source_locations_state_example'], # Array<String> | This parameter is used for excluding stories whose source state/province is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  source_locations_city: ['source_locations_city_example'], # Array<String> | This parameter is used for finding stories whose source city is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  source_locations_city2: ['source_locations_city_example'], # Array<String> | This parameter is used for excluding stories whose source city is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  source_scopes_country: ['source_scopes_country_example'], # Array<String> | This parameter is used for finding stories whose source scopes is the specified country value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  source_scopes_country2: ['source_scopes_country_example'], # Array<String> | This parameter is used for excluding stories whose source scopes is the specified country value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  source_scopes_state: ['source_scopes_state_example'], # Array<String> | This parameter is used for finding stories whose source scopes is the specified state/province value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  source_scopes_state2: ['source_scopes_state_example'], # Array<String> | This parameter is used for excluding stories whose source scopes is the specified state/province value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  source_scopes_city: ['source_scopes_city_example'], # Array<String> | This parameter is used for finding stories whose source scopes is the specified city value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  source_scopes_city2: ['source_scopes_city_example'], # Array<String> | This parameter is used for excluding stories whose source scopes is the specified city value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  source_scopes_level: ['source_scopes_level_example'], # Array<String> | This parameter is used for finding stories whose source scopes is the specified level value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  source_scopes_level2: ['source_scopes_level_example'], # Array<String> | This parameter is used for excluding stories whose source scopes is the specified level value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  source_links_in_count_min: 56, # Integer | This parameter is used for finding stories from sources whose Links in count is greater than or equal to the specified value. You can read more about working with Links in count [here](https://newsapi.aylien.com/docs/working-with-links-in-count). 
  source_links_in_count_max: 56, # Integer | This parameter is used for finding stories from sources whose Links in count is less than or equal to the specified value. You can read more about working with Links in count [here](https://newsapi.aylien.com/docs/working-with-links-in-count). 
  source_rankings_alexa_rank_min: 56, # Integer | This parameter is used for finding stories from sources whose Alexa rank is greater than or equal to the specified value. You can read more about working with Alexa ranks [here](https://newsapi.aylien.com/docs/working-with-alexa-ranks). 
  source_rankings_alexa_rank_max: 56, # Integer | This parameter is used for finding stories from sources whose Alexa rank is less than or equal to the specified value. You can read more about working with Alexa ranks [here](https://newsapi.aylien.com/docs/working-with-alexa-ranks). 
  source_rankings_alexa_country: ['source_rankings_alexa_country_example'], # Array<String> | This parameter is used for finding stories from sources whose Alexa rank is in the specified country value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. You can read more about working with Alexa ranks [here](https://newsapi.aylien.com/docs/working-with-alexa-ranks). 
  social_shares_count_facebook_min: 56, # Integer | This parameter is used for finding stories whose Facebook social shares count is greater than or equal to the specified value. 
  social_shares_count_facebook_max: 56, # Integer | This parameter is used for finding stories whose Facebook social shares count is less than or equal to the specified value. 
  social_shares_count_google_plus_min: 56, # Integer | This parameter is used for finding stories whose Google+ social shares count is greater than or equal to the specified value. 
  social_shares_count_google_plus_max: 56, # Integer | This parameter is used for finding stories whose Google+ social shares count is less than or equal to the specified value. 
  social_shares_count_linkedin_min: 56, # Integer | This parameter is used for finding stories whose LinkedIn social shares count is greater than or equal to the specified value. 
  social_shares_count_linkedin_max: 56, # Integer | This parameter is used for finding stories whose LinkedIn social shares count is less than or equal to the specified value. 
  social_shares_count_reddit_min: 56, # Integer | This parameter is used for finding stories whose Reddit social shares count is greater than or equal to the specified value. 
  social_shares_count_reddit_max: 56, # Integer | This parameter is used for finding stories whose Reddit social shares count is less than or equal to the specified value. 
  clusters: ['clusters_example'], # Array<String> | This parameter is used for finding stories with belonging to one of clusters in a specific set of clusters You can read more about working with clustering [here](https://newsapi.aylien.com/docs/working-with-clustering). 
  _return: ['_return_example'], # Array<String> | This parameter is used for specifying return fields.
  story_id: 56, # Integer | A story id
  story_url: 'story_url_example', # String | An article or webpage
  story_title: 'story_title_example', # String | Title of the article
  story_body: 'story_body_example', # String | Body of the article
  story_published_at: DateTime.parse('2013-10-20T19:20:30+01:00'), # DateTime | Publish date of the article. If you use a url or title and body of an article for getting coverages, this parameter is required. The format used is a restricted form of the canonical representation of dateTime in the [XML Schema specification (ISO 8601)](https://www.w3.org/TR/xmlschema-2/#dateTime). 
  story_language: 'auto', # String | This parameter is used for setting the language of the story. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes. 
  per_page: 3 # Integer | This parameter is used for specifying number of items in each page. 
}

begin
  result = api_instance.list_coverages_post(opts)
  p result
rescue AylienNewsApi::ApiError => e
  puts "Exception when calling CoverageApi->list_coverages_post: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | [**Array&lt;Integer&gt;**](Integer.md)| This parameter is used for finding stories by story id.  | [optional] 
 **id2** | [**Array&lt;Integer&gt;**](Integer.md)| This parameter is used for excluding stories by story id.  | [optional] 
 **title** | **String**| This parameter is used for finding stories whose title contains a specific keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).  | [optional] 
 **body** | **String**| This parameter is used for finding stories whose body contains a specific keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).  | [optional] 
 **text** | **String**| This parameter is used for finding stories whose title or body contains a specific keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).  | [optional] 
 **translations_en_title** | **String**| This parameter is used for finding stories whose translation title contains a specific keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).  | [optional] 
 **translations_en_body** | **String**| This parameter is used for finding stories whose translation body contains a specific keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).  | [optional] 
 **translations_en_text** | **String**| This parameter is used for finding stories whose translation title or body contains a specific keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).  | [optional] 
 **links_permalink** | [**Array&lt;String&gt;**](String.md)| This parameter is used to find stories based on their url.  | [optional] 
 **links_permalink2** | [**Array&lt;String&gt;**](String.md)| This parameter is used to exclude stories based on their url.  | [optional] 
 **language** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose language is the specified value. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes.  | [optional] 
 **language2** | [**Array&lt;String&gt;**](String.md)| This parameter is used for excluding stories whose language is the specified value. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes.  | [optional] 
 **published_at_start** | **String**| This parameter is used for finding stories whose published at time is greater than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates).  | [optional] 
 **published_at_end** | **String**| This parameter is used for finding stories whose published at time is less than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates).  | [optional] 
 **categories_taxonomy** | **String**| This parameter is used for defining the type of the taxonomy for the rest of the categories queries. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).  | [optional] 
 **categories_confident** | **Boolean**| This parameter is used for finding stories whose categories are confident. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).  | [optional] [default to true]
 **categories_id** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories by categories id. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).  | [optional] 
 **categories_id2** | [**Array&lt;String&gt;**](String.md)| This parameter is used for excluding stories by categories id. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).  | [optional] 
 **categories_label** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories by categories label. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).  | [optional] 
 **categories_label2** | [**Array&lt;String&gt;**](String.md)| This parameter is used for excluding stories by categories label. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).  | [optional] 
 **categories_level** | [**Array&lt;Integer&gt;**](Integer.md)| This parameter is used for finding stories by categories level. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).  | [optional] 
 **categories_level2** | [**Array&lt;Integer&gt;**](Integer.md)| This parameter is used for excluding stories by categories level. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).  | [optional] 
 **entities_title_text** | [**Array&lt;String&gt;**](String.md)| This parameter is used to find stories based on the specified entities &#x60;text&#x60; in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **entities_title_text2** | [**Array&lt;String&gt;**](String.md)| This parameter is used to exclude stories based on the specified entities &#x60;text&#x60; in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **entities_title_type** | [**Array&lt;String&gt;**](String.md)| This parameter is used to find stories based on the specified entities &#x60;type&#x60; in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **entities_title_type2** | [**Array&lt;String&gt;**](String.md)| This parameter is used to exclude stories based on the specified entities &#x60;type&#x60; in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **entities_title_links_dbpedia** | [**Array&lt;String&gt;**](String.md)| This parameter is used to find stories based on the specified entities dbpedia URL in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **entities_title_links_dbpedia2** | [**Array&lt;String&gt;**](String.md)| This parameter is used to exclude stories based on the specified entities dbpedia URL in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **entities_body_text** | [**Array&lt;String&gt;**](String.md)| This parameter is used to find stories based on the specified entities &#x60;text&#x60; in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **entities_body_text2** | [**Array&lt;String&gt;**](String.md)| This parameter is used to exclude stories based on the specified entities &#x60;text&#x60; in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **entities_body_type** | [**Array&lt;String&gt;**](String.md)| This parameter is used to find stories based on the specified entities &#x60;type&#x60; in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **entities_body_type2** | [**Array&lt;String&gt;**](String.md)| This parameter is used to exclude stories based on the specified entities &#x60;type&#x60; in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **entities_body_links_dbpedia** | [**Array&lt;String&gt;**](String.md)| This parameter is used to find stories based on the specified entities dbpedia URL in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **entities_body_links_dbpedia2** | [**Array&lt;String&gt;**](String.md)| This parameter is used to exclude stories based on the specified entities dbpedia URL in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **sentiment_title_polarity** | **String**| This parameter is used for finding stories whose title sentiment is the specified value.  | [optional] 
 **sentiment_title_polarity2** | **String**| This parameter is used for excluding stories whose title sentiment is the specified value.  | [optional] 
 **sentiment_body_polarity** | **String**| This parameter is used for finding stories whose body sentiment is the specified value.  | [optional] 
 **sentiment_body_polarity2** | **String**| This parameter is used for excluding stories whose body sentiment is the specified value.  | [optional] 
 **media_images_count_min** | **Integer**| This parameter is used for finding stories whose number of images is greater than or equal to the specified value.  | [optional] 
 **media_images_count_max** | **Integer**| This parameter is used for finding stories whose number of images is less than or equal to the specified value.  | [optional] 
 **media_images_width_min** | **Integer**| This parameter is used for finding stories whose width of images are greater than or equal to the specified value.  | [optional] 
 **media_images_width_max** | **Integer**| This parameter is used for finding stories whose width of images are less than or equal to the specified value.  | [optional] 
 **media_images_height_min** | **Integer**| This parameter is used for finding stories whose height of images are greater than or equal to the specified value.  | [optional] 
 **media_images_height_max** | **Integer**| This parameter is used for finding stories whose height of images are less than or equal to the specified value.  | [optional] 
 **media_images_content_length_min** | **Integer**| This parameter is used for finding stories whose images content length are greater than or equal to the specified value.  | [optional] 
 **media_images_content_length_max** | **Integer**| This parameter is used for finding stories whose images content length are less than or equal to the specified value.  | [optional] 
 **media_images_format** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose images format are the specified value.  | [optional] 
 **media_images_format2** | [**Array&lt;String&gt;**](String.md)| This parameter is used for excluding stories whose images format are the specified value.  | [optional] 
 **media_videos_count_min** | **Integer**| This parameter is used for finding stories whose number of videos is greater than or equal to the specified value.  | [optional] 
 **media_videos_count_max** | **Integer**| This parameter is used for finding stories whose number of videos is less than or equal to the specified value.  | [optional] 
 **author_id** | [**Array&lt;Integer&gt;**](Integer.md)| This parameter is used for finding stories whose author id is the specified value.  | [optional] 
 **author_id2** | [**Array&lt;Integer&gt;**](Integer.md)| This parameter is used for excluding stories whose author id is the specified value.  | [optional] 
 **author_name** | **String**| This parameter is used for finding stories whose author full name contains the specified value.  | [optional] 
 **author_name2** | **String**| This parameter is used for excluding stories whose author full name contains the specified value.  | [optional] 
 **source_id** | [**Array&lt;Integer&gt;**](Integer.md)| This parameter is used for finding stories whose source id is the specified value.  | [optional] 
 **source_id2** | [**Array&lt;Integer&gt;**](Integer.md)| This parameter is used for excluding stories whose source id is the specified value.  | [optional] 
 **source_name** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source name contains the specified value.  | [optional] 
 **source_name2** | [**Array&lt;String&gt;**](String.md)| This parameter is used for excluding stories whose source name contains the specified value.  | [optional] 
 **source_domain** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source domain is the specified value.  | [optional] 
 **source_domain2** | [**Array&lt;String&gt;**](String.md)| This parameter is used for excluding stories whose source domain is the specified value.  | [optional] 
 **source_locations_country** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source country is the specified value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **source_locations_country2** | [**Array&lt;String&gt;**](String.md)| This parameter is used for excluding stories whose source country is the specified value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **source_locations_state** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source state/province is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **source_locations_state2** | [**Array&lt;String&gt;**](String.md)| This parameter is used for excluding stories whose source state/province is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **source_locations_city** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source city is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **source_locations_city2** | [**Array&lt;String&gt;**](String.md)| This parameter is used for excluding stories whose source city is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **source_scopes_country** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source scopes is the specified country value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **source_scopes_country2** | [**Array&lt;String&gt;**](String.md)| This parameter is used for excluding stories whose source scopes is the specified country value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **source_scopes_state** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source scopes is the specified state/province value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **source_scopes_state2** | [**Array&lt;String&gt;**](String.md)| This parameter is used for excluding stories whose source scopes is the specified state/province value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **source_scopes_city** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source scopes is the specified city value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **source_scopes_city2** | [**Array&lt;String&gt;**](String.md)| This parameter is used for excluding stories whose source scopes is the specified city value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **source_scopes_level** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source scopes is the specified level value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **source_scopes_level2** | [**Array&lt;String&gt;**](String.md)| This parameter is used for excluding stories whose source scopes is the specified level value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **source_links_in_count_min** | **Integer**| This parameter is used for finding stories from sources whose Links in count is greater than or equal to the specified value. You can read more about working with Links in count [here](https://newsapi.aylien.com/docs/working-with-links-in-count).  | [optional] 
 **source_links_in_count_max** | **Integer**| This parameter is used for finding stories from sources whose Links in count is less than or equal to the specified value. You can read more about working with Links in count [here](https://newsapi.aylien.com/docs/working-with-links-in-count).  | [optional] 
 **source_rankings_alexa_rank_min** | **Integer**| This parameter is used for finding stories from sources whose Alexa rank is greater than or equal to the specified value. You can read more about working with Alexa ranks [here](https://newsapi.aylien.com/docs/working-with-alexa-ranks).  | [optional] 
 **source_rankings_alexa_rank_max** | **Integer**| This parameter is used for finding stories from sources whose Alexa rank is less than or equal to the specified value. You can read more about working with Alexa ranks [here](https://newsapi.aylien.com/docs/working-with-alexa-ranks).  | [optional] 
 **source_rankings_alexa_country** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories from sources whose Alexa rank is in the specified country value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. You can read more about working with Alexa ranks [here](https://newsapi.aylien.com/docs/working-with-alexa-ranks).  | [optional] 
 **social_shares_count_facebook_min** | **Integer**| This parameter is used for finding stories whose Facebook social shares count is greater than or equal to the specified value.  | [optional] 
 **social_shares_count_facebook_max** | **Integer**| This parameter is used for finding stories whose Facebook social shares count is less than or equal to the specified value.  | [optional] 
 **social_shares_count_google_plus_min** | **Integer**| This parameter is used for finding stories whose Google+ social shares count is greater than or equal to the specified value.  | [optional] 
 **social_shares_count_google_plus_max** | **Integer**| This parameter is used for finding stories whose Google+ social shares count is less than or equal to the specified value.  | [optional] 
 **social_shares_count_linkedin_min** | **Integer**| This parameter is used for finding stories whose LinkedIn social shares count is greater than or equal to the specified value.  | [optional] 
 **social_shares_count_linkedin_max** | **Integer**| This parameter is used for finding stories whose LinkedIn social shares count is less than or equal to the specified value.  | [optional] 
 **social_shares_count_reddit_min** | **Integer**| This parameter is used for finding stories whose Reddit social shares count is greater than or equal to the specified value.  | [optional] 
 **social_shares_count_reddit_max** | **Integer**| This parameter is used for finding stories whose Reddit social shares count is less than or equal to the specified value.  | [optional] 
 **clusters** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories with belonging to one of clusters in a specific set of clusters You can read more about working with clustering [here](https://newsapi.aylien.com/docs/working-with-clustering).  | [optional] 
 **_return** | [**Array&lt;String&gt;**](String.md)| This parameter is used for specifying return fields. | [optional] 
 **story_id** | **Integer**| A story id | [optional] 
 **story_url** | **String**| An article or webpage | [optional] 
 **story_title** | **String**| Title of the article | [optional] 
 **story_body** | **String**| Body of the article | [optional] 
 **story_published_at** | **DateTime**| Publish date of the article. If you use a url or title and body of an article for getting coverages, this parameter is required. The format used is a restricted form of the canonical representation of dateTime in the [XML Schema specification (ISO 8601)](https://www.w3.org/TR/xmlschema-2/#dateTime).  | [optional] 
 **story_language** | **String**| This parameter is used for setting the language of the story. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes.  | [optional] [default to &#39;auto&#39;]
 **per_page** | **Integer**| This parameter is used for specifying number of items in each page.  | [optional] [default to 3]

### Return type

[**Coverages**](Coverages.md)

### Authorization

[app_id](../README.md#app_id), [app_key](../README.md#app_key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json, text/xml

