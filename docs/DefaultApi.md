# AylienNewsApi::DefaultApi

All URIs are relative to *https://api.newsapi.aylien.com/api/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**list_autocompletes**](DefaultApi.md#list_autocompletes) | **GET** /autocompletes | List autocompletes
[**list_coverages**](DefaultApi.md#list_coverages) | **POST** /coverages | List coverages
[**list_histograms**](DefaultApi.md#list_histograms) | **GET** /histograms | List histograms
[**list_related_stories**](DefaultApi.md#list_related_stories) | **POST** /related_stories | List related stories
[**list_stories**](DefaultApi.md#list_stories) | **GET** /stories | List Stories
[**list_time_series**](DefaultApi.md#list_time_series) | **GET** /time_series | List time series
[**list_trends**](DefaultApi.md#list_trends) | **GET** /trends | List trends


# **list_autocompletes**
> Autocompletes list_autocompletes(type, term, opts)

List autocompletes

This endpoint is used for getting list of autocompletes by providing a specific term and type.

### Example
```ruby
# load the gem
require 'aylien_news_api'

# setup authorization
AylienNewsApi.configure do |config|
  # Configure API key authorization: app_id
  config.api_key['X-AYLIEN-NewsAPI-Application-ID'] = 'YOUR APP ID'

  # Configure API key authorization: app_key
  config.api_key['X-AYLIEN-NewsAPI-Application-Key'] = 'YOUR APP KEY'
end

api_instance = AylienNewsApi::DefaultApi.new

type = "type_example" # String | This parameter is used for defining the type of autocompletes.

term = "term_example" # String | This parameter is used for finding autocomplete objects that contain the specified value.

opts = { 
  language: "en", # String | This parameter is used for autocompletes whose language is the specified value. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes.
  per_page: 3 # Integer | This parameter is used for specifying number of items in each page.
}

begin
  #List autocompletes
  result = api_instance.list_autocompletes(type, term, opts)
  p result
rescue AylienNewsApi::ApiError => e
  puts "Exception when calling DefaultApi->list_autocompletes: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **type** | **String**| This parameter is used for defining the type of autocompletes. | 
 **term** | **String**| This parameter is used for finding autocomplete objects that contain the specified value. | 
 **language** | **String**| This parameter is used for autocompletes whose language is the specified value. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes. | [optional] [default to en]
 **per_page** | **Integer**| This parameter is used for specifying number of items in each page. | [optional] [default to 3]

### Return type

[**Autocompletes**](Autocompletes.md)

### Authorization

[app_key](../README.md#app_key), [app_id](../README.md#app_id)

### HTTP request headers

 - **Content-Type**: application/x-www-form-urlencoded
 - **Accept**: application/json, text/xml



# **list_coverages**
> Coverages list_coverages(opts)

List coverages

This endpoint is used for finding story coverages based on the parameters provided. The maximum number of related stories returned is 100.

### Example
```ruby
# load the gem
require 'aylien_news_api'

# setup authorization
AylienNewsApi.configure do |config|
  # Configure API key authorization: app_id
  config.api_key['X-AYLIEN-NewsAPI-Application-ID'] = 'YOUR APP ID'

  # Configure API key authorization: app_key
  config.api_key['X-AYLIEN-NewsAPI-Application-Key'] = 'YOUR APP KEY'
end

api_instance = AylienNewsApi::DefaultApi.new

opts = { 
  id: [56], # Array<Integer> | This parameter is used for finding stroies by story id.
  title: "title_example", # String | This parameter is used for finding stories whose title contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
  body: "body_example", # String | This parameter is used for finding stories whose body contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
  text: "text_example", # String | This parameter is used for finding stories whose title or body contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
  language: ["language_example"], # Array<String> | This parameter is used for finding stories whose language is the specified value. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes.
  published_at_start: "published_at_start_example", # String | This parameter is used for finding stories whose published at time is greater than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates).
  published_at_end: "published_at_end_example", # String | This parameter is used for finding stories whose published at time is less than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates).
  categories_taxonomy: "categories_taxonomy_example", # String | This parameter is used for defining the type of the taxonomy for the rest of the categories queries.
  categories_confident: true, # BOOLEAN | This parameter is used for finding stories whose categories are confident.
  categories_id: ["categories_id_example"], # Array<String> | This parameter is used for finding stories by categories id.
  categories_level: [56], # Array<Integer> | This parameter is used for finding stories by categories level.
  entities_title_text: ["entities_title_text_example"], # Array<String> | This parameter is used to find stories based on the specified entities `text` in story titles.
  entities_title_type: ["entities_title_type_example"], # Array<String> | This parameter is used to find stories based on the specified entities `type` in story titles.
  entities_title_links_dbpedia: ["entities_title_links_dbpedia_example"], # Array<String> | This parameter is used to find stories based on the specified entities dbpedia URL in story titles.
  entities_body_text: ["entities_body_text_example"], # Array<String> | This parameter is used to find stories based on the specified entities `text` in the body of stories.
  entities_body_type: ["entities_body_type_example"], # Array<String> | This parameter is used to find stories based on the specified entities `type` in the body of stories.
  entities_body_links_dbpedia: ["entities_body_links_dbpedia_example"], # Array<String> | This parameter is used to find stories based on the specified entities dbpedia URL in the body of stories.
  sentiment_title_polarity: "sentiment_title_polarity_example", # String | This parameter is used for finding stories whose title sentiment is the specified value.
  sentiment_body_polarity: "sentiment_body_polarity_example", # String | This parameter is used for finding stories whose body sentiment is the specified value.
  media_images_count_min: 56, # Integer | This parameter is used for finding stories whose number of images is greater than or equal to the specified value.
  media_images_count_max: 56, # Integer | This parameter is used for finding stories whose number of images is less than or equal to the specified value.
  media_videos_count_min: 56, # Integer | This parameter is used for finding stories whose number of videos is greater than or equal to the specified value.
  media_videos_count_max: 56, # Integer | This parameter is used for finding stories whose number of videos is less than or equal to the specified value.
  author_id: [56], # Array<Integer> | This parameter is used for finding stories whose author id is the specified value.
  author_name: "author_name_example", # String | This parameter is used for finding stories whose author full name contains the specified value.
  source_id: [56], # Array<Integer> | This parameter is used for finding stories whose source id is the specified value.
  source_name: ["source_name_example"], # Array<String> | This parameter is used for finding stories whose source name contains the specified value.
  source_domain: ["source_domain_example"], # Array<String> | This parameter is used for finding stories whose source domain is the specified value.
  source_locations_country: ["source_locations_country_example"], # Array<String> | This parameter is used for finding stories whose source country is the specified value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
  source_locations_state: ["source_locations_state_example"], # Array<String> | This parameter is used for finding stories whose source state/province is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
  source_locations_city: ["source_locations_city_example"], # Array<String> | This parameter is used for finding stories whose source city is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
  source_scopes_country: ["source_scopes_country_example"], # Array<String> | This parameter is used for finding stories whose source scopes  is the specified country value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
  source_scopes_state: ["source_scopes_state_example"], # Array<String> | This parameter is used for finding stories whose source scopes is the specified state/province value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
  source_scopes_city: ["source_scopes_city_example"], # Array<String> | This parameter is used for finding stories whose source scopes is the specified city value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
  source_scopes_level: ["source_scopes_level_example"], # Array<String> | This parameter is used for finding stories whose source scopes  is the specified level value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
  cluster: false, # BOOLEAN | This parameter enables clustering for the returned stories.
  cluster_algorithm: "lingo", # String | This parameter is used for specifying the clustering algorithm you wish to use. It supprts STC, Lingo and [k-means](https://en.wikipedia.org/wiki/K-means_clustering) algorithms.
  _return: ["_return_example"], # Array<String> | This parameter is used for specifying return fields.
  story_id: 789, # Integer | A story id
  story_url: "story_url_example", # String | An article or webpage
  story_title: "story_title_example", # String | Title of the article
  story_body: "story_body_example", # String | Body of the article
  story_published_at: DateTime.parse("2013-10-20T19:20:30+01:00"), # DateTime | Publish date of the article. If you use a url or title and body of an article for getting coverages, this parameter is required. The format used is a restricted form of the canonical representation of dateTime in the [XML Schema specification (ISO 8601)](https://www.w3.org/TR/xmlschema-2/#dateTime).
  story_language: "auto", # String | This parameter is used for setting the language of the story. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes.
  per_page: 3 # Integer | This parameter is used for specifying number of items in each page.
}

begin
  #List coverages
  result = api_instance.list_coverages(opts)
  p result
rescue AylienNewsApi::ApiError => e
  puts "Exception when calling DefaultApi->list_coverages: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | [**Array&lt;Integer&gt;**](Integer.md)| This parameter is used for finding stroies by story id. | [optional] 
 **title** | **String**| This parameter is used for finding stories whose title contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators). | [optional] 
 **body** | **String**| This parameter is used for finding stories whose body contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators). | [optional] 
 **text** | **String**| This parameter is used for finding stories whose title or body contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators). | [optional] 
 **language** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose language is the specified value. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes. | [optional] 
 **published_at_start** | **String**| This parameter is used for finding stories whose published at time is greater than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates). | [optional] 
 **published_at_end** | **String**| This parameter is used for finding stories whose published at time is less than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates). | [optional] 
 **categories_taxonomy** | **String**| This parameter is used for defining the type of the taxonomy for the rest of the categories queries. | [optional] 
 **categories_confident** | **BOOLEAN**| This parameter is used for finding stories whose categories are confident. | [optional] [default to true]
 **categories_id** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories by categories id. | [optional] 
 **categories_level** | [**Array&lt;Integer&gt;**](Integer.md)| This parameter is used for finding stories by categories level. | [optional] 
 **entities_title_text** | [**Array&lt;String&gt;**](String.md)| This parameter is used to find stories based on the specified entities &#x60;text&#x60; in story titles. | [optional] 
 **entities_title_type** | [**Array&lt;String&gt;**](String.md)| This parameter is used to find stories based on the specified entities &#x60;type&#x60; in story titles. | [optional] 
 **entities_title_links_dbpedia** | [**Array&lt;String&gt;**](String.md)| This parameter is used to find stories based on the specified entities dbpedia URL in story titles. | [optional] 
 **entities_body_text** | [**Array&lt;String&gt;**](String.md)| This parameter is used to find stories based on the specified entities &#x60;text&#x60; in the body of stories. | [optional] 
 **entities_body_type** | [**Array&lt;String&gt;**](String.md)| This parameter is used to find stories based on the specified entities &#x60;type&#x60; in the body of stories. | [optional] 
 **entities_body_links_dbpedia** | [**Array&lt;String&gt;**](String.md)| This parameter is used to find stories based on the specified entities dbpedia URL in the body of stories. | [optional] 
 **sentiment_title_polarity** | **String**| This parameter is used for finding stories whose title sentiment is the specified value. | [optional] 
 **sentiment_body_polarity** | **String**| This parameter is used for finding stories whose body sentiment is the specified value. | [optional] 
 **media_images_count_min** | **Integer**| This parameter is used for finding stories whose number of images is greater than or equal to the specified value. | [optional] 
 **media_images_count_max** | **Integer**| This parameter is used for finding stories whose number of images is less than or equal to the specified value. | [optional] 
 **media_videos_count_min** | **Integer**| This parameter is used for finding stories whose number of videos is greater than or equal to the specified value. | [optional] 
 **media_videos_count_max** | **Integer**| This parameter is used for finding stories whose number of videos is less than or equal to the specified value. | [optional] 
 **author_id** | [**Array&lt;Integer&gt;**](Integer.md)| This parameter is used for finding stories whose author id is the specified value. | [optional] 
 **author_name** | **String**| This parameter is used for finding stories whose author full name contains the specified value. | [optional] 
 **source_id** | [**Array&lt;Integer&gt;**](Integer.md)| This parameter is used for finding stories whose source id is the specified value. | [optional] 
 **source_name** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source name contains the specified value. | [optional] 
 **source_domain** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source domain is the specified value. | [optional] 
 **source_locations_country** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source country is the specified value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). | [optional] 
 **source_locations_state** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source state/province is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). | [optional] 
 **source_locations_city** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source city is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). | [optional] 
 **source_scopes_country** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source scopes  is the specified country value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). | [optional] 
 **source_scopes_state** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source scopes is the specified state/province value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). | [optional] 
 **source_scopes_city** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source scopes is the specified city value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). | [optional] 
 **source_scopes_level** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source scopes  is the specified level value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). | [optional] 
 **cluster** | **BOOLEAN**| This parameter enables clustering for the returned stories. | [optional] [default to false]
 **cluster_algorithm** | **String**| This parameter is used for specifying the clustering algorithm you wish to use. It supprts STC, Lingo and [k-means](https://en.wikipedia.org/wiki/K-means_clustering) algorithms. | [optional] [default to lingo]
 **_return** | [**Array&lt;String&gt;**](String.md)| This parameter is used for specifying return fields. | [optional] 
 **story_id** | **Integer**| A story id | [optional] 
 **story_url** | **String**| An article or webpage | [optional] 
 **story_title** | **String**| Title of the article | [optional] 
 **story_body** | **String**| Body of the article | [optional] 
 **story_published_at** | **DateTime**| Publish date of the article. If you use a url or title and body of an article for getting coverages, this parameter is required. The format used is a restricted form of the canonical representation of dateTime in the [XML Schema specification (ISO 8601)](https://www.w3.org/TR/xmlschema-2/#dateTime). | [optional] 
 **story_language** | **String**| This parameter is used for setting the language of the story. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes. | [optional] [default to auto]
 **per_page** | **Integer**| This parameter is used for specifying number of items in each page. | [optional] [default to 3]

### Return type

[**Coverages**](Coverages.md)

### Authorization

[app_key](../README.md#app_key), [app_id](../README.md#app_id)

### HTTP request headers

 - **Content-Type**: application/x-www-form-urlencoded
 - **Accept**: application/json, text/xml



# **list_histograms**
> Histograms list_histograms(opts)

List histograms

This endpoint is used for getting histograms based on the `field` parameter passed to the API.

### Example
```ruby
# load the gem
require 'aylien_news_api'

# setup authorization
AylienNewsApi.configure do |config|
  # Configure API key authorization: app_id
  config.api_key['X-AYLIEN-NewsAPI-Application-ID'] = 'YOUR APP ID'

  # Configure API key authorization: app_key
  config.api_key['X-AYLIEN-NewsAPI-Application-Key'] = 'YOUR APP KEY'
end

api_instance = AylienNewsApi::DefaultApi.new

opts = { 
  id: [56], # Array<Integer> | This parameter is used for finding stroies by story id.
  title: "title_example", # String | This parameter is used for finding stories whose title contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
  body: "body_example", # String | This parameter is used for finding stories whose body contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
  text: "text_example", # String | This parameter is used for finding stories whose title or body contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
  language: ["language_example"], # Array<String> | This parameter is used for finding stories whose language is the specified value. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes.
  published_at_start: "published_at_start_example", # String | This parameter is used for finding stories whose published at time is greater than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates).
  published_at_end: "published_at_end_example", # String | This parameter is used for finding stories whose published at time is less than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates).
  categories_taxonomy: "categories_taxonomy_example", # String | This parameter is used for defining the type of the taxonomy for the rest of the categories queries.
  categories_confident: true, # BOOLEAN | This parameter is used for finding stories whose categories are confident.
  categories_id: ["categories_id_example"], # Array<String> | This parameter is used for finding stories by categories id.
  categories_level: [56], # Array<Integer> | This parameter is used for finding stories by categories level.
  entities_title_text: ["entities_title_text_example"], # Array<String> | This parameter is used to find stories based on the specified entities `text` in story titles.
  entities_title_type: ["entities_title_type_example"], # Array<String> | This parameter is used to find stories based on the specified entities `type` in story titles.
  entities_title_links_dbpedia: ["entities_title_links_dbpedia_example"], # Array<String> | This parameter is used to find stories based on the specified entities dbpedia URL in story titles.
  entities_body_text: ["entities_body_text_example"], # Array<String> | This parameter is used to find stories based on the specified entities `text` in the body of stories.
  entities_body_type: ["entities_body_type_example"], # Array<String> | This parameter is used to find stories based on the specified entities `type` in the body of stories.
  entities_body_links_dbpedia: ["entities_body_links_dbpedia_example"], # Array<String> | This parameter is used to find stories based on the specified entities dbpedia URL in the body of stories.
  sentiment_title_polarity: "sentiment_title_polarity_example", # String | This parameter is used for finding stories whose title sentiment is the specified value.
  sentiment_body_polarity: "sentiment_body_polarity_example", # String | This parameter is used for finding stories whose body sentiment is the specified value.
  media_images_count_min: 56, # Integer | This parameter is used for finding stories whose number of images is greater than or equal to the specified value.
  media_images_count_max: 56, # Integer | This parameter is used for finding stories whose number of images is less than or equal to the specified value.
  media_videos_count_min: 56, # Integer | This parameter is used for finding stories whose number of videos is greater than or equal to the specified value.
  media_videos_count_max: 56, # Integer | This parameter is used for finding stories whose number of videos is less than or equal to the specified value.
  author_id: [56], # Array<Integer> | This parameter is used for finding stories whose author id is the specified value.
  author_name: "author_name_example", # String | This parameter is used for finding stories whose author full name contains the specified value.
  source_id: [56], # Array<Integer> | This parameter is used for finding stories whose source id is the specified value.
  source_name: ["source_name_example"], # Array<String> | This parameter is used for finding stories whose source name contains the specified value.
  source_domain: ["source_domain_example"], # Array<String> | This parameter is used for finding stories whose source domain is the specified value.
  source_locations_country: ["source_locations_country_example"], # Array<String> | This parameter is used for finding stories whose source country is the specified value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
  source_locations_state: ["source_locations_state_example"], # Array<String> | This parameter is used for finding stories whose source state/province is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
  source_locations_city: ["source_locations_city_example"], # Array<String> | This parameter is used for finding stories whose source city is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
  source_scopes_country: ["source_scopes_country_example"], # Array<String> | This parameter is used for finding stories whose source scopes is the specified country value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
  source_scopes_state: ["source_scopes_state_example"], # Array<String> | This parameter is used for finding stories whose source scopes is the specified state/province value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
  source_scopes_city: ["source_scopes_city_example"], # Array<String> | This parameter is used for finding stories whose source scopes is the specified city value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
  source_scopes_level: ["source_scopes_level_example"], # Array<String> | This parameter is used for finding stories whose source scopes is the specified level value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
  interval_start: 56, # Integer | This parameter is used for setting the start data point of histogram intervals.
  interval_end: 56, # Integer | This parameter is used for setting the end data point of histogram intervals.
  interval_width: 56, # Integer | This parameter is used for setting the width of histogram intervals.
  field: "social_shares_count" # String | This parameter is used for specifying the y-axis variable for the histogram.
}

begin
  #List histograms
  result = api_instance.list_histograms(opts)
  p result
rescue AylienNewsApi::ApiError => e
  puts "Exception when calling DefaultApi->list_histograms: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | [**Array&lt;Integer&gt;**](Integer.md)| This parameter is used for finding stroies by story id. | [optional] 
 **title** | **String**| This parameter is used for finding stories whose title contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators). | [optional] 
 **body** | **String**| This parameter is used for finding stories whose body contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators). | [optional] 
 **text** | **String**| This parameter is used for finding stories whose title or body contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators). | [optional] 
 **language** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose language is the specified value. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes. | [optional] 
 **published_at_start** | **String**| This parameter is used for finding stories whose published at time is greater than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates). | [optional] 
 **published_at_end** | **String**| This parameter is used for finding stories whose published at time is less than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates). | [optional] 
 **categories_taxonomy** | **String**| This parameter is used for defining the type of the taxonomy for the rest of the categories queries. | [optional] 
 **categories_confident** | **BOOLEAN**| This parameter is used for finding stories whose categories are confident. | [optional] [default to true]
 **categories_id** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories by categories id. | [optional] 
 **categories_level** | [**Array&lt;Integer&gt;**](Integer.md)| This parameter is used for finding stories by categories level. | [optional] 
 **entities_title_text** | [**Array&lt;String&gt;**](String.md)| This parameter is used to find stories based on the specified entities &#x60;text&#x60; in story titles. | [optional] 
 **entities_title_type** | [**Array&lt;String&gt;**](String.md)| This parameter is used to find stories based on the specified entities &#x60;type&#x60; in story titles. | [optional] 
 **entities_title_links_dbpedia** | [**Array&lt;String&gt;**](String.md)| This parameter is used to find stories based on the specified entities dbpedia URL in story titles. | [optional] 
 **entities_body_text** | [**Array&lt;String&gt;**](String.md)| This parameter is used to find stories based on the specified entities &#x60;text&#x60; in the body of stories. | [optional] 
 **entities_body_type** | [**Array&lt;String&gt;**](String.md)| This parameter is used to find stories based on the specified entities &#x60;type&#x60; in the body of stories. | [optional] 
 **entities_body_links_dbpedia** | [**Array&lt;String&gt;**](String.md)| This parameter is used to find stories based on the specified entities dbpedia URL in the body of stories. | [optional] 
 **sentiment_title_polarity** | **String**| This parameter is used for finding stories whose title sentiment is the specified value. | [optional] 
 **sentiment_body_polarity** | **String**| This parameter is used for finding stories whose body sentiment is the specified value. | [optional] 
 **media_images_count_min** | **Integer**| This parameter is used for finding stories whose number of images is greater than or equal to the specified value. | [optional] 
 **media_images_count_max** | **Integer**| This parameter is used for finding stories whose number of images is less than or equal to the specified value. | [optional] 
 **media_videos_count_min** | **Integer**| This parameter is used for finding stories whose number of videos is greater than or equal to the specified value. | [optional] 
 **media_videos_count_max** | **Integer**| This parameter is used for finding stories whose number of videos is less than or equal to the specified value. | [optional] 
 **author_id** | [**Array&lt;Integer&gt;**](Integer.md)| This parameter is used for finding stories whose author id is the specified value. | [optional] 
 **author_name** | **String**| This parameter is used for finding stories whose author full name contains the specified value. | [optional] 
 **source_id** | [**Array&lt;Integer&gt;**](Integer.md)| This parameter is used for finding stories whose source id is the specified value. | [optional] 
 **source_name** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source name contains the specified value. | [optional] 
 **source_domain** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source domain is the specified value. | [optional] 
 **source_locations_country** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source country is the specified value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). | [optional] 
 **source_locations_state** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source state/province is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). | [optional] 
 **source_locations_city** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source city is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). | [optional] 
 **source_scopes_country** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source scopes is the specified country value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). | [optional] 
 **source_scopes_state** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source scopes is the specified state/province value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). | [optional] 
 **source_scopes_city** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source scopes is the specified city value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). | [optional] 
 **source_scopes_level** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source scopes is the specified level value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). | [optional] 
 **interval_start** | **Integer**| This parameter is used for setting the start data point of histogram intervals. | [optional] 
 **interval_end** | **Integer**| This parameter is used for setting the end data point of histogram intervals. | [optional] 
 **interval_width** | **Integer**| This parameter is used for setting the width of histogram intervals. | [optional] 
 **field** | **String**| This parameter is used for specifying the y-axis variable for the histogram. | [optional] [default to social_shares_count]

### Return type

[**Histograms**](Histograms.md)

### Authorization

[app_key](../README.md#app_key), [app_id](../README.md#app_id)

### HTTP request headers

 - **Content-Type**: application/x-www-form-urlencoded
 - **Accept**: application/json, text/xml



# **list_related_stories**
> RelatedStories list_related_stories(opts)

List related stories

This endpoint is used for finding related stories based on the parameters provided. The maximum number of related stories returned is 100.

### Example
```ruby
# load the gem
require 'aylien_news_api'

# setup authorization
AylienNewsApi.configure do |config|
  # Configure API key authorization: app_id
  config.api_key['X-AYLIEN-NewsAPI-Application-ID'] = 'YOUR APP ID'

  # Configure API key authorization: app_key
  config.api_key['X-AYLIEN-NewsAPI-Application-Key'] = 'YOUR APP KEY'
end

api_instance = AylienNewsApi::DefaultApi.new

opts = { 
  id: [56], # Array<Integer> | This parameter is used for finding stroies by story id.
  title: "title_example", # String | This parameter is used for finding stories whose title contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
  body: "body_example", # String | This parameter is used for finding stories whose body contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
  text: "text_example", # String | This parameter is used for finding stories whose title or body contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
  language: ["language_example"], # Array<String> | This parameter is used for finding stories whose language is the specified value. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes.
  published_at_start: "published_at_start_example", # String | This parameter is used for finding stories whose published at time is greater than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates).
  published_at_end: "published_at_end_example", # String | This parameter is used for finding stories whose published at time is less than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates).
  categories_taxonomy: "categories_taxonomy_example", # String | This parameter is used for defining the type of the taxonomy for the rest of the categories queries.
  categories_confident: true, # BOOLEAN | This parameter is used for finding stories whose categories are confident.
  categories_id: ["categories_id_example"], # Array<String> | This parameter is used for finding stories by categories id.
  categories_level: [56], # Array<Integer> | This parameter is used for finding stories by categories level.
  entities_title_text: ["entities_title_text_example"], # Array<String> | This parameter is used to find stories based on the specified entities `text` in story titles.
  entities_title_type: ["entities_title_type_example"], # Array<String> | This parameter is used to find stories based on the specified entities `type` in story titles.
  entities_title_links_dbpedia: ["entities_title_links_dbpedia_example"], # Array<String> | This parameter is used to find stories based on the specified entities dbpedia URL in story titles.
  entities_body_text: ["entities_body_text_example"], # Array<String> | This parameter is used to find stories based on the specified entities `text` in the body of stories.
  entities_body_type: ["entities_body_type_example"], # Array<String> | This parameter is used to find stories based on the specified entities `type` in the body of stories.
  entities_body_links_dbpedia: ["entities_body_links_dbpedia_example"], # Array<String> | This parameter is used to find stories based on the specified entities dbpedia URL in the body of stories.
  sentiment_title_polarity: "sentiment_title_polarity_example", # String | This parameter is used for finding stories whose title sentiment is the specified value.
  sentiment_body_polarity: "sentiment_body_polarity_example", # String | This parameter is used for finding stories whose body sentiment is the specified value.
  media_images_count_min: 56, # Integer | This parameter is used for finding stories whose number of images is greater than or equal to the specified value.
  media_images_count_max: 56, # Integer | This parameter is used for finding stories whose number of images is less than or equal to the specified value.
  media_videos_count_min: 56, # Integer | This parameter is used for finding stories whose number of videos is greater than or equal to the specified value.
  media_videos_count_max: 56, # Integer | This parameter is used for finding stories whose number of videos is less than or equal to the specified value.
  author_id: [56], # Array<Integer> | This parameter is used for finding stories whose author id is the specified value.
  author_name: "author_name_example", # String | This parameter is used for finding stories whose author full name contains the specified value.
  source_id: [56], # Array<Integer> | This parameter is used for finding stories whose source id is the specified value.
  source_name: ["source_name_example"], # Array<String> | This parameter is used for finding stories whose source name contains the specified value.
  source_domain: ["source_domain_example"], # Array<String> | This parameter is used for finding stories whose source domain is the specified value.
  source_locations_country: ["source_locations_country_example"], # Array<String> | This parameter is used for finding stories whose source country is the specified value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
  source_locations_state: ["source_locations_state_example"], # Array<String> | This parameter is used for finding stories whose source state/province is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
  source_locations_city: ["source_locations_city_example"], # Array<String> | This parameter is used for finding stories whose source city is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
  source_scopes_country: ["source_scopes_country_example"], # Array<String> | This parameter is used for finding stories whose source scopes  is the specified country value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
  source_scopes_state: ["source_scopes_state_example"], # Array<String> | This parameter is used for finding stories whose source scopes is the specified state/province value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
  source_scopes_city: ["source_scopes_city_example"], # Array<String> | This parameter is used for finding stories whose source scopes is the specified city value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
  source_scopes_level: ["source_scopes_level_example"], # Array<String> | This parameter is used for finding stories whose source scopes  is the specified level value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
  cluster: false, # BOOLEAN | This parameter enables clustering for the returned stories.
  cluster_algorithm: "lingo", # String | This parameter is used for specifying the clustering algorithm you wish to use. It supprts STC, Lingo and [k-means](https://en.wikipedia.org/wiki/K-means_clustering) algorithms.
  _return: ["_return_example"], # Array<String> | This parameter is used for specifying return fields.
  story_id: 789, # Integer | A story id
  story_url: "story_url_example", # String | An article or webpage
  story_title: "story_title_example", # String | Title of the article
  story_body: "story_body_example", # String | Body of the article
  boost_by: "boost_by_example", # String | This parameter is used for boosting the result by the specified value.
  story_language: "auto", # String | This parameter is used for setting the language of the story. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes.
  per_page: 3 # Integer | This parameter is used for specifying number of items in each page.
}

begin
  #List related stories
  result = api_instance.list_related_stories(opts)
  p result
rescue AylienNewsApi::ApiError => e
  puts "Exception when calling DefaultApi->list_related_stories: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | [**Array&lt;Integer&gt;**](Integer.md)| This parameter is used for finding stroies by story id. | [optional] 
 **title** | **String**| This parameter is used for finding stories whose title contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators). | [optional] 
 **body** | **String**| This parameter is used for finding stories whose body contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators). | [optional] 
 **text** | **String**| This parameter is used for finding stories whose title or body contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators). | [optional] 
 **language** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose language is the specified value. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes. | [optional] 
 **published_at_start** | **String**| This parameter is used for finding stories whose published at time is greater than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates). | [optional] 
 **published_at_end** | **String**| This parameter is used for finding stories whose published at time is less than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates). | [optional] 
 **categories_taxonomy** | **String**| This parameter is used for defining the type of the taxonomy for the rest of the categories queries. | [optional] 
 **categories_confident** | **BOOLEAN**| This parameter is used for finding stories whose categories are confident. | [optional] [default to true]
 **categories_id** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories by categories id. | [optional] 
 **categories_level** | [**Array&lt;Integer&gt;**](Integer.md)| This parameter is used for finding stories by categories level. | [optional] 
 **entities_title_text** | [**Array&lt;String&gt;**](String.md)| This parameter is used to find stories based on the specified entities &#x60;text&#x60; in story titles. | [optional] 
 **entities_title_type** | [**Array&lt;String&gt;**](String.md)| This parameter is used to find stories based on the specified entities &#x60;type&#x60; in story titles. | [optional] 
 **entities_title_links_dbpedia** | [**Array&lt;String&gt;**](String.md)| This parameter is used to find stories based on the specified entities dbpedia URL in story titles. | [optional] 
 **entities_body_text** | [**Array&lt;String&gt;**](String.md)| This parameter is used to find stories based on the specified entities &#x60;text&#x60; in the body of stories. | [optional] 
 **entities_body_type** | [**Array&lt;String&gt;**](String.md)| This parameter is used to find stories based on the specified entities &#x60;type&#x60; in the body of stories. | [optional] 
 **entities_body_links_dbpedia** | [**Array&lt;String&gt;**](String.md)| This parameter is used to find stories based on the specified entities dbpedia URL in the body of stories. | [optional] 
 **sentiment_title_polarity** | **String**| This parameter is used for finding stories whose title sentiment is the specified value. | [optional] 
 **sentiment_body_polarity** | **String**| This parameter is used for finding stories whose body sentiment is the specified value. | [optional] 
 **media_images_count_min** | **Integer**| This parameter is used for finding stories whose number of images is greater than or equal to the specified value. | [optional] 
 **media_images_count_max** | **Integer**| This parameter is used for finding stories whose number of images is less than or equal to the specified value. | [optional] 
 **media_videos_count_min** | **Integer**| This parameter is used for finding stories whose number of videos is greater than or equal to the specified value. | [optional] 
 **media_videos_count_max** | **Integer**| This parameter is used for finding stories whose number of videos is less than or equal to the specified value. | [optional] 
 **author_id** | [**Array&lt;Integer&gt;**](Integer.md)| This parameter is used for finding stories whose author id is the specified value. | [optional] 
 **author_name** | **String**| This parameter is used for finding stories whose author full name contains the specified value. | [optional] 
 **source_id** | [**Array&lt;Integer&gt;**](Integer.md)| This parameter is used for finding stories whose source id is the specified value. | [optional] 
 **source_name** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source name contains the specified value. | [optional] 
 **source_domain** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source domain is the specified value. | [optional] 
 **source_locations_country** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source country is the specified value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). | [optional] 
 **source_locations_state** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source state/province is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). | [optional] 
 **source_locations_city** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source city is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). | [optional] 
 **source_scopes_country** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source scopes  is the specified country value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). | [optional] 
 **source_scopes_state** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source scopes is the specified state/province value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). | [optional] 
 **source_scopes_city** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source scopes is the specified city value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). | [optional] 
 **source_scopes_level** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source scopes  is the specified level value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). | [optional] 
 **cluster** | **BOOLEAN**| This parameter enables clustering for the returned stories. | [optional] [default to false]
 **cluster_algorithm** | **String**| This parameter is used for specifying the clustering algorithm you wish to use. It supprts STC, Lingo and [k-means](https://en.wikipedia.org/wiki/K-means_clustering) algorithms. | [optional] [default to lingo]
 **_return** | [**Array&lt;String&gt;**](String.md)| This parameter is used for specifying return fields. | [optional] 
 **story_id** | **Integer**| A story id | [optional] 
 **story_url** | **String**| An article or webpage | [optional] 
 **story_title** | **String**| Title of the article | [optional] 
 **story_body** | **String**| Body of the article | [optional] 
 **boost_by** | **String**| This parameter is used for boosting the result by the specified value. | [optional] 
 **story_language** | **String**| This parameter is used for setting the language of the story. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes. | [optional] [default to auto]
 **per_page** | **Integer**| This parameter is used for specifying number of items in each page. | [optional] [default to 3]

### Return type

[**RelatedStories**](RelatedStories.md)

### Authorization

[app_key](../README.md#app_key), [app_id](../README.md#app_id)

### HTTP request headers

 - **Content-Type**: application/x-www-form-urlencoded
 - **Accept**: application/json, text/xml



# **list_stories**
> Stories list_stories(opts)

List Stories

This endpoint is used for getting a list of stories.

### Example
```ruby
# load the gem
require 'aylien_news_api'

# setup authorization
AylienNewsApi.configure do |config|
  # Configure API key authorization: app_id
  config.api_key['X-AYLIEN-NewsAPI-Application-ID'] = 'YOUR APP ID'

  # Configure API key authorization: app_key
  config.api_key['X-AYLIEN-NewsAPI-Application-Key'] = 'YOUR APP KEY'
end

api_instance = AylienNewsApi::DefaultApi.new

opts = { 
  id: [56], # Array<Integer> | This parameter is used for finding stroies by story id.
  title: "title_example", # String | This parameter is used for finding stories whose title contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
  body: "body_example", # String | This parameter is used for finding stories whose body contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
  text: "text_example", # String | This parameter is used for finding stories whose title or body contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
  language: ["language_example"], # Array<String> | This parameter is used for finding stories whose language is the specified value. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes.
  published_at_start: "published_at_start_example", # String | This parameter is used for finding stories whose published at time is greater than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates).
  published_at_end: "published_at_end_example", # String | This parameter is used for finding stories whose published at time is less than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates).
  categories_taxonomy: "categories_taxonomy_example", # String | This parameter is used for defining the type of the taxonomy for the rest of the categories queries.
  categories_confident: true, # BOOLEAN | This parameter is used for finding stories whose categories are confident.
  categories_id: ["categories_id_example"], # Array<String> | This parameter is used for finding stories by categories id.
  categories_level: [56], # Array<Integer> | This parameter is used for finding stories by categories level.
  entities_title_text: ["entities_title_text_example"], # Array<String> | This parameter is used to find stories based on the specified entities `text` in story titles.
  entities_title_type: ["entities_title_type_example"], # Array<String> | This parameter is used to find stories based on the specified entities `type` in story titles.
  entities_title_links_dbpedia: ["entities_title_links_dbpedia_example"], # Array<String> | This parameter is used to find stories based on the specified entities dbpedia URL in story titles.
  entities_body_text: ["entities_body_text_example"], # Array<String> | This parameter is used to find stories based on the specified entities `text` in the body of stories.
  entities_body_type: ["entities_body_type_example"], # Array<String> | This parameter is used to find stories based on the specified entities `type` in the body of stories.
  entities_body_links_dbpedia: ["entities_body_links_dbpedia_example"], # Array<String> | This parameter is used to find stories based on the specified entities dbpedia URL in the body of stories.
  sentiment_title_polarity: "sentiment_title_polarity_example", # String | This parameter is used for finding stories whose title sentiment is the specified value.
  sentiment_body_polarity: "sentiment_body_polarity_example", # String | This parameter is used for finding stories whose body sentiment is the specified value.
  media_images_count_min: 56, # Integer | This parameter is used for finding stories whose number of images is greater than or equal to the specified value.
  media_images_count_max: 56, # Integer | This parameter is used for finding stories whose number of images is less than or equal to the specified value.
  media_videos_count_min: 56, # Integer | This parameter is used for finding stories whose number of videos is greater than or equal to the specified value.
  media_videos_count_max: 56, # Integer | This parameter is used for finding stories whose number of videos is less than or equal to the specified value.
  author_id: [56], # Array<Integer> | This parameter is used for finding stories whose author id is the specified value.
  author_name: "author_name_example", # String | This parameter is used for finding stories whose author full name contains the specified value.
  source_id: [56], # Array<Integer> | This parameter is used for finding stories whose source id is the specified value.
  source_name: ["source_name_example"], # Array<String> | This parameter is used for finding stories whose source name contains the specified value.
  source_domain: ["source_domain_example"], # Array<String> | This parameter is used for finding stories whose source domain is the specified value.
  source_locations_country: ["source_locations_country_example"], # Array<String> | This parameter is used for finding stories whose source country is the specified value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
  source_locations_state: ["source_locations_state_example"], # Array<String> | This parameter is used for finding stories whose source state/province is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
  source_locations_city: ["source_locations_city_example"], # Array<String> | This parameter is used for finding stories whose source city is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
  source_scopes_country: ["source_scopes_country_example"], # Array<String> | This parameter is used for finding stories whose source scopes is the specified country value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
  source_scopes_state: ["source_scopes_state_example"], # Array<String> | This parameter is used for finding stories whose source scopes is the specified state/province value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
  source_scopes_city: ["source_scopes_city_example"], # Array<String> | This parameter is used for finding stories whose source scopes is the specified city value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
  source_scopes_level: ["source_scopes_level_example"], # Array<String> | This parameter is used for finding stories whose source scopes is the specified level value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
  cluster: false, # BOOLEAN | This parameter enables clustering for the returned stories.
  cluster_algorithm: "lingo", # String | This parameter is used for specifying the clustering algorithm you wish to use. It supprts STC, Lingo and [k-means](https://en.wikipedia.org/wiki/K-means_clustering) algorithms.
  _return: ["_return_example"], # Array<String> | This parameter is used for specifying return fields.
  sort_by: "published_at", # String | This parameter is used for changing the order column of the results.
  sort_direction: "desc", # String | This parameter is used for changing the order direction of the result.
  cursor: "*", # String | This parameter is used for finding a specific page.
  per_page: 10 # Integer | This parameter is used for specifying number of items in each page.
}

begin
  #List Stories
  result = api_instance.list_stories(opts)
  p result
rescue AylienNewsApi::ApiError => e
  puts "Exception when calling DefaultApi->list_stories: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | [**Array&lt;Integer&gt;**](Integer.md)| This parameter is used for finding stroies by story id. | [optional] 
 **title** | **String**| This parameter is used for finding stories whose title contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators). | [optional] 
 **body** | **String**| This parameter is used for finding stories whose body contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators). | [optional] 
 **text** | **String**| This parameter is used for finding stories whose title or body contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators). | [optional] 
 **language** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose language is the specified value. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes. | [optional] 
 **published_at_start** | **String**| This parameter is used for finding stories whose published at time is greater than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates). | [optional] 
 **published_at_end** | **String**| This parameter is used for finding stories whose published at time is less than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates). | [optional] 
 **categories_taxonomy** | **String**| This parameter is used for defining the type of the taxonomy for the rest of the categories queries. | [optional] 
 **categories_confident** | **BOOLEAN**| This parameter is used for finding stories whose categories are confident. | [optional] [default to true]
 **categories_id** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories by categories id. | [optional] 
 **categories_level** | [**Array&lt;Integer&gt;**](Integer.md)| This parameter is used for finding stories by categories level. | [optional] 
 **entities_title_text** | [**Array&lt;String&gt;**](String.md)| This parameter is used to find stories based on the specified entities &#x60;text&#x60; in story titles. | [optional] 
 **entities_title_type** | [**Array&lt;String&gt;**](String.md)| This parameter is used to find stories based on the specified entities &#x60;type&#x60; in story titles. | [optional] 
 **entities_title_links_dbpedia** | [**Array&lt;String&gt;**](String.md)| This parameter is used to find stories based on the specified entities dbpedia URL in story titles. | [optional] 
 **entities_body_text** | [**Array&lt;String&gt;**](String.md)| This parameter is used to find stories based on the specified entities &#x60;text&#x60; in the body of stories. | [optional] 
 **entities_body_type** | [**Array&lt;String&gt;**](String.md)| This parameter is used to find stories based on the specified entities &#x60;type&#x60; in the body of stories. | [optional] 
 **entities_body_links_dbpedia** | [**Array&lt;String&gt;**](String.md)| This parameter is used to find stories based on the specified entities dbpedia URL in the body of stories. | [optional] 
 **sentiment_title_polarity** | **String**| This parameter is used for finding stories whose title sentiment is the specified value. | [optional] 
 **sentiment_body_polarity** | **String**| This parameter is used for finding stories whose body sentiment is the specified value. | [optional] 
 **media_images_count_min** | **Integer**| This parameter is used for finding stories whose number of images is greater than or equal to the specified value. | [optional] 
 **media_images_count_max** | **Integer**| This parameter is used for finding stories whose number of images is less than or equal to the specified value. | [optional] 
 **media_videos_count_min** | **Integer**| This parameter is used for finding stories whose number of videos is greater than or equal to the specified value. | [optional] 
 **media_videos_count_max** | **Integer**| This parameter is used for finding stories whose number of videos is less than or equal to the specified value. | [optional] 
 **author_id** | [**Array&lt;Integer&gt;**](Integer.md)| This parameter is used for finding stories whose author id is the specified value. | [optional] 
 **author_name** | **String**| This parameter is used for finding stories whose author full name contains the specified value. | [optional] 
 **source_id** | [**Array&lt;Integer&gt;**](Integer.md)| This parameter is used for finding stories whose source id is the specified value. | [optional] 
 **source_name** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source name contains the specified value. | [optional] 
 **source_domain** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source domain is the specified value. | [optional] 
 **source_locations_country** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source country is the specified value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). | [optional] 
 **source_locations_state** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source state/province is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). | [optional] 
 **source_locations_city** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source city is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). | [optional] 
 **source_scopes_country** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source scopes is the specified country value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). | [optional] 
 **source_scopes_state** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source scopes is the specified state/province value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). | [optional] 
 **source_scopes_city** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source scopes is the specified city value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). | [optional] 
 **source_scopes_level** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source scopes is the specified level value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). | [optional] 
 **cluster** | **BOOLEAN**| This parameter enables clustering for the returned stories. | [optional] [default to false]
 **cluster_algorithm** | **String**| This parameter is used for specifying the clustering algorithm you wish to use. It supprts STC, Lingo and [k-means](https://en.wikipedia.org/wiki/K-means_clustering) algorithms. | [optional] [default to lingo]
 **_return** | [**Array&lt;String&gt;**](String.md)| This parameter is used for specifying return fields. | [optional] 
 **sort_by** | **String**| This parameter is used for changing the order column of the results. | [optional] [default to published_at]
 **sort_direction** | **String**| This parameter is used for changing the order direction of the result. | [optional] [default to desc]
 **cursor** | **String**| This parameter is used for finding a specific page. | [optional] [default to *]
 **per_page** | **Integer**| This parameter is used for specifying number of items in each page. | [optional] [default to 10]

### Return type

[**Stories**](Stories.md)

### Authorization

[app_key](../README.md#app_key), [app_id](../README.md#app_id)

### HTTP request headers

 - **Content-Type**: application/x-www-form-urlencoded
 - **Accept**: application/json, text/xml



# **list_time_series**
> TimeSeriesList list_time_series(opts)

List time series

This endpoint is used for getting time series by stories.

### Example
```ruby
# load the gem
require 'aylien_news_api'

# setup authorization
AylienNewsApi.configure do |config|
  # Configure API key authorization: app_id
  config.api_key['X-AYLIEN-NewsAPI-Application-ID'] = 'YOUR APP ID'

  # Configure API key authorization: app_key
  config.api_key['X-AYLIEN-NewsAPI-Application-Key'] = 'YOUR APP KEY'
end

api_instance = AylienNewsApi::DefaultApi.new

opts = { 
  id: [56], # Array<Integer> | This parameter is used for finding stroies by story id.
  title: "title_example", # String | This parameter is used for finding stories whose title contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
  body: "body_example", # String | This parameter is used for finding stories whose body contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
  text: "text_example", # String | This parameter is used for finding stories whose title or body contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
  language: ["language_example"], # Array<String> | This parameter is used for finding stories whose language is the specified value. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes.
  categories_taxonomy: "categories_taxonomy_example", # String | This parameter is used for defining the type of the taxonomy for the rest of the categories queries.
  categories_confident: true, # BOOLEAN | This parameter is used for finding stories whose categories are confident.
  categories_id: ["categories_id_example"], # Array<String> | This parameter is used for finding stories by categories id.
  categories_level: [56], # Array<Integer> | This parameter is used for finding stories by categories level.
  entities_title_text: ["entities_title_text_example"], # Array<String> | This parameter is used to find stories based on the specified entities `text` in story titles.
  entities_title_type: ["entities_title_type_example"], # Array<String> | This parameter is used to find stories based on the specified entities `type` in story titles.
  entities_title_links_dbpedia: ["entities_title_links_dbpedia_example"], # Array<String> | This parameter is used to find stories based on the specified entities dbpedia URL in story titles.
  entities_body_text: ["entities_body_text_example"], # Array<String> | This parameter is used to find stories based on the specified entities `text` in the body of stories.
  entities_body_type: ["entities_body_type_example"], # Array<String> | This parameter is used to find stories based on the specified entities `type` in the body of stories.
  entities_body_links_dbpedia: ["entities_body_links_dbpedia_example"], # Array<String> | This parameter is used to find stories based on the specified entities dbpedia URL in the body of stories.
  sentiment_title_polarity: "sentiment_title_polarity_example", # String | This parameter is used for finding stories whose title sentiment is the specified value.
  sentiment_body_polarity: "sentiment_body_polarity_example", # String | This parameter is used for finding stories whose body sentiment is the specified value.
  media_images_count_min: 56, # Integer | This parameter is used for finding stories whose number of images is greater than or equal to the specified value.
  media_images_count_max: 56, # Integer | This parameter is used for finding stories whose number of images is less than or equal to the specified value.
  media_videos_count_min: 56, # Integer | This parameter is used for finding stories whose number of videos is greater than or equal to the specified value.
  media_videos_count_max: 56, # Integer | This parameter is used for finding stories whose number of videos is less than or equal to the specified value.
  author_id: [56], # Array<Integer> | This parameter is used for finding stories whose author id is the specified value.
  author_name: "author_name_example", # String | This parameter is used for finding stories whose author full name contains the specified value.
  source_id: [56], # Array<Integer> | This parameter is used for finding stories whose source id is the specified value.
  source_name: ["source_name_example"], # Array<String> | This parameter is used for finding stories whose source name contains the specified value.
  source_domain: ["source_domain_example"], # Array<String> | This parameter is used for finding stories whose source domain is the specified value.
  source_locations_country: ["source_locations_country_example"], # Array<String> | This parameter is used for finding stories whose source country is the specified value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
  source_locations_state: ["source_locations_state_example"], # Array<String> | This parameter is used for finding stories whose source state/province is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
  source_locations_city: ["source_locations_city_example"], # Array<String> | This parameter is used for finding stories whose source city is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
  source_scopes_country: ["source_scopes_country_example"], # Array<String> | This parameter is used for finding stories whose source scopes is the specified country value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
  source_scopes_state: ["source_scopes_state_example"], # Array<String> | This parameter is used for finding stories whose source scopes is the specified state/province value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
  source_scopes_city: ["source_scopes_city_example"], # Array<String> | This parameter is used for finding stories whose source scopes is the specified city value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
  source_scopes_level: ["source_scopes_level_example"], # Array<String> | This parameter is used for finding stories whose source scopes is the specified level value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
  published_at_start: "NOW-7DAYS/DAY", # String | This parameter is used for finding stories whose published at time is less than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates).
  published_at_end: "NOW/DAY", # String | This parameter is used for finding stories whose published at time is greater than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates).
  period: "+1DAY" # String | The size of each date range is expressed as an interval to be added to the lower bound. It supports Date Math Syntax. Valid options are `+` following an integer number greater than 0 and one of the Date Math keywords. e.g. `+1DAY`, `+2MINUTES` and `+1MONTH`. Here are [Supported keywords](https://newsapi.aylien.com/docs/working-with-dates#date-math).
}

begin
  #List time series
  result = api_instance.list_time_series(opts)
  p result
rescue AylienNewsApi::ApiError => e
  puts "Exception when calling DefaultApi->list_time_series: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | [**Array&lt;Integer&gt;**](Integer.md)| This parameter is used for finding stroies by story id. | [optional] 
 **title** | **String**| This parameter is used for finding stories whose title contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators). | [optional] 
 **body** | **String**| This parameter is used for finding stories whose body contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators). | [optional] 
 **text** | **String**| This parameter is used for finding stories whose title or body contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators). | [optional] 
 **language** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose language is the specified value. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes. | [optional] 
 **categories_taxonomy** | **String**| This parameter is used for defining the type of the taxonomy for the rest of the categories queries. | [optional] 
 **categories_confident** | **BOOLEAN**| This parameter is used for finding stories whose categories are confident. | [optional] [default to true]
 **categories_id** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories by categories id. | [optional] 
 **categories_level** | [**Array&lt;Integer&gt;**](Integer.md)| This parameter is used for finding stories by categories level. | [optional] 
 **entities_title_text** | [**Array&lt;String&gt;**](String.md)| This parameter is used to find stories based on the specified entities &#x60;text&#x60; in story titles. | [optional] 
 **entities_title_type** | [**Array&lt;String&gt;**](String.md)| This parameter is used to find stories based on the specified entities &#x60;type&#x60; in story titles. | [optional] 
 **entities_title_links_dbpedia** | [**Array&lt;String&gt;**](String.md)| This parameter is used to find stories based on the specified entities dbpedia URL in story titles. | [optional] 
 **entities_body_text** | [**Array&lt;String&gt;**](String.md)| This parameter is used to find stories based on the specified entities &#x60;text&#x60; in the body of stories. | [optional] 
 **entities_body_type** | [**Array&lt;String&gt;**](String.md)| This parameter is used to find stories based on the specified entities &#x60;type&#x60; in the body of stories. | [optional] 
 **entities_body_links_dbpedia** | [**Array&lt;String&gt;**](String.md)| This parameter is used to find stories based on the specified entities dbpedia URL in the body of stories. | [optional] 
 **sentiment_title_polarity** | **String**| This parameter is used for finding stories whose title sentiment is the specified value. | [optional] 
 **sentiment_body_polarity** | **String**| This parameter is used for finding stories whose body sentiment is the specified value. | [optional] 
 **media_images_count_min** | **Integer**| This parameter is used for finding stories whose number of images is greater than or equal to the specified value. | [optional] 
 **media_images_count_max** | **Integer**| This parameter is used for finding stories whose number of images is less than or equal to the specified value. | [optional] 
 **media_videos_count_min** | **Integer**| This parameter is used for finding stories whose number of videos is greater than or equal to the specified value. | [optional] 
 **media_videos_count_max** | **Integer**| This parameter is used for finding stories whose number of videos is less than or equal to the specified value. | [optional] 
 **author_id** | [**Array&lt;Integer&gt;**](Integer.md)| This parameter is used for finding stories whose author id is the specified value. | [optional] 
 **author_name** | **String**| This parameter is used for finding stories whose author full name contains the specified value. | [optional] 
 **source_id** | [**Array&lt;Integer&gt;**](Integer.md)| This parameter is used for finding stories whose source id is the specified value. | [optional] 
 **source_name** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source name contains the specified value. | [optional] 
 **source_domain** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source domain is the specified value. | [optional] 
 **source_locations_country** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source country is the specified value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). | [optional] 
 **source_locations_state** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source state/province is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). | [optional] 
 **source_locations_city** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source city is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). | [optional] 
 **source_scopes_country** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source scopes is the specified country value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). | [optional] 
 **source_scopes_state** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source scopes is the specified state/province value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). | [optional] 
 **source_scopes_city** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source scopes is the specified city value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). | [optional] 
 **source_scopes_level** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source scopes is the specified level value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). | [optional] 
 **published_at_start** | **String**| This parameter is used for finding stories whose published at time is less than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates). | [optional] [default to NOW-7DAYS/DAY]
 **published_at_end** | **String**| This parameter is used for finding stories whose published at time is greater than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates). | [optional] [default to NOW/DAY]
 **period** | **String**| The size of each date range is expressed as an interval to be added to the lower bound. It supports Date Math Syntax. Valid options are &#x60;+&#x60; following an integer number greater than 0 and one of the Date Math keywords. e.g. &#x60;+1DAY&#x60;, &#x60;+2MINUTES&#x60; and &#x60;+1MONTH&#x60;. Here are [Supported keywords](https://newsapi.aylien.com/docs/working-with-dates#date-math). | [optional] [default to +1DAY]

### Return type

[**TimeSeriesList**](TimeSeriesList.md)

### Authorization

[app_key](../README.md#app_key), [app_id](../README.md#app_id)

### HTTP request headers

 - **Content-Type**: application/x-www-form-urlencoded
 - **Accept**: application/json, text/xml



# **list_trends**
> Trends list_trends(opts)

List trends

This endpoint is used for finding trends based on stories.

### Example
```ruby
# load the gem
require 'aylien_news_api'

# setup authorization
AylienNewsApi.configure do |config|
  # Configure API key authorization: app_id
  config.api_key['X-AYLIEN-NewsAPI-Application-ID'] = 'YOUR APP ID'

  # Configure API key authorization: app_key
  config.api_key['X-AYLIEN-NewsAPI-Application-Key'] = 'YOUR APP KEY'
end

api_instance = AylienNewsApi::DefaultApi.new

opts = { 
  id: [56], # Array<Integer> | This parameter is used for finding stroies by story id.
  title: "title_example", # String | This parameter is used for finding stories whose title contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
  body: "body_example", # String | This parameter is used for finding stories whose body contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
  text: "text_example", # String | This parameter is used for finding stories whose title or body contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).
  language: ["language_example"], # Array<String> | This parameter is used for finding stories whose language is the specified value. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes.
  published_at_start: "published_at_start_example", # String | This parameter is used for finding stories whose published at time is greater than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates).
  published_at_end: "published_at_end_example", # String | This parameter is used for finding stories whose published at time is less than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates).
  categories_taxonomy: "categories_taxonomy_example", # String | This parameter is used for defining the type of the taxonomy for the rest of the categories queries.
  categories_confident: true, # BOOLEAN | This parameter is used for finding stories whose categories are confident.
  categories_id: ["categories_id_example"], # Array<String> | This parameter is used for finding stories by categories id.
  categories_level: [56], # Array<Integer> | This parameter is used for finding stories by categories level.
  entities_title_text: ["entities_title_text_example"], # Array<String> | This parameter is used to find stories based on the specified entities `text` in story titles.
  entities_title_type: ["entities_title_type_example"], # Array<String> | This parameter is used to find stories based on the specified entities `type` in story titles.
  entities_title_links_dbpedia: ["entities_title_links_dbpedia_example"], # Array<String> | This parameter is used to find stories based on the specified entities dbpedia URL in story titles.
  entities_body_text: ["entities_body_text_example"], # Array<String> | This parameter is used to find stories based on the specified entities `text` in the body of stories.
  entities_body_type: ["entities_body_type_example"], # Array<String> | This parameter is used to find stories based on the specified entities `type` in the body of stories.
  entities_body_links_dbpedia: ["entities_body_links_dbpedia_example"], # Array<String> | This parameter is used to find stories based on the specified entities dbpedia URL in the body of stories.
  sentiment_title_polarity: "sentiment_title_polarity_example", # String | This parameter is used for finding stories whose title sentiment is the specified value.
  sentiment_body_polarity: "sentiment_body_polarity_example", # String | This parameter is used for finding stories whose body sentiment is the specified value.
  media_images_count_min: 56, # Integer | This parameter is used for finding stories whose number of images is greater than or equal to the specified value.
  media_images_count_max: 56, # Integer | This parameter is used for finding stories whose number of images is less than or equal to the specified value.
  media_videos_count_min: 56, # Integer | This parameter is used for finding stories whose number of videos is greater than or equal to the specified value.
  media_videos_count_max: 56, # Integer | This parameter is used for finding stories whose number of videos is less than or equal to the specified value.
  author_id: [56], # Array<Integer> | This parameter is used for finding stories whose author id is the specified value.
  author_name: "author_name_example", # String | This parameter is used for finding stories whose author full name contains the specified value.
  source_id: [56], # Array<Integer> | This parameter is used for finding stories whose source id is the specified value.
  source_name: ["source_name_example"], # Array<String> | This parameter is used for finding stories whose source name contains the specified value.
  source_domain: ["source_domain_example"], # Array<String> | This parameter is used for finding stories whose source domain is the specified value.
  source_locations_country: ["source_locations_country_example"], # Array<String> | This parameter is used for finding stories whose source country is the specified value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
  source_locations_state: ["source_locations_state_example"], # Array<String> | This parameter is used for finding stories whose source state/province is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
  source_locations_city: ["source_locations_city_example"], # Array<String> | This parameter is used for finding stories whose source city is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
  source_scopes_country: ["source_scopes_country_example"], # Array<String> | This parameter is used for finding stories whose source scopes is the specified country value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
  source_scopes_state: ["source_scopes_state_example"], # Array<String> | This parameter is used for finding stories whose source scopes is the specified state/province value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
  source_scopes_city: ["source_scopes_city_example"], # Array<String> | This parameter is used for finding stories whose source scopes is the specified city value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
  source_scopes_level: ["source_scopes_level_example"], # Array<String> | This parameter is used for finding stories whose source scopes is the specified level value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).
  field: "field_example" # String | This parameter is used to specify the trend field.
}

begin
  #List trends
  result = api_instance.list_trends(opts)
  p result
rescue AylienNewsApi::ApiError => e
  puts "Exception when calling DefaultApi->list_trends: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | [**Array&lt;Integer&gt;**](Integer.md)| This parameter is used for finding stroies by story id. | [optional] 
 **title** | **String**| This parameter is used for finding stories whose title contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators). | [optional] 
 **body** | **String**| This parameter is used for finding stories whose body contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators). | [optional] 
 **text** | **String**| This parameter is used for finding stories whose title or body contains a specfic keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators). | [optional] 
 **language** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose language is the specified value. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes. | [optional] 
 **published_at_start** | **String**| This parameter is used for finding stories whose published at time is greater than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates). | [optional] 
 **published_at_end** | **String**| This parameter is used for finding stories whose published at time is less than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates). | [optional] 
 **categories_taxonomy** | **String**| This parameter is used for defining the type of the taxonomy for the rest of the categories queries. | [optional] 
 **categories_confident** | **BOOLEAN**| This parameter is used for finding stories whose categories are confident. | [optional] [default to true]
 **categories_id** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories by categories id. | [optional] 
 **categories_level** | [**Array&lt;Integer&gt;**](Integer.md)| This parameter is used for finding stories by categories level. | [optional] 
 **entities_title_text** | [**Array&lt;String&gt;**](String.md)| This parameter is used to find stories based on the specified entities &#x60;text&#x60; in story titles. | [optional] 
 **entities_title_type** | [**Array&lt;String&gt;**](String.md)| This parameter is used to find stories based on the specified entities &#x60;type&#x60; in story titles. | [optional] 
 **entities_title_links_dbpedia** | [**Array&lt;String&gt;**](String.md)| This parameter is used to find stories based on the specified entities dbpedia URL in story titles. | [optional] 
 **entities_body_text** | [**Array&lt;String&gt;**](String.md)| This parameter is used to find stories based on the specified entities &#x60;text&#x60; in the body of stories. | [optional] 
 **entities_body_type** | [**Array&lt;String&gt;**](String.md)| This parameter is used to find stories based on the specified entities &#x60;type&#x60; in the body of stories. | [optional] 
 **entities_body_links_dbpedia** | [**Array&lt;String&gt;**](String.md)| This parameter is used to find stories based on the specified entities dbpedia URL in the body of stories. | [optional] 
 **sentiment_title_polarity** | **String**| This parameter is used for finding stories whose title sentiment is the specified value. | [optional] 
 **sentiment_body_polarity** | **String**| This parameter is used for finding stories whose body sentiment is the specified value. | [optional] 
 **media_images_count_min** | **Integer**| This parameter is used for finding stories whose number of images is greater than or equal to the specified value. | [optional] 
 **media_images_count_max** | **Integer**| This parameter is used for finding stories whose number of images is less than or equal to the specified value. | [optional] 
 **media_videos_count_min** | **Integer**| This parameter is used for finding stories whose number of videos is greater than or equal to the specified value. | [optional] 
 **media_videos_count_max** | **Integer**| This parameter is used for finding stories whose number of videos is less than or equal to the specified value. | [optional] 
 **author_id** | [**Array&lt;Integer&gt;**](Integer.md)| This parameter is used for finding stories whose author id is the specified value. | [optional] 
 **author_name** | **String**| This parameter is used for finding stories whose author full name contains the specified value. | [optional] 
 **source_id** | [**Array&lt;Integer&gt;**](Integer.md)| This parameter is used for finding stories whose source id is the specified value. | [optional] 
 **source_name** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source name contains the specified value. | [optional] 
 **source_domain** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source domain is the specified value. | [optional] 
 **source_locations_country** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source country is the specified value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). | [optional] 
 **source_locations_state** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source state/province is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). | [optional] 
 **source_locations_city** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source city is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). | [optional] 
 **source_scopes_country** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source scopes is the specified country value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). | [optional] 
 **source_scopes_state** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source scopes is the specified state/province value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). | [optional] 
 **source_scopes_city** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source scopes is the specified city value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). | [optional] 
 **source_scopes_level** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source scopes is the specified level value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). | [optional] 
 **field** | **String**| This parameter is used to specify the trend field. | [optional] 

### Return type

[**Trends**](Trends.md)

### Authorization

[app_key](../README.md#app_key), [app_id](../README.md#app_id)

### HTTP request headers

 - **Content-Type**: application/x-www-form-urlencoded
 - **Accept**: application/json, text/xml



