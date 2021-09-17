# AylienNewsApi::DefaultApi

All URIs are relative to *https://api.aylien.com/news*

Method | HTTP request | Description
------------- | ------------- | -------------
[**advanced_list_stories**](DefaultApi.md#advanced_list_stories) | **POST** /stories | List Stories
[**list_autocompletes**](DefaultApi.md#list_autocompletes) | **GET** /autocompletes | List autocompletes
[**list_clusters**](DefaultApi.md#list_clusters) | **GET** /clusters | List Clusters
[**list_histograms**](DefaultApi.md#list_histograms) | **GET** /histograms | List histograms
[**list_related_stories_get**](DefaultApi.md#list_related_stories_get) | **GET** /related_stories | 
[**list_related_stories_post**](DefaultApi.md#list_related_stories_post) | **POST** /related_stories | 
[**list_stories**](DefaultApi.md#list_stories) | **GET** /stories | List Stories
[**list_time_series**](DefaultApi.md#list_time_series) | **GET** /time_series | List time series
[**list_trends**](DefaultApi.md#list_trends) | **GET** /trends | List trends



## advanced_list_stories

> Stories advanced_list_stories(unknown_base_type, opts)

List Stories

The stories endpoint is used to return stories based on the json query you set in your request body. The News API crawler gathers articles in near real-time and stores information about them, or metadata. Below you can see all of the query parameters, and JSON schema for the body, which you can use to narrow down your query. 

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

api_instance = AylienNewsApi::DefaultApi.new
unknown_base_type = {"$and":[{"$or":[{"body":{"$text":"Tim Cook"}},{"social.shares.count.reddit.max":{"$gte":5000,"$boost":5}}]},{"entity":{"$and":[{"name":{"$text":"Apple","$boost":2}},{"$not":[{"type":{"$eq":"Fruit"}}]}]}}]} # UNKNOWN_BASE_TYPE | /stories body schema to perform an advanced search with logical operators and nested objects. 
opts = {
  published_at_start: 'published_at_start_example', # String | This parameter is used for finding stories whose published at time is greater than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates). 
  published_at_end: 'published_at_end_example', # String | This parameter is used for finding stories whose published at time is less than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates). 
  _return: ['_return_example'], # Array<String> | This parameter is used for specifying return fields.
  sort_by: 'published_at', # String | This parameter is used for changing the order column of the results. You can read about sorting results [here](https://newsapi.aylien.com/docs/sorting-results). 
  sort_direction: 'desc', # String | This parameter is used for changing the order direction of the result. You can read about sorting results [here](https://newsapi.aylien.com/docs/sorting-results). 
  cursor: '*', # String | This parameter is used for finding a specific page. You can read more about pagination of results [here](https://newsapi.aylien.com/docs/pagination-of-results). 
  per_page: 10 # Integer | This parameter is used for specifying number of items in each page You can read more about pagination of results [here](https://newsapi.aylien.com/docs/pagination-of-results) 
}

begin
  #List Stories
  result = api_instance.advanced_list_stories(unknown_base_type, opts)
  p result
rescue AylienNewsApi::ApiError => e
  puts "Exception when calling DefaultApi->advanced_list_stories: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **unknown_base_type** | [**UNKNOWN_BASE_TYPE**](UNKNOWN_BASE_TYPE.md)| /stories body schema to perform an advanced search with logical operators and nested objects.  | 
 **published_at_start** | **String**| This parameter is used for finding stories whose published at time is greater than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates).  | [optional] 
 **published_at_end** | **String**| This parameter is used for finding stories whose published at time is less than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates).  | [optional] 
 **_return** | [**Array&lt;String&gt;**](String.md)| This parameter is used for specifying return fields. | [optional] 
 **sort_by** | **String**| This parameter is used for changing the order column of the results. You can read about sorting results [here](https://newsapi.aylien.com/docs/sorting-results).  | [optional] [default to &#39;published_at&#39;]
 **sort_direction** | **String**| This parameter is used for changing the order direction of the result. You can read about sorting results [here](https://newsapi.aylien.com/docs/sorting-results).  | [optional] [default to &#39;desc&#39;]
 **cursor** | **String**| This parameter is used for finding a specific page. You can read more about pagination of results [here](https://newsapi.aylien.com/docs/pagination-of-results).  | [optional] [default to &#39;*&#39;]
 **per_page** | **Integer**| This parameter is used for specifying number of items in each page You can read more about pagination of results [here](https://newsapi.aylien.com/docs/pagination-of-results)  | [optional] [default to 10]

### Return type

[**Stories**](Stories.md)

### Authorization

[app_id](../README.md#app_id), [app_key](../README.md#app_key)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json, text/xml


## list_autocompletes

> Autocompletes list_autocompletes(type, term, opts)

List autocompletes

The autocompletes endpoint a string of characters provided to it, and then returns suggested terms that are the most likely full words or strings. The terms returned by the News API are based on parameters the type parameters you can see below. For example, if you provide the autocompletes endpoint with the term `New York C` and select the type `dbpedia_resources`, the API will return links to the DBpedia resources `New_York_City`, `New_York_City_Subway`, `New_York_City_Police_Department`, and so on. 

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

api_instance = AylienNewsApi::DefaultApi.new
type = 'source_names' # String | This parameter is used for defining the type of autocompletes. 
term = 'News' # String | This parameter is used for finding autocomplete objects that contain the specified value. 
opts = {
  language: 'en', # String | This parameter is used for autocompletes whose language is the specified value. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes. 
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
 **type** | **String**| This parameter is used for defining the type of autocompletes.  | 
 **term** | **String**| This parameter is used for finding autocomplete objects that contain the specified value.  | 
 **language** | **String**| This parameter is used for autocompletes whose language is the specified value. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes.  | [optional] [default to &#39;en&#39;]
 **per_page** | **Integer**| This parameter is used for specifying number of items in each page.  | [optional] [default to 3]

### Return type

[**Autocompletes**](Autocompletes.md)

### Authorization

[app_id](../README.md#app_id), [app_key](../README.md#app_key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json, text/xml


## list_clusters

> Clusters list_clusters(opts)

List Clusters

The clusters endpoint is used to return clusters based on parameters you set in your query. 

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

api_instance = AylienNewsApi::DefaultApi.new
opts = {
  id: [56], # Array<Integer> | This parameter is used for finding clusters by cluster id. 
  not_id: [56], # Array<Integer> | This parameter is used for excluding clusters by cluster id. 
  story_count_min: 56, # Integer | This parameter is used for finding clusters with more than or equal to a specific amount of stories associated with them. 
  story_count_max: 56, # Integer | This parameter is used for finding clusters with less than or equal to a specific amount of stories associated with them. 
  time_start: 'time_start_example', # String | This parameter is used for finding clusters whose creation time is greater than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates). 
  time_end: 'time_end_example', # String | This parameter is used for finding clusters whose creation time is less than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates). 
  earliest_story_start: 'earliest_story_start_example', # String | This parameter is used for finding clusters whose publication date of its earliest story is greater than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates). 
  earliest_story_end: 'earliest_story_end_example', # String | This parameter is used for finding clusters whose publication date of its earliest story is less than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates). 
  latest_story_start: 'latest_story_start_example', # String | This parameter is used for finding clusters whose publication date of its latest story is greater than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates). 
  latest_story_end: 'latest_story_end_example', # String | This parameter is used for finding clusters whose publication date of its latest story is less than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates). 
  location_country: ['location_country_example'], # Array<String> | This parameter is used for finding clusters belonging to a specific country. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  not_location_country: ['location_country_example'], # Array<String> | This parameter is used for excluding clusters belonging to a specific country. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  _return: ['_return_example'], # Array<String> | This parameter is used for specifying return fields.
  sort_by: 'published_at', # String | This parameter is used for changing the order column of the results. You can read about sorting results [here](https://newsapi.aylien.com/docs/sorting-results). 
  sort_direction: 'desc', # String | This parameter is used for changing the order direction of the result. You can read about sorting results [here](https://newsapi.aylien.com/docs/sorting-results). 
  cursor: '*', # String | This parameter is used for finding a specific page. You can read more about pagination of results [here](https://newsapi.aylien.com/docs/pagination-of-results). 
  per_page: 10 # Integer | This parameter is used for specifying number of items in each page You can read more about pagination of results [here](https://newsapi.aylien.com/docs/pagination-of-results) 
}

begin
  #List Clusters
  result = api_instance.list_clusters(opts)
  p result
rescue AylienNewsApi::ApiError => e
  puts "Exception when calling DefaultApi->list_clusters: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | [**Array&lt;Integer&gt;**](Integer.md)| This parameter is used for finding clusters by cluster id.  | [optional] 
 **not_id** | [**Array&lt;Integer&gt;**](Integer.md)| This parameter is used for excluding clusters by cluster id.  | [optional] 
 **story_count_min** | **Integer**| This parameter is used for finding clusters with more than or equal to a specific amount of stories associated with them.  | [optional] 
 **story_count_max** | **Integer**| This parameter is used for finding clusters with less than or equal to a specific amount of stories associated with them.  | [optional] 
 **time_start** | **String**| This parameter is used for finding clusters whose creation time is greater than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates).  | [optional] 
 **time_end** | **String**| This parameter is used for finding clusters whose creation time is less than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates).  | [optional] 
 **earliest_story_start** | **String**| This parameter is used for finding clusters whose publication date of its earliest story is greater than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates).  | [optional] 
 **earliest_story_end** | **String**| This parameter is used for finding clusters whose publication date of its earliest story is less than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates).  | [optional] 
 **latest_story_start** | **String**| This parameter is used for finding clusters whose publication date of its latest story is greater than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates).  | [optional] 
 **latest_story_end** | **String**| This parameter is used for finding clusters whose publication date of its latest story is less than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates).  | [optional] 
 **location_country** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding clusters belonging to a specific country. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **not_location_country** | [**Array&lt;String&gt;**](String.md)| This parameter is used for excluding clusters belonging to a specific country. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **_return** | [**Array&lt;String&gt;**](String.md)| This parameter is used for specifying return fields. | [optional] 
 **sort_by** | **String**| This parameter is used for changing the order column of the results. You can read about sorting results [here](https://newsapi.aylien.com/docs/sorting-results).  | [optional] [default to &#39;published_at&#39;]
 **sort_direction** | **String**| This parameter is used for changing the order direction of the result. You can read about sorting results [here](https://newsapi.aylien.com/docs/sorting-results).  | [optional] [default to &#39;desc&#39;]
 **cursor** | **String**| This parameter is used for finding a specific page. You can read more about pagination of results [here](https://newsapi.aylien.com/docs/pagination-of-results).  | [optional] [default to &#39;*&#39;]
 **per_page** | **Integer**| This parameter is used for specifying number of items in each page You can read more about pagination of results [here](https://newsapi.aylien.com/docs/pagination-of-results)  | [optional] [default to 10]

### Return type

[**Clusters**](Clusters.md)

### Authorization

[app_id](../README.md#app_id), [app_key](../README.md#app_key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json, text/xml


## list_histograms

> Histograms list_histograms(opts)

List histograms

For the numerical metadata that the News API gathers (such as word counts or social shares for example), you can use the histograms endpoint to access and display this information. As this endpoint does not return actual stories, the results you are given will not count towards your story allowance provided by your subscription, so you can effectively query this endpoint free of charge. 

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

api_instance = AylienNewsApi::DefaultApi.new
opts = {
  id: [56], # Array<Integer> | This parameter is used for finding stories by story id. 
  not_id: [56], # Array<Integer> | This parameter is used for excluding stories by story id. 
  title: 'title_example', # String | This parameter is used for finding stories whose title contains a specific keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators). 
  body: 'body_example', # String | This parameter is used for finding stories whose body contains a specific keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators). 
  text: 'text_example', # String | This parameter is used for finding stories whose title or body contains a specific keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators). 
  translations_en_title: 'translations_en_title_example', # String | This parameter is used for finding stories whose translation title contains a specific keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators). 
  translations_en_body: 'translations_en_body_example', # String | This parameter is used for finding stories whose translation body contains a specific keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators). 
  translations_en_text: 'translations_en_text_example', # String | This parameter is used for finding stories whose translation title or body contains a specific keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators). 
  links_permalink: ['links_permalink_example'], # Array<String> | This parameter is used to find stories based on their url. 
  not_links_permalink: ['links_permalink_example'], # Array<String> | This parameter is used to exclude stories based on their url. 
  language: ['language_example'], # Array<String> | This parameter is used for finding stories whose language is the specified value. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes. 
  not_language: ['language_example'], # Array<String> | This parameter is used for excluding stories whose language is the specified value. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes. 
  published_at_start: 'published_at_start_example', # String | This parameter is used for finding stories whose published at time is greater than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates). 
  published_at_end: 'published_at_end_example', # String | This parameter is used for finding stories whose published at time is less than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates). 
  categories_taxonomy: 'categories_taxonomy_example', # String | This parameter is used for defining the type of the taxonomy for the rest of the categories queries. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories). 
  categories_confident: true, # Boolean | This parameter is used for finding stories whose categories are confident. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories). 
  categories_id: ['categories_id_example'], # Array<String> | This parameter is used for finding stories by categories id. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories). 
  not_categories_id: ['categories_id_example'], # Array<String> | This parameter is used for excluding stories by categories id. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories). 
  categories_label: ['categories_label_example'], # Array<String> | This parameter is used for finding stories by categories label. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories). 
  not_categories_label: ['categories_label_example'], # Array<String> | This parameter is used for excluding stories by categories label. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories). 
  categories_level: [56], # Array<Integer> | This parameter is used for finding stories by categories level. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories). 
  not_categories_level: [56], # Array<Integer> | This parameter is used for excluding stories by categories level. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories). 
  entities_id: ['entities_id_example'], # Array<String> | This parameter is used to find stories based on the specified entities `id`. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  not_entities_id: ['entities_id_example'], # Array<String> | This parameter is used to exclude stories based on the specified entity's `id`. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  entities_links_wikipedia: ['entities_links_wikipedia_example'], # Array<String> | This parameter is used to find stories based on the specified entities wikipedia URL. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  not_entities_links_wikipedia: ['entities_links_wikipedia_example'], # Array<String> | This parameter is used to exclude stories based on the specified entity's Wikipedia URL. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  entities_links_wikidata: ['entities_links_wikidata_example'], # Array<String> | This parameter is used to find stories based on the specified entities wikidata URL. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  not_entities_links_wikidata: ['entities_links_wikidata_example'], # Array<String> | This parameter is used to exclude stories based on the specified entity's Wikidata URL. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  entities_types: ['entities_types_example'], # Array<String> | This parameter is used to find stories based on the specified entities `types`. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  not_entities_types: ['entities_types_example'], # Array<String> | This parameter is used to exclude stories based on the specified entity's `types`. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  entities_stock_tickers: ['entities_stock_tickers_example'], # Array<String> | This parameter is used to find stories based on the specified entities `stock_tickers`. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  entities_body_stock_tickers: ['entities_body_stock_tickers_example'], # Array<String> | This parameter is used to exclude stories based on the specified entity's `stock_tickers` in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  entities_surface_forms_text: ['entities_surface_forms_text_example'], # Array<String> | This parameter is used to find stories based on the specified entities `surface_form`. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  not_entities_surface_forms_text: ['entities_surface_forms_text_example'], # Array<String> | This parameter is used to exclude stories based on the specified entity's `surface_form`. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  entities_title_surface_forms_text: 'entities_title_surface_forms_text_example', # String | This parameter is used to find stories based on the specified entities `surface_form` in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  not_entities_title_surface_forms_text: ['entities_title_surface_forms_text_example'], # Array<String> | This parameter is used to exclude stories based on the specified entity's `surface_form` in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  entities_body_surface_forms_text: ['entities_body_surface_forms_text_example'], # Array<String> | This parameter is used to find stories based on the specified entities `surface_form` in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  not_entities_body_surface_forms_text: ['entities_body_surface_forms_text_example'], # Array<String> | This parameter is used to exclude stories based on the specified entity's `surface_form` in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  sentiment_title_polarity: 'sentiment_title_polarity_example', # String | This parameter is used for finding stories whose title sentiment is the specified value. 
  not_sentiment_title_polarity: 'sentiment_title_polarity_example', # String | This parameter is used for excluding stories whose title sentiment is the specified value. 
  sentiment_body_polarity: 'sentiment_body_polarity_example', # String | This parameter is used for finding stories whose body sentiment is the specified value. 
  not_sentiment_body_polarity: 'sentiment_body_polarity_example', # String | This parameter is used for excluding stories whose body sentiment is the specified value. 
  media_images_count_min: 56, # Integer | This parameter is used for finding stories whose number of images is greater than or equal to the specified value. 
  media_images_count_max: 56, # Integer | This parameter is used for finding stories whose number of images is less than or equal to the specified value. 
  media_images_width_min: 56, # Integer | This parameter is used for finding stories whose width of images are greater than or equal to the specified value. 
  media_images_width_max: 56, # Integer | This parameter is used for finding stories whose width of images are less than or equal to the specified value. 
  media_images_height_min: 56, # Integer | This parameter is used for finding stories whose height of images are greater than or equal to the specified value. 
  media_images_height_max: 56, # Integer | This parameter is used for finding stories whose height of images are less than or equal to the specified value. 
  media_images_content_length_min: 56, # Integer | This parameter is used for finding stories whose images content length are greater than or equal to the specified value. 
  media_images_content_length_max: 56, # Integer | This parameter is used for finding stories whose images content length are less than or equal to the specified value. 
  media_images_format: ['media_images_format_example'], # Array<String> | This parameter is used for finding stories whose images format are the specified value. 
  not_media_images_format: ['media_images_format_example'], # Array<String> | This parameter is used for excluding stories whose images format are the specified value. 
  media_videos_count_min: 56, # Integer | This parameter is used for finding stories whose number of videos is greater than or equal to the specified value. 
  media_videos_count_max: 56, # Integer | This parameter is used for finding stories whose number of videos is less than or equal to the specified value. 
  author_id: [56], # Array<Integer> | This parameter is used for finding stories whose author id is the specified value. 
  not_author_id: [56], # Array<Integer> | This parameter is used for excluding stories whose author id is the specified value. 
  author_name: 'author_name_example', # String | This parameter is used for finding stories whose author full name contains the specified value. 
  not_author_name: 'author_name_example', # String | This parameter is used for excluding stories whose author full name contains the specified value. 
  source_id: [56], # Array<Integer> | This parameter is used for finding stories whose source id is the specified value. 
  not_source_id: [56], # Array<Integer> | This parameter is used for excluding stories whose source id is the specified value. 
  source_name: ['source_name_example'], # Array<String> | This parameter is used for finding stories whose source name contains the specified value. 
  not_source_name: ['source_name_example'], # Array<String> | This parameter is used for excluding stories whose source name contains the specified value. 
  source_domain: ['source_domain_example'], # Array<String> | This parameter is used for finding stories whose source domain is the specified value. 
  not_source_domain: ['source_domain_example'], # Array<String> | This parameter is used for excluding stories whose source domain is the specified value. 
  source_locations_country: ['source_locations_country_example'], # Array<String> | This parameter is used for finding stories whose source country is the specified value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  not_source_locations_country: ['source_locations_country_example'], # Array<String> | This parameter is used for excluding stories whose source country is the specified value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  source_locations_state: ['source_locations_state_example'], # Array<String> | This parameter is used for finding stories whose source state/province is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  not_source_locations_state: ['source_locations_state_example'], # Array<String> | This parameter is used for excluding stories whose source state/province is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  source_locations_city: ['source_locations_city_example'], # Array<String> | This parameter is used for finding stories whose source city is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  not_source_locations_city: ['source_locations_city_example'], # Array<String> | This parameter is used for excluding stories whose source city is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  source_scopes_country: ['source_scopes_country_example'], # Array<String> | This parameter is used for finding stories whose source scopes is the specified country value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  not_source_scopes_country: ['source_scopes_country_example'], # Array<String> | This parameter is used for excluding stories whose source scopes is the specified country value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  source_scopes_state: ['source_scopes_state_example'], # Array<String> | This parameter is used for finding stories whose source scopes is the specified state/province value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  not_source_scopes_state: ['source_scopes_state_example'], # Array<String> | This parameter is used for excluding stories whose source scopes is the specified state/province value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  source_scopes_city: ['source_scopes_city_example'], # Array<String> | This parameter is used for finding stories whose source scopes is the specified city value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  not_source_scopes_city: ['source_scopes_city_example'], # Array<String> | This parameter is used for excluding stories whose source scopes is the specified city value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  source_scopes_level: ['source_scopes_level_example'], # Array<String> | This parameter is used for finding stories whose source scopes is the specified level value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  not_source_scopes_level: ['source_scopes_level_example'], # Array<String> | This parameter is used for excluding stories whose source scopes is the specified level value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
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
  aql: 'aql_example', # String | This parameter is used to supply a query in AYLIEN Query Language. 
  aql_default_field: 'text', # String | This parameter is used to supply an optional default field name used in the AQL query. 
  query: 'query_example', # String | This parameter is used to make an advanced query using $and, $or, $not logical operators and $eq for exact match, $text for a text search and $lt, $gt, $lte, $gte for range queries. value must be a json string. 
  interval_start: 56, # Integer | This parameter is used for setting the start data point of histogram intervals. 
  interval_end: 56, # Integer | This parameter is used for setting the end data point of histogram intervals. 
  interval_width: 56, # Integer | This parameter is used for setting the width of histogram intervals. 
  field: 'social_shares_count' # String | This parameter is used for specifying the y-axis variable for the histogram. 
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
 **id** | [**Array&lt;Integer&gt;**](Integer.md)| This parameter is used for finding stories by story id.  | [optional] 
 **not_id** | [**Array&lt;Integer&gt;**](Integer.md)| This parameter is used for excluding stories by story id.  | [optional] 
 **title** | **String**| This parameter is used for finding stories whose title contains a specific keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).  | [optional] 
 **body** | **String**| This parameter is used for finding stories whose body contains a specific keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).  | [optional] 
 **text** | **String**| This parameter is used for finding stories whose title or body contains a specific keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).  | [optional] 
 **translations_en_title** | **String**| This parameter is used for finding stories whose translation title contains a specific keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).  | [optional] 
 **translations_en_body** | **String**| This parameter is used for finding stories whose translation body contains a specific keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).  | [optional] 
 **translations_en_text** | **String**| This parameter is used for finding stories whose translation title or body contains a specific keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).  | [optional] 
 **links_permalink** | [**Array&lt;String&gt;**](String.md)| This parameter is used to find stories based on their url.  | [optional] 
 **not_links_permalink** | [**Array&lt;String&gt;**](String.md)| This parameter is used to exclude stories based on their url.  | [optional] 
 **language** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose language is the specified value. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes.  | [optional] 
 **not_language** | [**Array&lt;String&gt;**](String.md)| This parameter is used for excluding stories whose language is the specified value. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes.  | [optional] 
 **published_at_start** | **String**| This parameter is used for finding stories whose published at time is greater than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates).  | [optional] 
 **published_at_end** | **String**| This parameter is used for finding stories whose published at time is less than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates).  | [optional] 
 **categories_taxonomy** | **String**| This parameter is used for defining the type of the taxonomy for the rest of the categories queries. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).  | [optional] 
 **categories_confident** | **Boolean**| This parameter is used for finding stories whose categories are confident. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).  | [optional] [default to true]
 **categories_id** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories by categories id. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).  | [optional] 
 **not_categories_id** | [**Array&lt;String&gt;**](String.md)| This parameter is used for excluding stories by categories id. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).  | [optional] 
 **categories_label** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories by categories label. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).  | [optional] 
 **not_categories_label** | [**Array&lt;String&gt;**](String.md)| This parameter is used for excluding stories by categories label. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).  | [optional] 
 **categories_level** | [**Array&lt;Integer&gt;**](Integer.md)| This parameter is used for finding stories by categories level. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).  | [optional] 
 **not_categories_level** | [**Array&lt;Integer&gt;**](Integer.md)| This parameter is used for excluding stories by categories level. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).  | [optional] 
 **entities_id** | [**Array&lt;String&gt;**](String.md)| This parameter is used to find stories based on the specified entities &#x60;id&#x60;. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **not_entities_id** | [**Array&lt;String&gt;**](String.md)| This parameter is used to exclude stories based on the specified entity&#39;s &#x60;id&#x60;. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **entities_links_wikipedia** | [**Array&lt;String&gt;**](String.md)| This parameter is used to find stories based on the specified entities wikipedia URL. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **not_entities_links_wikipedia** | [**Array&lt;String&gt;**](String.md)| This parameter is used to exclude stories based on the specified entity&#39;s Wikipedia URL. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **entities_links_wikidata** | [**Array&lt;String&gt;**](String.md)| This parameter is used to find stories based on the specified entities wikidata URL. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **not_entities_links_wikidata** | [**Array&lt;String&gt;**](String.md)| This parameter is used to exclude stories based on the specified entity&#39;s Wikidata URL. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **entities_types** | [**Array&lt;String&gt;**](String.md)| This parameter is used to find stories based on the specified entities &#x60;types&#x60;. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **not_entities_types** | [**Array&lt;String&gt;**](String.md)| This parameter is used to exclude stories based on the specified entity&#39;s &#x60;types&#x60;. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **entities_stock_tickers** | [**Array&lt;String&gt;**](String.md)| This parameter is used to find stories based on the specified entities &#x60;stock_tickers&#x60;. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **entities_body_stock_tickers** | [**Array&lt;String&gt;**](String.md)| This parameter is used to exclude stories based on the specified entity&#39;s &#x60;stock_tickers&#x60; in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **entities_surface_forms_text** | [**Array&lt;String&gt;**](String.md)| This parameter is used to find stories based on the specified entities &#x60;surface_form&#x60;. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **not_entities_surface_forms_text** | [**Array&lt;String&gt;**](String.md)| This parameter is used to exclude stories based on the specified entity&#39;s &#x60;surface_form&#x60;. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **entities_title_surface_forms_text** | **String**| This parameter is used to find stories based on the specified entities &#x60;surface_form&#x60; in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **not_entities_title_surface_forms_text** | [**Array&lt;String&gt;**](String.md)| This parameter is used to exclude stories based on the specified entity&#39;s &#x60;surface_form&#x60; in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **entities_body_surface_forms_text** | [**Array&lt;String&gt;**](String.md)| This parameter is used to find stories based on the specified entities &#x60;surface_form&#x60; in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **not_entities_body_surface_forms_text** | [**Array&lt;String&gt;**](String.md)| This parameter is used to exclude stories based on the specified entity&#39;s &#x60;surface_form&#x60; in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **sentiment_title_polarity** | **String**| This parameter is used for finding stories whose title sentiment is the specified value.  | [optional] 
 **not_sentiment_title_polarity** | **String**| This parameter is used for excluding stories whose title sentiment is the specified value.  | [optional] 
 **sentiment_body_polarity** | **String**| This parameter is used for finding stories whose body sentiment is the specified value.  | [optional] 
 **not_sentiment_body_polarity** | **String**| This parameter is used for excluding stories whose body sentiment is the specified value.  | [optional] 
 **media_images_count_min** | **Integer**| This parameter is used for finding stories whose number of images is greater than or equal to the specified value.  | [optional] 
 **media_images_count_max** | **Integer**| This parameter is used for finding stories whose number of images is less than or equal to the specified value.  | [optional] 
 **media_images_width_min** | **Integer**| This parameter is used for finding stories whose width of images are greater than or equal to the specified value.  | [optional] 
 **media_images_width_max** | **Integer**| This parameter is used for finding stories whose width of images are less than or equal to the specified value.  | [optional] 
 **media_images_height_min** | **Integer**| This parameter is used for finding stories whose height of images are greater than or equal to the specified value.  | [optional] 
 **media_images_height_max** | **Integer**| This parameter is used for finding stories whose height of images are less than or equal to the specified value.  | [optional] 
 **media_images_content_length_min** | **Integer**| This parameter is used for finding stories whose images content length are greater than or equal to the specified value.  | [optional] 
 **media_images_content_length_max** | **Integer**| This parameter is used for finding stories whose images content length are less than or equal to the specified value.  | [optional] 
 **media_images_format** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose images format are the specified value.  | [optional] 
 **not_media_images_format** | [**Array&lt;String&gt;**](String.md)| This parameter is used for excluding stories whose images format are the specified value.  | [optional] 
 **media_videos_count_min** | **Integer**| This parameter is used for finding stories whose number of videos is greater than or equal to the specified value.  | [optional] 
 **media_videos_count_max** | **Integer**| This parameter is used for finding stories whose number of videos is less than or equal to the specified value.  | [optional] 
 **author_id** | [**Array&lt;Integer&gt;**](Integer.md)| This parameter is used for finding stories whose author id is the specified value.  | [optional] 
 **not_author_id** | [**Array&lt;Integer&gt;**](Integer.md)| This parameter is used for excluding stories whose author id is the specified value.  | [optional] 
 **author_name** | **String**| This parameter is used for finding stories whose author full name contains the specified value.  | [optional] 
 **not_author_name** | **String**| This parameter is used for excluding stories whose author full name contains the specified value.  | [optional] 
 **source_id** | [**Array&lt;Integer&gt;**](Integer.md)| This parameter is used for finding stories whose source id is the specified value.  | [optional] 
 **not_source_id** | [**Array&lt;Integer&gt;**](Integer.md)| This parameter is used for excluding stories whose source id is the specified value.  | [optional] 
 **source_name** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source name contains the specified value.  | [optional] 
 **not_source_name** | [**Array&lt;String&gt;**](String.md)| This parameter is used for excluding stories whose source name contains the specified value.  | [optional] 
 **source_domain** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source domain is the specified value.  | [optional] 
 **not_source_domain** | [**Array&lt;String&gt;**](String.md)| This parameter is used for excluding stories whose source domain is the specified value.  | [optional] 
 **source_locations_country** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source country is the specified value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **not_source_locations_country** | [**Array&lt;String&gt;**](String.md)| This parameter is used for excluding stories whose source country is the specified value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **source_locations_state** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source state/province is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **not_source_locations_state** | [**Array&lt;String&gt;**](String.md)| This parameter is used for excluding stories whose source state/province is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **source_locations_city** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source city is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **not_source_locations_city** | [**Array&lt;String&gt;**](String.md)| This parameter is used for excluding stories whose source city is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **source_scopes_country** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source scopes is the specified country value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **not_source_scopes_country** | [**Array&lt;String&gt;**](String.md)| This parameter is used for excluding stories whose source scopes is the specified country value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **source_scopes_state** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source scopes is the specified state/province value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **not_source_scopes_state** | [**Array&lt;String&gt;**](String.md)| This parameter is used for excluding stories whose source scopes is the specified state/province value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **source_scopes_city** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source scopes is the specified city value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **not_source_scopes_city** | [**Array&lt;String&gt;**](String.md)| This parameter is used for excluding stories whose source scopes is the specified city value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **source_scopes_level** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source scopes is the specified level value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **not_source_scopes_level** | [**Array&lt;String&gt;**](String.md)| This parameter is used for excluding stories whose source scopes is the specified level value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
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
 **aql** | **String**| This parameter is used to supply a query in AYLIEN Query Language.  | [optional] 
 **aql_default_field** | **String**| This parameter is used to supply an optional default field name used in the AQL query.  | [optional] [default to &#39;text&#39;]
 **query** | **String**| This parameter is used to make an advanced query using $and, $or, $not logical operators and $eq for exact match, $text for a text search and $lt, $gt, $lte, $gte for range queries. value must be a json string.  | [optional] 
 **interval_start** | **Integer**| This parameter is used for setting the start data point of histogram intervals.  | [optional] 
 **interval_end** | **Integer**| This parameter is used for setting the end data point of histogram intervals.  | [optional] 
 **interval_width** | **Integer**| This parameter is used for setting the width of histogram intervals.  | [optional] 
 **field** | **String**| This parameter is used for specifying the y-axis variable for the histogram.  | [optional] [default to &#39;social_shares_count&#39;]

### Return type

[**Histograms**](Histograms.md)

### Authorization

[app_id](../README.md#app_id), [app_key](../README.md#app_key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json, text/xml


## list_related_stories_get

> RelatedStories list_related_stories_get(opts)



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

api_instance = AylienNewsApi::DefaultApi.new
opts = {
  id: [56], # Array<Integer> | This parameter is used for finding stories by story id. 
  not_id: [56], # Array<Integer> | This parameter is used for excluding stories by story id. 
  title: 'title_example', # String | This parameter is used for finding stories whose title contains a specific keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators). 
  body: 'body_example', # String | This parameter is used for finding stories whose body contains a specific keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators). 
  text: 'text_example', # String | This parameter is used for finding stories whose title or body contains a specific keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators). 
  translations_en_title: 'translations_en_title_example', # String | This parameter is used for finding stories whose translation title contains a specific keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators). 
  translations_en_body: 'translations_en_body_example', # String | This parameter is used for finding stories whose translation body contains a specific keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators). 
  translations_en_text: 'translations_en_text_example', # String | This parameter is used for finding stories whose translation title or body contains a specific keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators). 
  links_permalink: ['links_permalink_example'], # Array<String> | This parameter is used to find stories based on their url. 
  not_links_permalink: ['links_permalink_example'], # Array<String> | This parameter is used to exclude stories based on their url. 
  language: ['language_example'], # Array<String> | This parameter is used for finding stories whose language is the specified value. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes. 
  not_language: ['language_example'], # Array<String> | This parameter is used for excluding stories whose language is the specified value. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes. 
  published_at_start: 'published_at_start_example', # String | This parameter is used for finding stories whose published at time is greater than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates). 
  published_at_end: 'published_at_end_example', # String | This parameter is used for finding stories whose published at time is less than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates). 
  categories_taxonomy: 'categories_taxonomy_example', # String | This parameter is used for defining the type of the taxonomy for the rest of the categories queries. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories). 
  categories_confident: true, # Boolean | This parameter is used for finding stories whose categories are confident. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories). 
  categories_id: ['categories_id_example'], # Array<String> | This parameter is used for finding stories by categories id. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories). 
  not_categories_id: ['categories_id_example'], # Array<String> | This parameter is used for excluding stories by categories id. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories). 
  categories_label: ['categories_label_example'], # Array<String> | This parameter is used for finding stories by categories label. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories). 
  not_categories_label: ['categories_label_example'], # Array<String> | This parameter is used for excluding stories by categories label. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories). 
  categories_level: [56], # Array<Integer> | This parameter is used for finding stories by categories level. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories). 
  not_categories_level: [56], # Array<Integer> | This parameter is used for excluding stories by categories level. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories). 
  entities_id: ['entities_id_example'], # Array<String> | This parameter is used to find stories based on the specified entities `id`. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  not_entities_id: ['entities_id_example'], # Array<String> | This parameter is used to exclude stories based on the specified entity's `id`. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  entities_links_wikipedia: ['entities_links_wikipedia_example'], # Array<String> | This parameter is used to find stories based on the specified entities wikipedia URL. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  not_entities_links_wikipedia: ['entities_links_wikipedia_example'], # Array<String> | This parameter is used to exclude stories based on the specified entity's Wikipedia URL. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  entities_links_wikidata: ['entities_links_wikidata_example'], # Array<String> | This parameter is used to find stories based on the specified entities wikidata URL. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  not_entities_links_wikidata: ['entities_links_wikidata_example'], # Array<String> | This parameter is used to exclude stories based on the specified entity's Wikidata URL. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  entities_types: ['entities_types_example'], # Array<String> | This parameter is used to find stories based on the specified entities `types`. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  not_entities_types: ['entities_types_example'], # Array<String> | This parameter is used to exclude stories based on the specified entity's `types`. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  entities_stock_tickers: ['entities_stock_tickers_example'], # Array<String> | This parameter is used to find stories based on the specified entities `stock_tickers`. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  entities_body_stock_tickers: ['entities_body_stock_tickers_example'], # Array<String> | This parameter is used to exclude stories based on the specified entity's `stock_tickers` in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  entities_surface_forms_text: ['entities_surface_forms_text_example'], # Array<String> | This parameter is used to find stories based on the specified entities `surface_form`. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  not_entities_surface_forms_text: ['entities_surface_forms_text_example'], # Array<String> | This parameter is used to exclude stories based on the specified entity's `surface_form`. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  entities_title_surface_forms_text: 'entities_title_surface_forms_text_example', # String | This parameter is used to find stories based on the specified entities `surface_form` in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  not_entities_title_surface_forms_text: ['entities_title_surface_forms_text_example'], # Array<String> | This parameter is used to exclude stories based on the specified entity's `surface_form` in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  entities_body_surface_forms_text: ['entities_body_surface_forms_text_example'], # Array<String> | This parameter is used to find stories based on the specified entities `surface_form` in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  not_entities_body_surface_forms_text: ['entities_body_surface_forms_text_example'], # Array<String> | This parameter is used to exclude stories based on the specified entity's `surface_form` in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  sentiment_title_polarity: 'sentiment_title_polarity_example', # String | This parameter is used for finding stories whose title sentiment is the specified value. 
  not_sentiment_title_polarity: 'sentiment_title_polarity_example', # String | This parameter is used for excluding stories whose title sentiment is the specified value. 
  sentiment_body_polarity: 'sentiment_body_polarity_example', # String | This parameter is used for finding stories whose body sentiment is the specified value. 
  not_sentiment_body_polarity: 'sentiment_body_polarity_example', # String | This parameter is used for excluding stories whose body sentiment is the specified value. 
  media_images_count_min: 56, # Integer | This parameter is used for finding stories whose number of images is greater than or equal to the specified value. 
  media_images_count_max: 56, # Integer | This parameter is used for finding stories whose number of images is less than or equal to the specified value. 
  media_images_width_min: 56, # Integer | This parameter is used for finding stories whose width of images are greater than or equal to the specified value. 
  media_images_width_max: 56, # Integer | This parameter is used for finding stories whose width of images are less than or equal to the specified value. 
  media_images_height_min: 56, # Integer | This parameter is used for finding stories whose height of images are greater than or equal to the specified value. 
  media_images_height_max: 56, # Integer | This parameter is used for finding stories whose height of images are less than or equal to the specified value. 
  media_images_content_length_min: 56, # Integer | This parameter is used for finding stories whose images content length are greater than or equal to the specified value. 
  media_images_content_length_max: 56, # Integer | This parameter is used for finding stories whose images content length are less than or equal to the specified value. 
  media_images_format: ['media_images_format_example'], # Array<String> | This parameter is used for finding stories whose images format are the specified value. 
  not_media_images_format: ['media_images_format_example'], # Array<String> | This parameter is used for excluding stories whose images format are the specified value. 
  media_videos_count_min: 56, # Integer | This parameter is used for finding stories whose number of videos is greater than or equal to the specified value. 
  media_videos_count_max: 56, # Integer | This parameter is used for finding stories whose number of videos is less than or equal to the specified value. 
  author_id: [56], # Array<Integer> | This parameter is used for finding stories whose author id is the specified value. 
  not_author_id: [56], # Array<Integer> | This parameter is used for excluding stories whose author id is the specified value. 
  author_name: 'author_name_example', # String | This parameter is used for finding stories whose author full name contains the specified value. 
  not_author_name: 'author_name_example', # String | This parameter is used for excluding stories whose author full name contains the specified value. 
  source_id: [56], # Array<Integer> | This parameter is used for finding stories whose source id is the specified value. 
  not_source_id: [56], # Array<Integer> | This parameter is used for excluding stories whose source id is the specified value. 
  source_name: ['source_name_example'], # Array<String> | This parameter is used for finding stories whose source name contains the specified value. 
  not_source_name: ['source_name_example'], # Array<String> | This parameter is used for excluding stories whose source name contains the specified value. 
  source_domain: ['source_domain_example'], # Array<String> | This parameter is used for finding stories whose source domain is the specified value. 
  not_source_domain: ['source_domain_example'], # Array<String> | This parameter is used for excluding stories whose source domain is the specified value. 
  source_locations_country: ['source_locations_country_example'], # Array<String> | This parameter is used for finding stories whose source country is the specified value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  not_source_locations_country: ['source_locations_country_example'], # Array<String> | This parameter is used for excluding stories whose source country is the specified value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  source_locations_state: ['source_locations_state_example'], # Array<String> | This parameter is used for finding stories whose source state/province is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  not_source_locations_state: ['source_locations_state_example'], # Array<String> | This parameter is used for excluding stories whose source state/province is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  source_locations_city: ['source_locations_city_example'], # Array<String> | This parameter is used for finding stories whose source city is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  not_source_locations_city: ['source_locations_city_example'], # Array<String> | This parameter is used for excluding stories whose source city is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  source_scopes_country: ['source_scopes_country_example'], # Array<String> | This parameter is used for finding stories whose source scopes is the specified country value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  not_source_scopes_country: ['source_scopes_country_example'], # Array<String> | This parameter is used for excluding stories whose source scopes is the specified country value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  source_scopes_state: ['source_scopes_state_example'], # Array<String> | This parameter is used for finding stories whose source scopes is the specified state/province value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  not_source_scopes_state: ['source_scopes_state_example'], # Array<String> | This parameter is used for excluding stories whose source scopes is the specified state/province value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  source_scopes_city: ['source_scopes_city_example'], # Array<String> | This parameter is used for finding stories whose source scopes is the specified city value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  not_source_scopes_city: ['source_scopes_city_example'], # Array<String> | This parameter is used for excluding stories whose source scopes is the specified city value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  source_scopes_level: ['source_scopes_level_example'], # Array<String> | This parameter is used for finding stories whose source scopes is the specified level value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  not_source_scopes_level: ['source_scopes_level_example'], # Array<String> | This parameter is used for excluding stories whose source scopes is the specified level value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
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
  aql: 'aql_example', # String | This parameter is used to supply a query in AYLIEN Query Language. 
  aql_default_field: 'text', # String | This parameter is used to supply an optional default field name used in the AQL query. 
  query: 'query_example', # String | This parameter is used to make an advanced query using $and, $or, $not logical operators and $eq for exact match, $text for a text search and $lt, $gt, $lte, $gte for range queries. value must be a json string. 
  boost_by: 'boost_by_example', # String | This parameter is used for boosting the result by the specified value. 
  story_language: 'auto', # String | This parameter is used for setting the language of the story. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes. 
  per_page: 3 # Integer | This parameter is used for specifying number of items in each page. 
}

begin
  result = api_instance.list_related_stories_get(opts)
  p result
rescue AylienNewsApi::ApiError => e
  puts "Exception when calling DefaultApi->list_related_stories_get: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | [**Array&lt;Integer&gt;**](Integer.md)| This parameter is used for finding stories by story id.  | [optional] 
 **not_id** | [**Array&lt;Integer&gt;**](Integer.md)| This parameter is used for excluding stories by story id.  | [optional] 
 **title** | **String**| This parameter is used for finding stories whose title contains a specific keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).  | [optional] 
 **body** | **String**| This parameter is used for finding stories whose body contains a specific keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).  | [optional] 
 **text** | **String**| This parameter is used for finding stories whose title or body contains a specific keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).  | [optional] 
 **translations_en_title** | **String**| This parameter is used for finding stories whose translation title contains a specific keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).  | [optional] 
 **translations_en_body** | **String**| This parameter is used for finding stories whose translation body contains a specific keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).  | [optional] 
 **translations_en_text** | **String**| This parameter is used for finding stories whose translation title or body contains a specific keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).  | [optional] 
 **links_permalink** | [**Array&lt;String&gt;**](String.md)| This parameter is used to find stories based on their url.  | [optional] 
 **not_links_permalink** | [**Array&lt;String&gt;**](String.md)| This parameter is used to exclude stories based on their url.  | [optional] 
 **language** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose language is the specified value. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes.  | [optional] 
 **not_language** | [**Array&lt;String&gt;**](String.md)| This parameter is used for excluding stories whose language is the specified value. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes.  | [optional] 
 **published_at_start** | **String**| This parameter is used for finding stories whose published at time is greater than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates).  | [optional] 
 **published_at_end** | **String**| This parameter is used for finding stories whose published at time is less than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates).  | [optional] 
 **categories_taxonomy** | **String**| This parameter is used for defining the type of the taxonomy for the rest of the categories queries. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).  | [optional] 
 **categories_confident** | **Boolean**| This parameter is used for finding stories whose categories are confident. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).  | [optional] [default to true]
 **categories_id** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories by categories id. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).  | [optional] 
 **not_categories_id** | [**Array&lt;String&gt;**](String.md)| This parameter is used for excluding stories by categories id. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).  | [optional] 
 **categories_label** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories by categories label. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).  | [optional] 
 **not_categories_label** | [**Array&lt;String&gt;**](String.md)| This parameter is used for excluding stories by categories label. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).  | [optional] 
 **categories_level** | [**Array&lt;Integer&gt;**](Integer.md)| This parameter is used for finding stories by categories level. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).  | [optional] 
 **not_categories_level** | [**Array&lt;Integer&gt;**](Integer.md)| This parameter is used for excluding stories by categories level. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).  | [optional] 
 **entities_id** | [**Array&lt;String&gt;**](String.md)| This parameter is used to find stories based on the specified entities &#x60;id&#x60;. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **not_entities_id** | [**Array&lt;String&gt;**](String.md)| This parameter is used to exclude stories based on the specified entity&#39;s &#x60;id&#x60;. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **entities_links_wikipedia** | [**Array&lt;String&gt;**](String.md)| This parameter is used to find stories based on the specified entities wikipedia URL. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **not_entities_links_wikipedia** | [**Array&lt;String&gt;**](String.md)| This parameter is used to exclude stories based on the specified entity&#39;s Wikipedia URL. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **entities_links_wikidata** | [**Array&lt;String&gt;**](String.md)| This parameter is used to find stories based on the specified entities wikidata URL. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **not_entities_links_wikidata** | [**Array&lt;String&gt;**](String.md)| This parameter is used to exclude stories based on the specified entity&#39;s Wikidata URL. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **entities_types** | [**Array&lt;String&gt;**](String.md)| This parameter is used to find stories based on the specified entities &#x60;types&#x60;. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **not_entities_types** | [**Array&lt;String&gt;**](String.md)| This parameter is used to exclude stories based on the specified entity&#39;s &#x60;types&#x60;. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **entities_stock_tickers** | [**Array&lt;String&gt;**](String.md)| This parameter is used to find stories based on the specified entities &#x60;stock_tickers&#x60;. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **entities_body_stock_tickers** | [**Array&lt;String&gt;**](String.md)| This parameter is used to exclude stories based on the specified entity&#39;s &#x60;stock_tickers&#x60; in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **entities_surface_forms_text** | [**Array&lt;String&gt;**](String.md)| This parameter is used to find stories based on the specified entities &#x60;surface_form&#x60;. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **not_entities_surface_forms_text** | [**Array&lt;String&gt;**](String.md)| This parameter is used to exclude stories based on the specified entity&#39;s &#x60;surface_form&#x60;. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **entities_title_surface_forms_text** | **String**| This parameter is used to find stories based on the specified entities &#x60;surface_form&#x60; in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **not_entities_title_surface_forms_text** | [**Array&lt;String&gt;**](String.md)| This parameter is used to exclude stories based on the specified entity&#39;s &#x60;surface_form&#x60; in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **entities_body_surface_forms_text** | [**Array&lt;String&gt;**](String.md)| This parameter is used to find stories based on the specified entities &#x60;surface_form&#x60; in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **not_entities_body_surface_forms_text** | [**Array&lt;String&gt;**](String.md)| This parameter is used to exclude stories based on the specified entity&#39;s &#x60;surface_form&#x60; in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **sentiment_title_polarity** | **String**| This parameter is used for finding stories whose title sentiment is the specified value.  | [optional] 
 **not_sentiment_title_polarity** | **String**| This parameter is used for excluding stories whose title sentiment is the specified value.  | [optional] 
 **sentiment_body_polarity** | **String**| This parameter is used for finding stories whose body sentiment is the specified value.  | [optional] 
 **not_sentiment_body_polarity** | **String**| This parameter is used for excluding stories whose body sentiment is the specified value.  | [optional] 
 **media_images_count_min** | **Integer**| This parameter is used for finding stories whose number of images is greater than or equal to the specified value.  | [optional] 
 **media_images_count_max** | **Integer**| This parameter is used for finding stories whose number of images is less than or equal to the specified value.  | [optional] 
 **media_images_width_min** | **Integer**| This parameter is used for finding stories whose width of images are greater than or equal to the specified value.  | [optional] 
 **media_images_width_max** | **Integer**| This parameter is used for finding stories whose width of images are less than or equal to the specified value.  | [optional] 
 **media_images_height_min** | **Integer**| This parameter is used for finding stories whose height of images are greater than or equal to the specified value.  | [optional] 
 **media_images_height_max** | **Integer**| This parameter is used for finding stories whose height of images are less than or equal to the specified value.  | [optional] 
 **media_images_content_length_min** | **Integer**| This parameter is used for finding stories whose images content length are greater than or equal to the specified value.  | [optional] 
 **media_images_content_length_max** | **Integer**| This parameter is used for finding stories whose images content length are less than or equal to the specified value.  | [optional] 
 **media_images_format** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose images format are the specified value.  | [optional] 
 **not_media_images_format** | [**Array&lt;String&gt;**](String.md)| This parameter is used for excluding stories whose images format are the specified value.  | [optional] 
 **media_videos_count_min** | **Integer**| This parameter is used for finding stories whose number of videos is greater than or equal to the specified value.  | [optional] 
 **media_videos_count_max** | **Integer**| This parameter is used for finding stories whose number of videos is less than or equal to the specified value.  | [optional] 
 **author_id** | [**Array&lt;Integer&gt;**](Integer.md)| This parameter is used for finding stories whose author id is the specified value.  | [optional] 
 **not_author_id** | [**Array&lt;Integer&gt;**](Integer.md)| This parameter is used for excluding stories whose author id is the specified value.  | [optional] 
 **author_name** | **String**| This parameter is used for finding stories whose author full name contains the specified value.  | [optional] 
 **not_author_name** | **String**| This parameter is used for excluding stories whose author full name contains the specified value.  | [optional] 
 **source_id** | [**Array&lt;Integer&gt;**](Integer.md)| This parameter is used for finding stories whose source id is the specified value.  | [optional] 
 **not_source_id** | [**Array&lt;Integer&gt;**](Integer.md)| This parameter is used for excluding stories whose source id is the specified value.  | [optional] 
 **source_name** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source name contains the specified value.  | [optional] 
 **not_source_name** | [**Array&lt;String&gt;**](String.md)| This parameter is used for excluding stories whose source name contains the specified value.  | [optional] 
 **source_domain** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source domain is the specified value.  | [optional] 
 **not_source_domain** | [**Array&lt;String&gt;**](String.md)| This parameter is used for excluding stories whose source domain is the specified value.  | [optional] 
 **source_locations_country** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source country is the specified value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **not_source_locations_country** | [**Array&lt;String&gt;**](String.md)| This parameter is used for excluding stories whose source country is the specified value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **source_locations_state** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source state/province is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **not_source_locations_state** | [**Array&lt;String&gt;**](String.md)| This parameter is used for excluding stories whose source state/province is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **source_locations_city** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source city is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **not_source_locations_city** | [**Array&lt;String&gt;**](String.md)| This parameter is used for excluding stories whose source city is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **source_scopes_country** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source scopes is the specified country value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **not_source_scopes_country** | [**Array&lt;String&gt;**](String.md)| This parameter is used for excluding stories whose source scopes is the specified country value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **source_scopes_state** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source scopes is the specified state/province value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **not_source_scopes_state** | [**Array&lt;String&gt;**](String.md)| This parameter is used for excluding stories whose source scopes is the specified state/province value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **source_scopes_city** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source scopes is the specified city value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **not_source_scopes_city** | [**Array&lt;String&gt;**](String.md)| This parameter is used for excluding stories whose source scopes is the specified city value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **source_scopes_level** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source scopes is the specified level value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **not_source_scopes_level** | [**Array&lt;String&gt;**](String.md)| This parameter is used for excluding stories whose source scopes is the specified level value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
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
 **aql** | **String**| This parameter is used to supply a query in AYLIEN Query Language.  | [optional] 
 **aql_default_field** | **String**| This parameter is used to supply an optional default field name used in the AQL query.  | [optional] [default to &#39;text&#39;]
 **query** | **String**| This parameter is used to make an advanced query using $and, $or, $not logical operators and $eq for exact match, $text for a text search and $lt, $gt, $lte, $gte for range queries. value must be a json string.  | [optional] 
 **boost_by** | **String**| This parameter is used for boosting the result by the specified value.  | [optional] 
 **story_language** | **String**| This parameter is used for setting the language of the story. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes.  | [optional] [default to &#39;auto&#39;]
 **per_page** | **Integer**| This parameter is used for specifying number of items in each page.  | [optional] [default to 3]

### Return type

[**RelatedStories**](RelatedStories.md)

### Authorization

[app_id](../README.md#app_id), [app_key](../README.md#app_key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json, text/xml


## list_related_stories_post

> RelatedStories list_related_stories_post(opts)



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

api_instance = AylienNewsApi::DefaultApi.new
opts = {
  id: [56], # Array<Integer> | This parameter is used for finding stories by story id. 
  not_id: [56], # Array<Integer> | This parameter is used for excluding stories by story id. 
  title: 'title_example', # String | This parameter is used for finding stories whose title contains a specific keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators). 
  body: 'body_example', # String | This parameter is used for finding stories whose body contains a specific keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators). 
  text: 'text_example', # String | This parameter is used for finding stories whose title or body contains a specific keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators). 
  translations_en_title: 'translations_en_title_example', # String | This parameter is used for finding stories whose translation title contains a specific keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators). 
  translations_en_body: 'translations_en_body_example', # String | This parameter is used for finding stories whose translation body contains a specific keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators). 
  translations_en_text: 'translations_en_text_example', # String | This parameter is used for finding stories whose translation title or body contains a specific keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators). 
  links_permalink: ['links_permalink_example'], # Array<String> | This parameter is used to find stories based on their url. 
  not_links_permalink: ['links_permalink_example'], # Array<String> | This parameter is used to exclude stories based on their url. 
  language: ['language_example'], # Array<String> | This parameter is used for finding stories whose language is the specified value. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes. 
  not_language: ['language_example'], # Array<String> | This parameter is used for excluding stories whose language is the specified value. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes. 
  published_at_start: 'published_at_start_example', # String | This parameter is used for finding stories whose published at time is greater than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates). 
  published_at_end: 'published_at_end_example', # String | This parameter is used for finding stories whose published at time is less than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates). 
  categories_taxonomy: 'categories_taxonomy_example', # String | This parameter is used for defining the type of the taxonomy for the rest of the categories queries. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories). 
  categories_confident: true, # Boolean | This parameter is used for finding stories whose categories are confident. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories). 
  categories_id: ['categories_id_example'], # Array<String> | This parameter is used for finding stories by categories id. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories). 
  not_categories_id: ['categories_id_example'], # Array<String> | This parameter is used for excluding stories by categories id. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories). 
  categories_label: ['categories_label_example'], # Array<String> | This parameter is used for finding stories by categories label. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories). 
  not_categories_label: ['categories_label_example'], # Array<String> | This parameter is used for excluding stories by categories label. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories). 
  categories_level: [56], # Array<Integer> | This parameter is used for finding stories by categories level. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories). 
  not_categories_level: [56], # Array<Integer> | This parameter is used for excluding stories by categories level. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories). 
  entities_id: ['entities_id_example'], # Array<String> | This parameter is used to find stories based on the specified entities `id`. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  not_entities_id: ['entities_id_example'], # Array<String> | This parameter is used to exclude stories based on the specified entity's `id`. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  entities_links_wikipedia: ['entities_links_wikipedia_example'], # Array<String> | This parameter is used to find stories based on the specified entities wikipedia URL. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  not_entities_links_wikipedia: ['entities_links_wikipedia_example'], # Array<String> | This parameter is used to exclude stories based on the specified entity's Wikipedia URL. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  entities_links_wikidata: ['entities_links_wikidata_example'], # Array<String> | This parameter is used to find stories based on the specified entities wikidata URL. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  not_entities_links_wikidata: ['entities_links_wikidata_example'], # Array<String> | This parameter is used to exclude stories based on the specified entity's Wikidata URL. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  entities_types: ['entities_types_example'], # Array<String> | This parameter is used to find stories based on the specified entities `types`. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  not_entities_types: ['entities_types_example'], # Array<String> | This parameter is used to exclude stories based on the specified entity's `types`. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  entities_stock_tickers: ['entities_stock_tickers_example'], # Array<String> | This parameter is used to find stories based on the specified entities `stock_tickers`. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  entities_body_stock_tickers: ['entities_body_stock_tickers_example'], # Array<String> | This parameter is used to exclude stories based on the specified entity's `stock_tickers` in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  entities_surface_forms_text: ['entities_surface_forms_text_example'], # Array<String> | This parameter is used to find stories based on the specified entities `surface_form`. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  not_entities_surface_forms_text: ['entities_surface_forms_text_example'], # Array<String> | This parameter is used to exclude stories based on the specified entity's `surface_form`. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  entities_title_surface_forms_text: 'entities_title_surface_forms_text_example', # String | This parameter is used to find stories based on the specified entities `surface_form` in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  not_entities_title_surface_forms_text: ['entities_title_surface_forms_text_example'], # Array<String> | This parameter is used to exclude stories based on the specified entity's `surface_form` in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  entities_body_surface_forms_text: ['entities_body_surface_forms_text_example'], # Array<String> | This parameter is used to find stories based on the specified entities `surface_form` in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  not_entities_body_surface_forms_text: ['entities_body_surface_forms_text_example'], # Array<String> | This parameter is used to exclude stories based on the specified entity's `surface_form` in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  sentiment_title_polarity: 'sentiment_title_polarity_example', # String | This parameter is used for finding stories whose title sentiment is the specified value. 
  not_sentiment_title_polarity: 'sentiment_title_polarity_example', # String | This parameter is used for excluding stories whose title sentiment is the specified value. 
  sentiment_body_polarity: 'sentiment_body_polarity_example', # String | This parameter is used for finding stories whose body sentiment is the specified value. 
  not_sentiment_body_polarity: 'sentiment_body_polarity_example', # String | This parameter is used for excluding stories whose body sentiment is the specified value. 
  media_images_count_min: 56, # Integer | This parameter is used for finding stories whose number of images is greater than or equal to the specified value. 
  media_images_count_max: 56, # Integer | This parameter is used for finding stories whose number of images is less than or equal to the specified value. 
  media_images_width_min: 56, # Integer | This parameter is used for finding stories whose width of images are greater than or equal to the specified value. 
  media_images_width_max: 56, # Integer | This parameter is used for finding stories whose width of images are less than or equal to the specified value. 
  media_images_height_min: 56, # Integer | This parameter is used for finding stories whose height of images are greater than or equal to the specified value. 
  media_images_height_max: 56, # Integer | This parameter is used for finding stories whose height of images are less than or equal to the specified value. 
  media_images_content_length_min: 56, # Integer | This parameter is used for finding stories whose images content length are greater than or equal to the specified value. 
  media_images_content_length_max: 56, # Integer | This parameter is used for finding stories whose images content length are less than or equal to the specified value. 
  media_images_format: ['media_images_format_example'], # Array<String> | This parameter is used for finding stories whose images format are the specified value. 
  not_media_images_format: ['media_images_format_example'], # Array<String> | This parameter is used for excluding stories whose images format are the specified value. 
  media_videos_count_min: 56, # Integer | This parameter is used for finding stories whose number of videos is greater than or equal to the specified value. 
  media_videos_count_max: 56, # Integer | This parameter is used for finding stories whose number of videos is less than or equal to the specified value. 
  author_id: [56], # Array<Integer> | This parameter is used for finding stories whose author id is the specified value. 
  not_author_id: [56], # Array<Integer> | This parameter is used for excluding stories whose author id is the specified value. 
  author_name: 'author_name_example', # String | This parameter is used for finding stories whose author full name contains the specified value. 
  not_author_name: 'author_name_example', # String | This parameter is used for excluding stories whose author full name contains the specified value. 
  source_id: [56], # Array<Integer> | This parameter is used for finding stories whose source id is the specified value. 
  not_source_id: [56], # Array<Integer> | This parameter is used for excluding stories whose source id is the specified value. 
  source_name: ['source_name_example'], # Array<String> | This parameter is used for finding stories whose source name contains the specified value. 
  not_source_name: ['source_name_example'], # Array<String> | This parameter is used for excluding stories whose source name contains the specified value. 
  source_domain: ['source_domain_example'], # Array<String> | This parameter is used for finding stories whose source domain is the specified value. 
  not_source_domain: ['source_domain_example'], # Array<String> | This parameter is used for excluding stories whose source domain is the specified value. 
  source_locations_country: ['source_locations_country_example'], # Array<String> | This parameter is used for finding stories whose source country is the specified value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  not_source_locations_country: ['source_locations_country_example'], # Array<String> | This parameter is used for excluding stories whose source country is the specified value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  source_locations_state: ['source_locations_state_example'], # Array<String> | This parameter is used for finding stories whose source state/province is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  not_source_locations_state: ['source_locations_state_example'], # Array<String> | This parameter is used for excluding stories whose source state/province is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  source_locations_city: ['source_locations_city_example'], # Array<String> | This parameter is used for finding stories whose source city is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  not_source_locations_city: ['source_locations_city_example'], # Array<String> | This parameter is used for excluding stories whose source city is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  source_scopes_country: ['source_scopes_country_example'], # Array<String> | This parameter is used for finding stories whose source scopes is the specified country value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  not_source_scopes_country: ['source_scopes_country_example'], # Array<String> | This parameter is used for excluding stories whose source scopes is the specified country value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  source_scopes_state: ['source_scopes_state_example'], # Array<String> | This parameter is used for finding stories whose source scopes is the specified state/province value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  not_source_scopes_state: ['source_scopes_state_example'], # Array<String> | This parameter is used for excluding stories whose source scopes is the specified state/province value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  source_scopes_city: ['source_scopes_city_example'], # Array<String> | This parameter is used for finding stories whose source scopes is the specified city value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  not_source_scopes_city: ['source_scopes_city_example'], # Array<String> | This parameter is used for excluding stories whose source scopes is the specified city value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  source_scopes_level: ['source_scopes_level_example'], # Array<String> | This parameter is used for finding stories whose source scopes is the specified level value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  not_source_scopes_level: ['source_scopes_level_example'], # Array<String> | This parameter is used for excluding stories whose source scopes is the specified level value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
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
  aql: 'aql_example', # String | This parameter is used to supply a query in AYLIEN Query Language. 
  aql_default_field: 'text', # String | This parameter is used to supply an optional default field name used in the AQL query. 
  query: 'query_example', # String | This parameter is used to make an advanced query using $and, $or, $not logical operators and $eq for exact match, $text for a text search and $lt, $gt, $lte, $gte for range queries. value must be a json string. 
  boost_by: 'boost_by_example', # String | This parameter is used for boosting the result by the specified value. 
  story_language: 'auto', # String | This parameter is used for setting the language of the story. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes. 
  per_page: 3 # Integer | This parameter is used for specifying number of items in each page. 
}

begin
  result = api_instance.list_related_stories_post(opts)
  p result
rescue AylienNewsApi::ApiError => e
  puts "Exception when calling DefaultApi->list_related_stories_post: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | [**Array&lt;Integer&gt;**](Integer.md)| This parameter is used for finding stories by story id.  | [optional] 
 **not_id** | [**Array&lt;Integer&gt;**](Integer.md)| This parameter is used for excluding stories by story id.  | [optional] 
 **title** | **String**| This parameter is used for finding stories whose title contains a specific keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).  | [optional] 
 **body** | **String**| This parameter is used for finding stories whose body contains a specific keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).  | [optional] 
 **text** | **String**| This parameter is used for finding stories whose title or body contains a specific keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).  | [optional] 
 **translations_en_title** | **String**| This parameter is used for finding stories whose translation title contains a specific keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).  | [optional] 
 **translations_en_body** | **String**| This parameter is used for finding stories whose translation body contains a specific keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).  | [optional] 
 **translations_en_text** | **String**| This parameter is used for finding stories whose translation title or body contains a specific keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).  | [optional] 
 **links_permalink** | [**Array&lt;String&gt;**](String.md)| This parameter is used to find stories based on their url.  | [optional] 
 **not_links_permalink** | [**Array&lt;String&gt;**](String.md)| This parameter is used to exclude stories based on their url.  | [optional] 
 **language** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose language is the specified value. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes.  | [optional] 
 **not_language** | [**Array&lt;String&gt;**](String.md)| This parameter is used for excluding stories whose language is the specified value. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes.  | [optional] 
 **published_at_start** | **String**| This parameter is used for finding stories whose published at time is greater than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates).  | [optional] 
 **published_at_end** | **String**| This parameter is used for finding stories whose published at time is less than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates).  | [optional] 
 **categories_taxonomy** | **String**| This parameter is used for defining the type of the taxonomy for the rest of the categories queries. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).  | [optional] 
 **categories_confident** | **Boolean**| This parameter is used for finding stories whose categories are confident. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).  | [optional] [default to true]
 **categories_id** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories by categories id. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).  | [optional] 
 **not_categories_id** | [**Array&lt;String&gt;**](String.md)| This parameter is used for excluding stories by categories id. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).  | [optional] 
 **categories_label** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories by categories label. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).  | [optional] 
 **not_categories_label** | [**Array&lt;String&gt;**](String.md)| This parameter is used for excluding stories by categories label. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).  | [optional] 
 **categories_level** | [**Array&lt;Integer&gt;**](Integer.md)| This parameter is used for finding stories by categories level. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).  | [optional] 
 **not_categories_level** | [**Array&lt;Integer&gt;**](Integer.md)| This parameter is used for excluding stories by categories level. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).  | [optional] 
 **entities_id** | [**Array&lt;String&gt;**](String.md)| This parameter is used to find stories based on the specified entities &#x60;id&#x60;. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **not_entities_id** | [**Array&lt;String&gt;**](String.md)| This parameter is used to exclude stories based on the specified entity&#39;s &#x60;id&#x60;. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **entities_links_wikipedia** | [**Array&lt;String&gt;**](String.md)| This parameter is used to find stories based on the specified entities wikipedia URL. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **not_entities_links_wikipedia** | [**Array&lt;String&gt;**](String.md)| This parameter is used to exclude stories based on the specified entity&#39;s Wikipedia URL. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **entities_links_wikidata** | [**Array&lt;String&gt;**](String.md)| This parameter is used to find stories based on the specified entities wikidata URL. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **not_entities_links_wikidata** | [**Array&lt;String&gt;**](String.md)| This parameter is used to exclude stories based on the specified entity&#39;s Wikidata URL. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **entities_types** | [**Array&lt;String&gt;**](String.md)| This parameter is used to find stories based on the specified entities &#x60;types&#x60;. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **not_entities_types** | [**Array&lt;String&gt;**](String.md)| This parameter is used to exclude stories based on the specified entity&#39;s &#x60;types&#x60;. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **entities_stock_tickers** | [**Array&lt;String&gt;**](String.md)| This parameter is used to find stories based on the specified entities &#x60;stock_tickers&#x60;. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **entities_body_stock_tickers** | [**Array&lt;String&gt;**](String.md)| This parameter is used to exclude stories based on the specified entity&#39;s &#x60;stock_tickers&#x60; in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **entities_surface_forms_text** | [**Array&lt;String&gt;**](String.md)| This parameter is used to find stories based on the specified entities &#x60;surface_form&#x60;. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **not_entities_surface_forms_text** | [**Array&lt;String&gt;**](String.md)| This parameter is used to exclude stories based on the specified entity&#39;s &#x60;surface_form&#x60;. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **entities_title_surface_forms_text** | **String**| This parameter is used to find stories based on the specified entities &#x60;surface_form&#x60; in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **not_entities_title_surface_forms_text** | [**Array&lt;String&gt;**](String.md)| This parameter is used to exclude stories based on the specified entity&#39;s &#x60;surface_form&#x60; in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **entities_body_surface_forms_text** | [**Array&lt;String&gt;**](String.md)| This parameter is used to find stories based on the specified entities &#x60;surface_form&#x60; in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **not_entities_body_surface_forms_text** | [**Array&lt;String&gt;**](String.md)| This parameter is used to exclude stories based on the specified entity&#39;s &#x60;surface_form&#x60; in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **sentiment_title_polarity** | **String**| This parameter is used for finding stories whose title sentiment is the specified value.  | [optional] 
 **not_sentiment_title_polarity** | **String**| This parameter is used for excluding stories whose title sentiment is the specified value.  | [optional] 
 **sentiment_body_polarity** | **String**| This parameter is used for finding stories whose body sentiment is the specified value.  | [optional] 
 **not_sentiment_body_polarity** | **String**| This parameter is used for excluding stories whose body sentiment is the specified value.  | [optional] 
 **media_images_count_min** | **Integer**| This parameter is used for finding stories whose number of images is greater than or equal to the specified value.  | [optional] 
 **media_images_count_max** | **Integer**| This parameter is used for finding stories whose number of images is less than or equal to the specified value.  | [optional] 
 **media_images_width_min** | **Integer**| This parameter is used for finding stories whose width of images are greater than or equal to the specified value.  | [optional] 
 **media_images_width_max** | **Integer**| This parameter is used for finding stories whose width of images are less than or equal to the specified value.  | [optional] 
 **media_images_height_min** | **Integer**| This parameter is used for finding stories whose height of images are greater than or equal to the specified value.  | [optional] 
 **media_images_height_max** | **Integer**| This parameter is used for finding stories whose height of images are less than or equal to the specified value.  | [optional] 
 **media_images_content_length_min** | **Integer**| This parameter is used for finding stories whose images content length are greater than or equal to the specified value.  | [optional] 
 **media_images_content_length_max** | **Integer**| This parameter is used for finding stories whose images content length are less than or equal to the specified value.  | [optional] 
 **media_images_format** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose images format are the specified value.  | [optional] 
 **not_media_images_format** | [**Array&lt;String&gt;**](String.md)| This parameter is used for excluding stories whose images format are the specified value.  | [optional] 
 **media_videos_count_min** | **Integer**| This parameter is used for finding stories whose number of videos is greater than or equal to the specified value.  | [optional] 
 **media_videos_count_max** | **Integer**| This parameter is used for finding stories whose number of videos is less than or equal to the specified value.  | [optional] 
 **author_id** | [**Array&lt;Integer&gt;**](Integer.md)| This parameter is used for finding stories whose author id is the specified value.  | [optional] 
 **not_author_id** | [**Array&lt;Integer&gt;**](Integer.md)| This parameter is used for excluding stories whose author id is the specified value.  | [optional] 
 **author_name** | **String**| This parameter is used for finding stories whose author full name contains the specified value.  | [optional] 
 **not_author_name** | **String**| This parameter is used for excluding stories whose author full name contains the specified value.  | [optional] 
 **source_id** | [**Array&lt;Integer&gt;**](Integer.md)| This parameter is used for finding stories whose source id is the specified value.  | [optional] 
 **not_source_id** | [**Array&lt;Integer&gt;**](Integer.md)| This parameter is used for excluding stories whose source id is the specified value.  | [optional] 
 **source_name** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source name contains the specified value.  | [optional] 
 **not_source_name** | [**Array&lt;String&gt;**](String.md)| This parameter is used for excluding stories whose source name contains the specified value.  | [optional] 
 **source_domain** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source domain is the specified value.  | [optional] 
 **not_source_domain** | [**Array&lt;String&gt;**](String.md)| This parameter is used for excluding stories whose source domain is the specified value.  | [optional] 
 **source_locations_country** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source country is the specified value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **not_source_locations_country** | [**Array&lt;String&gt;**](String.md)| This parameter is used for excluding stories whose source country is the specified value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **source_locations_state** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source state/province is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **not_source_locations_state** | [**Array&lt;String&gt;**](String.md)| This parameter is used for excluding stories whose source state/province is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **source_locations_city** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source city is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **not_source_locations_city** | [**Array&lt;String&gt;**](String.md)| This parameter is used for excluding stories whose source city is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **source_scopes_country** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source scopes is the specified country value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **not_source_scopes_country** | [**Array&lt;String&gt;**](String.md)| This parameter is used for excluding stories whose source scopes is the specified country value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **source_scopes_state** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source scopes is the specified state/province value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **not_source_scopes_state** | [**Array&lt;String&gt;**](String.md)| This parameter is used for excluding stories whose source scopes is the specified state/province value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **source_scopes_city** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source scopes is the specified city value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **not_source_scopes_city** | [**Array&lt;String&gt;**](String.md)| This parameter is used for excluding stories whose source scopes is the specified city value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **source_scopes_level** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source scopes is the specified level value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **not_source_scopes_level** | [**Array&lt;String&gt;**](String.md)| This parameter is used for excluding stories whose source scopes is the specified level value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
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
 **aql** | **String**| This parameter is used to supply a query in AYLIEN Query Language.  | [optional] 
 **aql_default_field** | **String**| This parameter is used to supply an optional default field name used in the AQL query.  | [optional] [default to &#39;text&#39;]
 **query** | **String**| This parameter is used to make an advanced query using $and, $or, $not logical operators and $eq for exact match, $text for a text search and $lt, $gt, $lte, $gte for range queries. value must be a json string.  | [optional] 
 **boost_by** | **String**| This parameter is used for boosting the result by the specified value.  | [optional] 
 **story_language** | **String**| This parameter is used for setting the language of the story. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes.  | [optional] [default to &#39;auto&#39;]
 **per_page** | **Integer**| This parameter is used for specifying number of items in each page.  | [optional] [default to 3]

### Return type

[**RelatedStories**](RelatedStories.md)

### Authorization

[app_id](../README.md#app_id), [app_key](../README.md#app_key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json, text/xml


## list_stories

> Stories list_stories(opts)

List Stories

The stories endpoint is used to return stories based on parameters you set in your query. The News API crawler gathers articles in near real-time and stores information about them, or metadata. Below you can see all of the query parameters, which you can use to narrow down your query. 

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

api_instance = AylienNewsApi::DefaultApi.new
opts = {
  id: [56], # Array<Integer> | This parameter is used for finding stories by story id. 
  not_id: [56], # Array<Integer> | This parameter is used for excluding stories by story id. 
  title: 'title_example', # String | This parameter is used for finding stories whose title contains a specific keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators). 
  body: 'body_example', # String | This parameter is used for finding stories whose body contains a specific keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators). 
  text: 'text_example', # String | This parameter is used for finding stories whose title or body contains a specific keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators). 
  translations_en_title: 'translations_en_title_example', # String | This parameter is used for finding stories whose translation title contains a specific keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators). 
  translations_en_body: 'translations_en_body_example', # String | This parameter is used for finding stories whose translation body contains a specific keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators). 
  translations_en_text: 'translations_en_text_example', # String | This parameter is used for finding stories whose translation title or body contains a specific keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators). 
  language: ['language_example'], # Array<String> | This parameter is used for finding stories whose language is the specified value. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes. 
  not_language: ['language_example'], # Array<String> | This parameter is used for excluding stories whose language is the specified value. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes. 
  links_permalink: ['links_permalink_example'], # Array<String> | This parameter is used to find stories based on their url. 
  not_links_permalink: ['links_permalink_example'], # Array<String> | This parameter is used to exclude stories based on their url. 
  published_at_start: 'published_at_start_example', # String | This parameter is used for finding stories whose published at time is greater than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates). 
  published_at_end: 'published_at_end_example', # String | This parameter is used for finding stories whose published at time is less than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates). 
  categories_taxonomy: 'categories_taxonomy_example', # String | This parameter is used for defining the type of the taxonomy for the rest of the categories queries. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories). 
  categories_confident: true, # Boolean | This parameter is used for finding stories whose categories are confident. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories). 
  categories_id: ['categories_id_example'], # Array<String> | This parameter is used for finding stories by categories id. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories). 
  not_categories_id: ['categories_id_example'], # Array<String> | This parameter is used for excluding stories by categories id. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories). 
  categories_label: ['categories_label_example'], # Array<String> | This parameter is used for finding stories by categories label. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories). 
  not_categories_label: ['categories_label_example'], # Array<String> | This parameter is used for excluding stories by categories label. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories). 
  categories_level: [56], # Array<Integer> | This parameter is used for finding stories by categories level. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories). 
  not_categories_level: [56], # Array<Integer> | This parameter is used for excluding stories by categories level. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories). 
  entities_id: ['entities_id_example'], # Array<String> | This parameter is used to find stories based on the specified entities `id`. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  not_entities_id: ['entities_id_example'], # Array<String> | This parameter is used to exclude stories based on the specified entity's `id`. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  entities_links_wikipedia: ['entities_links_wikipedia_example'], # Array<String> | This parameter is used to find stories based on the specified entities wikipedia URL. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  not_entities_links_wikipedia: ['entities_links_wikipedia_example'], # Array<String> | This parameter is used to exclude stories based on the specified entity's Wikipedia URL. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  entities_links_wikidata: ['entities_links_wikidata_example'], # Array<String> | This parameter is used to find stories based on the specified entities wikidata URL. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  not_entities_links_wikidata: ['entities_links_wikidata_example'], # Array<String> | This parameter is used to exclude stories based on the specified entity's Wikidata URL. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  entities_types: ['entities_types_example'], # Array<String> | This parameter is used to find stories based on the specified entities `types`. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  not_entities_types: ['entities_types_example'], # Array<String> | This parameter is used to exclude stories based on the specified entity's `types`. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  entities_stock_tickers: ['entities_stock_tickers_example'], # Array<String> | This parameter is used to find stories based on the specified entities `stock_tickers`. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  entities_body_stock_tickers: ['entities_body_stock_tickers_example'], # Array<String> | This parameter is used to exclude stories based on the specified entity's `stock_tickers` in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  entities_surface_forms_text: ['entities_surface_forms_text_example'], # Array<String> | This parameter is used to find stories based on the specified entities `surface_form`. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  not_entities_surface_forms_text: ['entities_surface_forms_text_example'], # Array<String> | This parameter is used to exclude stories based on the specified entity's `surface_form`. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  entities_title_surface_forms_text: 'entities_title_surface_forms_text_example', # String | This parameter is used to find stories based on the specified entities `surface_form` in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  not_entities_title_surface_forms_text: ['entities_title_surface_forms_text_example'], # Array<String> | This parameter is used to exclude stories based on the specified entity's `surface_form` in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  entities_body_surface_forms_text: ['entities_body_surface_forms_text_example'], # Array<String> | This parameter is used to find stories based on the specified entities `surface_form` in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  not_entities_body_surface_forms_text: ['entities_body_surface_forms_text_example'], # Array<String> | This parameter is used to exclude stories based on the specified entity's `surface_form` in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  sentiment_title_polarity: 'sentiment_title_polarity_example', # String | This parameter is used for finding stories whose title sentiment is the specified value. 
  not_sentiment_title_polarity: 'sentiment_title_polarity_example', # String | This parameter is used for excluding stories whose title sentiment is the specified value. 
  sentiment_body_polarity: 'sentiment_body_polarity_example', # String | This parameter is used for finding stories whose body sentiment is the specified value. 
  not_sentiment_body_polarity: 'sentiment_body_polarity_example', # String | This parameter is used for excluding stories whose body sentiment is the specified value. 
  media_images_count_min: 56, # Integer | This parameter is used for finding stories whose number of images is greater than or equal to the specified value. 
  media_images_count_max: 56, # Integer | This parameter is used for finding stories whose number of images is less than or equal to the specified value. 
  media_images_width_min: 56, # Integer | This parameter is used for finding stories whose width of images are greater than or equal to the specified value. 
  media_images_width_max: 56, # Integer | This parameter is used for finding stories whose width of images are less than or equal to the specified value. 
  media_images_height_min: 56, # Integer | This parameter is used for finding stories whose height of images are greater than or equal to the specified value. 
  media_images_height_max: 56, # Integer | This parameter is used for finding stories whose height of images are less than or equal to the specified value. 
  media_images_content_length_min: 56, # Integer | This parameter is used for finding stories whose images content length are greater than or equal to the specified value. 
  media_images_content_length_max: 56, # Integer | This parameter is used for finding stories whose images content length are less than or equal to the specified value. 
  media_images_format: ['media_images_format_example'], # Array<String> | This parameter is used for finding stories whose images format are the specified value. 
  not_media_images_format: ['media_images_format_example'], # Array<String> | This parameter is used for excluding stories whose images format are the specified value. 
  media_videos_count_min: 56, # Integer | This parameter is used for finding stories whose number of videos is greater than or equal to the specified value. 
  media_videos_count_max: 56, # Integer | This parameter is used for finding stories whose number of videos is less than or equal to the specified value. 
  author_id: [56], # Array<Integer> | This parameter is used for finding stories whose author id is the specified value. 
  not_author_id: [56], # Array<Integer> | This parameter is used for excluding stories whose author id is the specified value. 
  author_name: 'author_name_example', # String | This parameter is used for finding stories whose author full name contains the specified value. 
  not_author_name: 'author_name_example', # String | This parameter is used for excluding stories whose author full name contains the specified value. 
  source_id: [56], # Array<Integer> | This parameter is used for finding stories whose source id is the specified value. 
  not_source_id: [56], # Array<Integer> | This parameter is used for excluding stories whose source id is the specified value. 
  source_name: ['source_name_example'], # Array<String> | This parameter is used for finding stories whose source name contains the specified value. 
  not_source_name: ['source_name_example'], # Array<String> | This parameter is used for excluding stories whose source name contains the specified value. 
  source_domain: ['source_domain_example'], # Array<String> | This parameter is used for finding stories whose source domain is the specified value. 
  not_source_domain: ['source_domain_example'], # Array<String> | This parameter is used for excluding stories whose source domain is the specified value. 
  source_locations_country: ['source_locations_country_example'], # Array<String> | This parameter is used for finding stories whose source country is the specified value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  not_source_locations_country: ['source_locations_country_example'], # Array<String> | This parameter is used for excluding stories whose source country is the specified value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  source_locations_state: ['source_locations_state_example'], # Array<String> | This parameter is used for finding stories whose source state/province is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  not_source_locations_state: ['source_locations_state_example'], # Array<String> | This parameter is used for excluding stories whose source state/province is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  source_locations_city: ['source_locations_city_example'], # Array<String> | This parameter is used for finding stories whose source city is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  not_source_locations_city: ['source_locations_city_example'], # Array<String> | This parameter is used for excluding stories whose source city is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  source_scopes_country: ['source_scopes_country_example'], # Array<String> | This parameter is used for finding stories whose source scopes is the specified country value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  not_source_scopes_country: ['source_scopes_country_example'], # Array<String> | This parameter is used for excluding stories whose source scopes is the specified country value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  source_scopes_state: ['source_scopes_state_example'], # Array<String> | This parameter is used for finding stories whose source scopes is the specified state/province value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  not_source_scopes_state: ['source_scopes_state_example'], # Array<String> | This parameter is used for excluding stories whose source scopes is the specified state/province value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  source_scopes_city: ['source_scopes_city_example'], # Array<String> | This parameter is used for finding stories whose source scopes is the specified city value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  not_source_scopes_city: ['source_scopes_city_example'], # Array<String> | This parameter is used for excluding stories whose source scopes is the specified city value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  source_scopes_level: ['source_scopes_level_example'], # Array<String> | This parameter is used for finding stories whose source scopes is the specified level value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  not_source_scopes_level: ['source_scopes_level_example'], # Array<String> | This parameter is used for excluding stories whose source scopes is the specified level value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
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
  aql: 'aql_example', # String | This parameter is used to supply a query in AYLIEN Query Language. 
  aql_default_field: 'text', # String | This parameter is used to supply an optional default field name used in the AQL query. 
  query: 'query_example', # String | This parameter is used to make an advanced query using $and, $or, $not logical operators and $eq for exact match, $text for a text search and $lt, $gt, $lte, $gte for range queries. value must be a json string. 
  sort_by: 'published_at', # String | This parameter is used for changing the order column of the results. You can read about sorting results [here](https://newsapi.aylien.com/docs/sorting-results). 
  sort_direction: 'desc', # String | This parameter is used for changing the order direction of the result. You can read about sorting results [here](https://newsapi.aylien.com/docs/sorting-results). 
  cursor: '*', # String | This parameter is used for finding a specific page. You can read more about pagination of results [here](https://newsapi.aylien.com/docs/pagination-of-results). 
  per_page: 10 # Integer | This parameter is used for specifying number of items in each page You can read more about pagination of results [here](https://newsapi.aylien.com/docs/pagination-of-results) 
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
 **id** | [**Array&lt;Integer&gt;**](Integer.md)| This parameter is used for finding stories by story id.  | [optional] 
 **not_id** | [**Array&lt;Integer&gt;**](Integer.md)| This parameter is used for excluding stories by story id.  | [optional] 
 **title** | **String**| This parameter is used for finding stories whose title contains a specific keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).  | [optional] 
 **body** | **String**| This parameter is used for finding stories whose body contains a specific keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).  | [optional] 
 **text** | **String**| This parameter is used for finding stories whose title or body contains a specific keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).  | [optional] 
 **translations_en_title** | **String**| This parameter is used for finding stories whose translation title contains a specific keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).  | [optional] 
 **translations_en_body** | **String**| This parameter is used for finding stories whose translation body contains a specific keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).  | [optional] 
 **translations_en_text** | **String**| This parameter is used for finding stories whose translation title or body contains a specific keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).  | [optional] 
 **language** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose language is the specified value. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes.  | [optional] 
 **not_language** | [**Array&lt;String&gt;**](String.md)| This parameter is used for excluding stories whose language is the specified value. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes.  | [optional] 
 **links_permalink** | [**Array&lt;String&gt;**](String.md)| This parameter is used to find stories based on their url.  | [optional] 
 **not_links_permalink** | [**Array&lt;String&gt;**](String.md)| This parameter is used to exclude stories based on their url.  | [optional] 
 **published_at_start** | **String**| This parameter is used for finding stories whose published at time is greater than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates).  | [optional] 
 **published_at_end** | **String**| This parameter is used for finding stories whose published at time is less than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates).  | [optional] 
 **categories_taxonomy** | **String**| This parameter is used for defining the type of the taxonomy for the rest of the categories queries. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).  | [optional] 
 **categories_confident** | **Boolean**| This parameter is used for finding stories whose categories are confident. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).  | [optional] [default to true]
 **categories_id** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories by categories id. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).  | [optional] 
 **not_categories_id** | [**Array&lt;String&gt;**](String.md)| This parameter is used for excluding stories by categories id. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).  | [optional] 
 **categories_label** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories by categories label. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).  | [optional] 
 **not_categories_label** | [**Array&lt;String&gt;**](String.md)| This parameter is used for excluding stories by categories label. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).  | [optional] 
 **categories_level** | [**Array&lt;Integer&gt;**](Integer.md)| This parameter is used for finding stories by categories level. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).  | [optional] 
 **not_categories_level** | [**Array&lt;Integer&gt;**](Integer.md)| This parameter is used for excluding stories by categories level. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).  | [optional] 
 **entities_id** | [**Array&lt;String&gt;**](String.md)| This parameter is used to find stories based on the specified entities &#x60;id&#x60;. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **not_entities_id** | [**Array&lt;String&gt;**](String.md)| This parameter is used to exclude stories based on the specified entity&#39;s &#x60;id&#x60;. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **entities_links_wikipedia** | [**Array&lt;String&gt;**](String.md)| This parameter is used to find stories based on the specified entities wikipedia URL. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **not_entities_links_wikipedia** | [**Array&lt;String&gt;**](String.md)| This parameter is used to exclude stories based on the specified entity&#39;s Wikipedia URL. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **entities_links_wikidata** | [**Array&lt;String&gt;**](String.md)| This parameter is used to find stories based on the specified entities wikidata URL. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **not_entities_links_wikidata** | [**Array&lt;String&gt;**](String.md)| This parameter is used to exclude stories based on the specified entity&#39;s Wikidata URL. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **entities_types** | [**Array&lt;String&gt;**](String.md)| This parameter is used to find stories based on the specified entities &#x60;types&#x60;. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **not_entities_types** | [**Array&lt;String&gt;**](String.md)| This parameter is used to exclude stories based on the specified entity&#39;s &#x60;types&#x60;. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **entities_stock_tickers** | [**Array&lt;String&gt;**](String.md)| This parameter is used to find stories based on the specified entities &#x60;stock_tickers&#x60;. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **entities_body_stock_tickers** | [**Array&lt;String&gt;**](String.md)| This parameter is used to exclude stories based on the specified entity&#39;s &#x60;stock_tickers&#x60; in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **entities_surface_forms_text** | [**Array&lt;String&gt;**](String.md)| This parameter is used to find stories based on the specified entities &#x60;surface_form&#x60;. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **not_entities_surface_forms_text** | [**Array&lt;String&gt;**](String.md)| This parameter is used to exclude stories based on the specified entity&#39;s &#x60;surface_form&#x60;. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **entities_title_surface_forms_text** | **String**| This parameter is used to find stories based on the specified entities &#x60;surface_form&#x60; in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **not_entities_title_surface_forms_text** | [**Array&lt;String&gt;**](String.md)| This parameter is used to exclude stories based on the specified entity&#39;s &#x60;surface_form&#x60; in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **entities_body_surface_forms_text** | [**Array&lt;String&gt;**](String.md)| This parameter is used to find stories based on the specified entities &#x60;surface_form&#x60; in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **not_entities_body_surface_forms_text** | [**Array&lt;String&gt;**](String.md)| This parameter is used to exclude stories based on the specified entity&#39;s &#x60;surface_form&#x60; in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **sentiment_title_polarity** | **String**| This parameter is used for finding stories whose title sentiment is the specified value.  | [optional] 
 **not_sentiment_title_polarity** | **String**| This parameter is used for excluding stories whose title sentiment is the specified value.  | [optional] 
 **sentiment_body_polarity** | **String**| This parameter is used for finding stories whose body sentiment is the specified value.  | [optional] 
 **not_sentiment_body_polarity** | **String**| This parameter is used for excluding stories whose body sentiment is the specified value.  | [optional] 
 **media_images_count_min** | **Integer**| This parameter is used for finding stories whose number of images is greater than or equal to the specified value.  | [optional] 
 **media_images_count_max** | **Integer**| This parameter is used for finding stories whose number of images is less than or equal to the specified value.  | [optional] 
 **media_images_width_min** | **Integer**| This parameter is used for finding stories whose width of images are greater than or equal to the specified value.  | [optional] 
 **media_images_width_max** | **Integer**| This parameter is used for finding stories whose width of images are less than or equal to the specified value.  | [optional] 
 **media_images_height_min** | **Integer**| This parameter is used for finding stories whose height of images are greater than or equal to the specified value.  | [optional] 
 **media_images_height_max** | **Integer**| This parameter is used for finding stories whose height of images are less than or equal to the specified value.  | [optional] 
 **media_images_content_length_min** | **Integer**| This parameter is used for finding stories whose images content length are greater than or equal to the specified value.  | [optional] 
 **media_images_content_length_max** | **Integer**| This parameter is used for finding stories whose images content length are less than or equal to the specified value.  | [optional] 
 **media_images_format** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose images format are the specified value.  | [optional] 
 **not_media_images_format** | [**Array&lt;String&gt;**](String.md)| This parameter is used for excluding stories whose images format are the specified value.  | [optional] 
 **media_videos_count_min** | **Integer**| This parameter is used for finding stories whose number of videos is greater than or equal to the specified value.  | [optional] 
 **media_videos_count_max** | **Integer**| This parameter is used for finding stories whose number of videos is less than or equal to the specified value.  | [optional] 
 **author_id** | [**Array&lt;Integer&gt;**](Integer.md)| This parameter is used for finding stories whose author id is the specified value.  | [optional] 
 **not_author_id** | [**Array&lt;Integer&gt;**](Integer.md)| This parameter is used for excluding stories whose author id is the specified value.  | [optional] 
 **author_name** | **String**| This parameter is used for finding stories whose author full name contains the specified value.  | [optional] 
 **not_author_name** | **String**| This parameter is used for excluding stories whose author full name contains the specified value.  | [optional] 
 **source_id** | [**Array&lt;Integer&gt;**](Integer.md)| This parameter is used for finding stories whose source id is the specified value.  | [optional] 
 **not_source_id** | [**Array&lt;Integer&gt;**](Integer.md)| This parameter is used for excluding stories whose source id is the specified value.  | [optional] 
 **source_name** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source name contains the specified value.  | [optional] 
 **not_source_name** | [**Array&lt;String&gt;**](String.md)| This parameter is used for excluding stories whose source name contains the specified value.  | [optional] 
 **source_domain** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source domain is the specified value.  | [optional] 
 **not_source_domain** | [**Array&lt;String&gt;**](String.md)| This parameter is used for excluding stories whose source domain is the specified value.  | [optional] 
 **source_locations_country** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source country is the specified value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **not_source_locations_country** | [**Array&lt;String&gt;**](String.md)| This parameter is used for excluding stories whose source country is the specified value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **source_locations_state** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source state/province is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **not_source_locations_state** | [**Array&lt;String&gt;**](String.md)| This parameter is used for excluding stories whose source state/province is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **source_locations_city** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source city is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **not_source_locations_city** | [**Array&lt;String&gt;**](String.md)| This parameter is used for excluding stories whose source city is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **source_scopes_country** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source scopes is the specified country value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **not_source_scopes_country** | [**Array&lt;String&gt;**](String.md)| This parameter is used for excluding stories whose source scopes is the specified country value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **source_scopes_state** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source scopes is the specified state/province value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **not_source_scopes_state** | [**Array&lt;String&gt;**](String.md)| This parameter is used for excluding stories whose source scopes is the specified state/province value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **source_scopes_city** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source scopes is the specified city value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **not_source_scopes_city** | [**Array&lt;String&gt;**](String.md)| This parameter is used for excluding stories whose source scopes is the specified city value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **source_scopes_level** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source scopes is the specified level value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **not_source_scopes_level** | [**Array&lt;String&gt;**](String.md)| This parameter is used for excluding stories whose source scopes is the specified level value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
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
 **aql** | **String**| This parameter is used to supply a query in AYLIEN Query Language.  | [optional] 
 **aql_default_field** | **String**| This parameter is used to supply an optional default field name used in the AQL query.  | [optional] [default to &#39;text&#39;]
 **query** | **String**| This parameter is used to make an advanced query using $and, $or, $not logical operators and $eq for exact match, $text for a text search and $lt, $gt, $lte, $gte for range queries. value must be a json string.  | [optional] 
 **sort_by** | **String**| This parameter is used for changing the order column of the results. You can read about sorting results [here](https://newsapi.aylien.com/docs/sorting-results).  | [optional] [default to &#39;published_at&#39;]
 **sort_direction** | **String**| This parameter is used for changing the order direction of the result. You can read about sorting results [here](https://newsapi.aylien.com/docs/sorting-results).  | [optional] [default to &#39;desc&#39;]
 **cursor** | **String**| This parameter is used for finding a specific page. You can read more about pagination of results [here](https://newsapi.aylien.com/docs/pagination-of-results).  | [optional] [default to &#39;*&#39;]
 **per_page** | **Integer**| This parameter is used for specifying number of items in each page You can read more about pagination of results [here](https://newsapi.aylien.com/docs/pagination-of-results)  | [optional] [default to 10]

### Return type

[**Stories**](Stories.md)

### Authorization

[app_id](../README.md#app_id), [app_key](../README.md#app_key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json, text/xml


## list_time_series

> TimeSeriesList list_time_series(opts)

List time series

The time series endpoint allows you to track information contained in stories over time. This information can be anything from mentions of a topic or entities, sentiment about a topic, or the volume of stories published by a source, to name but a few. The full list of parameters is given below. Using the [Date Math Syntax](https://newsapi.aylien.com/docs/working-with-dates), you can easily set your query to return information from any time period, from the current point in time to when the News API started collecting stories. The returned information can be rounded to a time also specified by you, for example by setting the results into hourly, daily, or weekly data points. 

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

api_instance = AylienNewsApi::DefaultApi.new
opts = {
  id: [56], # Array<Integer> | This parameter is used for finding stories by story id. 
  not_id: [56], # Array<Integer> | This parameter is used for excluding stories by story id. 
  title: 'title_example', # String | This parameter is used for finding stories whose title contains a specific keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators). 
  body: 'body_example', # String | This parameter is used for finding stories whose body contains a specific keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators). 
  text: 'text_example', # String | This parameter is used for finding stories whose title or body contains a specific keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators). 
  translations_en_title: 'translations_en_title_example', # String | This parameter is used for finding stories whose translation title contains a specific keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators). 
  translations_en_body: 'translations_en_body_example', # String | This parameter is used for finding stories whose translation body contains a specific keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators). 
  translations_en_text: 'translations_en_text_example', # String | This parameter is used for finding stories whose translation title or body contains a specific keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators). 
  language: ['language_example'], # Array<String> | This parameter is used for finding stories whose language is the specified value. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes. 
  not_language: ['language_example'], # Array<String> | This parameter is used for excluding stories whose language is the specified value. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes. 
  categories_taxonomy: 'categories_taxonomy_example', # String | This parameter is used for defining the type of the taxonomy for the rest of the categories queries. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories). 
  categories_confident: true, # Boolean | This parameter is used for finding stories whose categories are confident. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories). 
  categories_id: ['categories_id_example'], # Array<String> | This parameter is used for finding stories by categories id. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories). 
  not_categories_id: ['categories_id_example'], # Array<String> | This parameter is used for excluding stories by categories id. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories). 
  categories_label: ['categories_label_example'], # Array<String> | This parameter is used for finding stories by categories label. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories). 
  not_categories_label: ['categories_label_example'], # Array<String> | This parameter is used for excluding stories by categories label. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories). 
  categories_level: [56], # Array<Integer> | This parameter is used for finding stories by categories level. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories). 
  not_categories_level: [56], # Array<Integer> | This parameter is used for excluding stories by categories level. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories). 
  entities_id: ['entities_id_example'], # Array<String> | This parameter is used to find stories based on the specified entities `id`. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  not_entities_id: ['entities_id_example'], # Array<String> | This parameter is used to exclude stories based on the specified entity's `id`. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  entities_links_wikipedia: ['entities_links_wikipedia_example'], # Array<String> | This parameter is used to find stories based on the specified entities wikipedia URL. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  not_entities_links_wikipedia: ['entities_links_wikipedia_example'], # Array<String> | This parameter is used to exclude stories based on the specified entity's Wikipedia URL. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  entities_links_wikidata: ['entities_links_wikidata_example'], # Array<String> | This parameter is used to find stories based on the specified entities wikidata URL. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  not_entities_links_wikidata: ['entities_links_wikidata_example'], # Array<String> | This parameter is used to exclude stories based on the specified entity's Wikidata URL. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  entities_types: ['entities_types_example'], # Array<String> | This parameter is used to find stories based on the specified entities `types`. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  not_entities_types: ['entities_types_example'], # Array<String> | This parameter is used to exclude stories based on the specified entity's `types`. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  entities_stock_tickers: ['entities_stock_tickers_example'], # Array<String> | This parameter is used to find stories based on the specified entities `stock_tickers`. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  entities_body_stock_tickers: ['entities_body_stock_tickers_example'], # Array<String> | This parameter is used to exclude stories based on the specified entity's `stock_tickers` in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  entities_surface_forms_text: ['entities_surface_forms_text_example'], # Array<String> | This parameter is used to find stories based on the specified entities `surface_form`. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  not_entities_surface_forms_text: ['entities_surface_forms_text_example'], # Array<String> | This parameter is used to exclude stories based on the specified entity's `surface_form`. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  entities_title_surface_forms_text: 'entities_title_surface_forms_text_example', # String | This parameter is used to find stories based on the specified entities `surface_form` in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  not_entities_title_surface_forms_text: ['entities_title_surface_forms_text_example'], # Array<String> | This parameter is used to exclude stories based on the specified entity's `surface_form` in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  entities_body_surface_forms_text: ['entities_body_surface_forms_text_example'], # Array<String> | This parameter is used to find stories based on the specified entities `surface_form` in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  not_entities_body_surface_forms_text: ['entities_body_surface_forms_text_example'], # Array<String> | This parameter is used to exclude stories based on the specified entity's `surface_form` in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  sentiment_title_polarity: 'sentiment_title_polarity_example', # String | This parameter is used for finding stories whose title sentiment is the specified value. 
  not_sentiment_title_polarity: 'sentiment_title_polarity_example', # String | This parameter is used for excluding stories whose title sentiment is the specified value. 
  sentiment_body_polarity: 'sentiment_body_polarity_example', # String | This parameter is used for finding stories whose body sentiment is the specified value. 
  not_sentiment_body_polarity: 'sentiment_body_polarity_example', # String | This parameter is used for excluding stories whose body sentiment is the specified value. 
  media_images_count_min: 56, # Integer | This parameter is used for finding stories whose number of images is greater than or equal to the specified value. 
  media_images_count_max: 56, # Integer | This parameter is used for finding stories whose number of images is less than or equal to the specified value. 
  media_images_width_min: 56, # Integer | This parameter is used for finding stories whose width of images are greater than or equal to the specified value. 
  media_images_width_max: 56, # Integer | This parameter is used for finding stories whose width of images are less than or equal to the specified value. 
  media_images_height_min: 56, # Integer | This parameter is used for finding stories whose height of images are greater than or equal to the specified value. 
  media_images_height_max: 56, # Integer | This parameter is used for finding stories whose height of images are less than or equal to the specified value. 
  media_images_content_length_min: 56, # Integer | This parameter is used for finding stories whose images content length are greater than or equal to the specified value. 
  media_images_content_length_max: 56, # Integer | This parameter is used for finding stories whose images content length are less than or equal to the specified value. 
  media_images_format: ['media_images_format_example'], # Array<String> | This parameter is used for finding stories whose images format are the specified value. 
  not_media_images_format: ['media_images_format_example'], # Array<String> | This parameter is used for excluding stories whose images format are the specified value. 
  media_videos_count_min: 56, # Integer | This parameter is used for finding stories whose number of videos is greater than or equal to the specified value. 
  media_videos_count_max: 56, # Integer | This parameter is used for finding stories whose number of videos is less than or equal to the specified value. 
  author_id: [56], # Array<Integer> | This parameter is used for finding stories whose author id is the specified value. 
  not_author_id: [56], # Array<Integer> | This parameter is used for excluding stories whose author id is the specified value. 
  author_name: 'author_name_example', # String | This parameter is used for finding stories whose author full name contains the specified value. 
  not_author_name: 'author_name_example', # String | This parameter is used for excluding stories whose author full name contains the specified value. 
  source_id: [56], # Array<Integer> | This parameter is used for finding stories whose source id is the specified value. 
  not_source_id: [56], # Array<Integer> | This parameter is used for excluding stories whose source id is the specified value. 
  source_name: ['source_name_example'], # Array<String> | This parameter is used for finding stories whose source name contains the specified value. 
  not_source_name: ['source_name_example'], # Array<String> | This parameter is used for excluding stories whose source name contains the specified value. 
  source_domain: ['source_domain_example'], # Array<String> | This parameter is used for finding stories whose source domain is the specified value. 
  not_source_domain: ['source_domain_example'], # Array<String> | This parameter is used for excluding stories whose source domain is the specified value. 
  source_locations_country: ['source_locations_country_example'], # Array<String> | This parameter is used for finding stories whose source country is the specified value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  not_source_locations_country: ['source_locations_country_example'], # Array<String> | This parameter is used for excluding stories whose source country is the specified value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  source_locations_state: ['source_locations_state_example'], # Array<String> | This parameter is used for finding stories whose source state/province is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  not_source_locations_state: ['source_locations_state_example'], # Array<String> | This parameter is used for excluding stories whose source state/province is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  source_locations_city: ['source_locations_city_example'], # Array<String> | This parameter is used for finding stories whose source city is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  not_source_locations_city: ['source_locations_city_example'], # Array<String> | This parameter is used for excluding stories whose source city is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  source_scopes_country: ['source_scopes_country_example'], # Array<String> | This parameter is used for finding stories whose source scopes is the specified country value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  not_source_scopes_country: ['source_scopes_country_example'], # Array<String> | This parameter is used for excluding stories whose source scopes is the specified country value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  source_scopes_state: ['source_scopes_state_example'], # Array<String> | This parameter is used for finding stories whose source scopes is the specified state/province value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  not_source_scopes_state: ['source_scopes_state_example'], # Array<String> | This parameter is used for excluding stories whose source scopes is the specified state/province value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  source_scopes_city: ['source_scopes_city_example'], # Array<String> | This parameter is used for finding stories whose source scopes is the specified city value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  not_source_scopes_city: ['source_scopes_city_example'], # Array<String> | This parameter is used for excluding stories whose source scopes is the specified city value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  source_scopes_level: ['source_scopes_level_example'], # Array<String> | This parameter is used for finding stories whose source scopes is the specified level value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  not_source_scopes_level: ['source_scopes_level_example'], # Array<String> | This parameter is used for excluding stories whose source scopes is the specified level value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
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
  aql: 'aql_example', # String | This parameter is used to supply a query in AYLIEN Query Language. 
  aql_default_field: 'text', # String | This parameter is used to supply an optional default field name used in the AQL query. 
  query: 'query_example', # String | This parameter is used to make an advanced query using $and, $or, $not logical operators and $eq for exact match, $text for a text search and $lt, $gt, $lte, $gte for range queries. value must be a json string. 
  published_at_start: 'NOW-7DAYS/DAY', # String | This parameter is used for finding stories whose published at time is less than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates). 
  published_at_end: 'NOW/DAY', # String | This parameter is used for finding stories whose published at time is greater than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates). 
  period: '+1DAY' # String | The size of each date range is expressed as an interval to be added to the lower bound. It supports Date Math Syntax. Valid options are `+` following an integer number greater than 0 and one of the Date Math keywords. e.g. `+1DAY`, `+2MINUTES` and `+1MONTH`. Here are [Supported keywords](https://newsapi.aylien.com/docs/working-with-dates#date-math). 
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
 **id** | [**Array&lt;Integer&gt;**](Integer.md)| This parameter is used for finding stories by story id.  | [optional] 
 **not_id** | [**Array&lt;Integer&gt;**](Integer.md)| This parameter is used for excluding stories by story id.  | [optional] 
 **title** | **String**| This parameter is used for finding stories whose title contains a specific keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).  | [optional] 
 **body** | **String**| This parameter is used for finding stories whose body contains a specific keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).  | [optional] 
 **text** | **String**| This parameter is used for finding stories whose title or body contains a specific keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).  | [optional] 
 **translations_en_title** | **String**| This parameter is used for finding stories whose translation title contains a specific keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).  | [optional] 
 **translations_en_body** | **String**| This parameter is used for finding stories whose translation body contains a specific keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).  | [optional] 
 **translations_en_text** | **String**| This parameter is used for finding stories whose translation title or body contains a specific keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).  | [optional] 
 **language** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose language is the specified value. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes.  | [optional] 
 **not_language** | [**Array&lt;String&gt;**](String.md)| This parameter is used for excluding stories whose language is the specified value. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes.  | [optional] 
 **categories_taxonomy** | **String**| This parameter is used for defining the type of the taxonomy for the rest of the categories queries. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).  | [optional] 
 **categories_confident** | **Boolean**| This parameter is used for finding stories whose categories are confident. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).  | [optional] [default to true]
 **categories_id** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories by categories id. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).  | [optional] 
 **not_categories_id** | [**Array&lt;String&gt;**](String.md)| This parameter is used for excluding stories by categories id. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).  | [optional] 
 **categories_label** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories by categories label. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).  | [optional] 
 **not_categories_label** | [**Array&lt;String&gt;**](String.md)| This parameter is used for excluding stories by categories label. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).  | [optional] 
 **categories_level** | [**Array&lt;Integer&gt;**](Integer.md)| This parameter is used for finding stories by categories level. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).  | [optional] 
 **not_categories_level** | [**Array&lt;Integer&gt;**](Integer.md)| This parameter is used for excluding stories by categories level. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).  | [optional] 
 **entities_id** | [**Array&lt;String&gt;**](String.md)| This parameter is used to find stories based on the specified entities &#x60;id&#x60;. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **not_entities_id** | [**Array&lt;String&gt;**](String.md)| This parameter is used to exclude stories based on the specified entity&#39;s &#x60;id&#x60;. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **entities_links_wikipedia** | [**Array&lt;String&gt;**](String.md)| This parameter is used to find stories based on the specified entities wikipedia URL. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **not_entities_links_wikipedia** | [**Array&lt;String&gt;**](String.md)| This parameter is used to exclude stories based on the specified entity&#39;s Wikipedia URL. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **entities_links_wikidata** | [**Array&lt;String&gt;**](String.md)| This parameter is used to find stories based on the specified entities wikidata URL. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **not_entities_links_wikidata** | [**Array&lt;String&gt;**](String.md)| This parameter is used to exclude stories based on the specified entity&#39;s Wikidata URL. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **entities_types** | [**Array&lt;String&gt;**](String.md)| This parameter is used to find stories based on the specified entities &#x60;types&#x60;. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **not_entities_types** | [**Array&lt;String&gt;**](String.md)| This parameter is used to exclude stories based on the specified entity&#39;s &#x60;types&#x60;. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **entities_stock_tickers** | [**Array&lt;String&gt;**](String.md)| This parameter is used to find stories based on the specified entities &#x60;stock_tickers&#x60;. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **entities_body_stock_tickers** | [**Array&lt;String&gt;**](String.md)| This parameter is used to exclude stories based on the specified entity&#39;s &#x60;stock_tickers&#x60; in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **entities_surface_forms_text** | [**Array&lt;String&gt;**](String.md)| This parameter is used to find stories based on the specified entities &#x60;surface_form&#x60;. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **not_entities_surface_forms_text** | [**Array&lt;String&gt;**](String.md)| This parameter is used to exclude stories based on the specified entity&#39;s &#x60;surface_form&#x60;. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **entities_title_surface_forms_text** | **String**| This parameter is used to find stories based on the specified entities &#x60;surface_form&#x60; in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **not_entities_title_surface_forms_text** | [**Array&lt;String&gt;**](String.md)| This parameter is used to exclude stories based on the specified entity&#39;s &#x60;surface_form&#x60; in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **entities_body_surface_forms_text** | [**Array&lt;String&gt;**](String.md)| This parameter is used to find stories based on the specified entities &#x60;surface_form&#x60; in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **not_entities_body_surface_forms_text** | [**Array&lt;String&gt;**](String.md)| This parameter is used to exclude stories based on the specified entity&#39;s &#x60;surface_form&#x60; in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **sentiment_title_polarity** | **String**| This parameter is used for finding stories whose title sentiment is the specified value.  | [optional] 
 **not_sentiment_title_polarity** | **String**| This parameter is used for excluding stories whose title sentiment is the specified value.  | [optional] 
 **sentiment_body_polarity** | **String**| This parameter is used for finding stories whose body sentiment is the specified value.  | [optional] 
 **not_sentiment_body_polarity** | **String**| This parameter is used for excluding stories whose body sentiment is the specified value.  | [optional] 
 **media_images_count_min** | **Integer**| This parameter is used for finding stories whose number of images is greater than or equal to the specified value.  | [optional] 
 **media_images_count_max** | **Integer**| This parameter is used for finding stories whose number of images is less than or equal to the specified value.  | [optional] 
 **media_images_width_min** | **Integer**| This parameter is used for finding stories whose width of images are greater than or equal to the specified value.  | [optional] 
 **media_images_width_max** | **Integer**| This parameter is used for finding stories whose width of images are less than or equal to the specified value.  | [optional] 
 **media_images_height_min** | **Integer**| This parameter is used for finding stories whose height of images are greater than or equal to the specified value.  | [optional] 
 **media_images_height_max** | **Integer**| This parameter is used for finding stories whose height of images are less than or equal to the specified value.  | [optional] 
 **media_images_content_length_min** | **Integer**| This parameter is used for finding stories whose images content length are greater than or equal to the specified value.  | [optional] 
 **media_images_content_length_max** | **Integer**| This parameter is used for finding stories whose images content length are less than or equal to the specified value.  | [optional] 
 **media_images_format** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose images format are the specified value.  | [optional] 
 **not_media_images_format** | [**Array&lt;String&gt;**](String.md)| This parameter is used for excluding stories whose images format are the specified value.  | [optional] 
 **media_videos_count_min** | **Integer**| This parameter is used for finding stories whose number of videos is greater than or equal to the specified value.  | [optional] 
 **media_videos_count_max** | **Integer**| This parameter is used for finding stories whose number of videos is less than or equal to the specified value.  | [optional] 
 **author_id** | [**Array&lt;Integer&gt;**](Integer.md)| This parameter is used for finding stories whose author id is the specified value.  | [optional] 
 **not_author_id** | [**Array&lt;Integer&gt;**](Integer.md)| This parameter is used for excluding stories whose author id is the specified value.  | [optional] 
 **author_name** | **String**| This parameter is used for finding stories whose author full name contains the specified value.  | [optional] 
 **not_author_name** | **String**| This parameter is used for excluding stories whose author full name contains the specified value.  | [optional] 
 **source_id** | [**Array&lt;Integer&gt;**](Integer.md)| This parameter is used for finding stories whose source id is the specified value.  | [optional] 
 **not_source_id** | [**Array&lt;Integer&gt;**](Integer.md)| This parameter is used for excluding stories whose source id is the specified value.  | [optional] 
 **source_name** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source name contains the specified value.  | [optional] 
 **not_source_name** | [**Array&lt;String&gt;**](String.md)| This parameter is used for excluding stories whose source name contains the specified value.  | [optional] 
 **source_domain** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source domain is the specified value.  | [optional] 
 **not_source_domain** | [**Array&lt;String&gt;**](String.md)| This parameter is used for excluding stories whose source domain is the specified value.  | [optional] 
 **source_locations_country** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source country is the specified value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **not_source_locations_country** | [**Array&lt;String&gt;**](String.md)| This parameter is used for excluding stories whose source country is the specified value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **source_locations_state** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source state/province is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **not_source_locations_state** | [**Array&lt;String&gt;**](String.md)| This parameter is used for excluding stories whose source state/province is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **source_locations_city** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source city is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **not_source_locations_city** | [**Array&lt;String&gt;**](String.md)| This parameter is used for excluding stories whose source city is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **source_scopes_country** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source scopes is the specified country value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **not_source_scopes_country** | [**Array&lt;String&gt;**](String.md)| This parameter is used for excluding stories whose source scopes is the specified country value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **source_scopes_state** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source scopes is the specified state/province value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **not_source_scopes_state** | [**Array&lt;String&gt;**](String.md)| This parameter is used for excluding stories whose source scopes is the specified state/province value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **source_scopes_city** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source scopes is the specified city value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **not_source_scopes_city** | [**Array&lt;String&gt;**](String.md)| This parameter is used for excluding stories whose source scopes is the specified city value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **source_scopes_level** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source scopes is the specified level value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **not_source_scopes_level** | [**Array&lt;String&gt;**](String.md)| This parameter is used for excluding stories whose source scopes is the specified level value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
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
 **aql** | **String**| This parameter is used to supply a query in AYLIEN Query Language.  | [optional] 
 **aql_default_field** | **String**| This parameter is used to supply an optional default field name used in the AQL query.  | [optional] [default to &#39;text&#39;]
 **query** | **String**| This parameter is used to make an advanced query using $and, $or, $not logical operators and $eq for exact match, $text for a text search and $lt, $gt, $lte, $gte for range queries. value must be a json string.  | [optional] 
 **published_at_start** | **String**| This parameter is used for finding stories whose published at time is less than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates).  | [optional] [default to &#39;NOW-7DAYS/DAY&#39;]
 **published_at_end** | **String**| This parameter is used for finding stories whose published at time is greater than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates).  | [optional] [default to &#39;NOW/DAY&#39;]
 **period** | **String**| The size of each date range is expressed as an interval to be added to the lower bound. It supports Date Math Syntax. Valid options are &#x60;+&#x60; following an integer number greater than 0 and one of the Date Math keywords. e.g. &#x60;+1DAY&#x60;, &#x60;+2MINUTES&#x60; and &#x60;+1MONTH&#x60;. Here are [Supported keywords](https://newsapi.aylien.com/docs/working-with-dates#date-math).  | [optional] [default to &#39;+1DAY&#39;]

### Return type

[**TimeSeriesList**](TimeSeriesList.md)

### Authorization

[app_id](../README.md#app_id), [app_key](../README.md#app_key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json, text/xml


## list_trends

> Trends list_trends(field, opts)

List trends

The trends endpoint allows you to identify the most-mentioned entities, concepts and keywords relevant to your query. For example, this endpoint allows you to set parameters like a time period, a subject category, or an entity, and your request will return the most mentioned entities or keywords that are mentioned in relation to your query. 

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

api_instance = AylienNewsApi::DefaultApi.new
field = 'keywords' # String | This parameter is used to specify the trend field. 
opts = {
  id: [56], # Array<Integer> | This parameter is used for finding stories by story id. 
  not_id: [56], # Array<Integer> | This parameter is used for excluding stories by story id. 
  title: 'title_example', # String | This parameter is used for finding stories whose title contains a specific keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators). 
  body: 'body_example', # String | This parameter is used for finding stories whose body contains a specific keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators). 
  text: 'text_example', # String | This parameter is used for finding stories whose title or body contains a specific keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators). 
  translations_en_title: 'translations_en_title_example', # String | This parameter is used for finding stories whose translation title contains a specific keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators). 
  translations_en_body: 'translations_en_body_example', # String | This parameter is used for finding stories whose translation body contains a specific keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators). 
  translations_en_text: 'translations_en_text_example', # String | This parameter is used for finding stories whose translation title or body contains a specific keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators). 
  links_permalink: ['links_permalink_example'], # Array<String> | This parameter is used to find stories based on their url. 
  not_links_permalink: ['links_permalink_example'], # Array<String> | This parameter is used to exclude stories based on their url. 
  language: ['language_example'], # Array<String> | This parameter is used for finding stories whose language is the specified value. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes. 
  not_language: ['language_example'], # Array<String> | This parameter is used for excluding stories whose language is the specified value. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes. 
  published_at_start: 'published_at_start_example', # String | This parameter is used for finding stories whose published at time is greater than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates). 
  published_at_end: 'published_at_end_example', # String | This parameter is used for finding stories whose published at time is less than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates). 
  categories_taxonomy: 'categories_taxonomy_example', # String | This parameter is used for defining the type of the taxonomy for the rest of the categories queries. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories). 
  categories_confident: true, # Boolean | This parameter is used for finding stories whose categories are confident. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories). 
  categories_id: ['categories_id_example'], # Array<String> | This parameter is used for finding stories by categories id. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories). 
  not_categories_id: ['categories_id_example'], # Array<String> | This parameter is used for excluding stories by categories id. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories). 
  categories_label: ['categories_label_example'], # Array<String> | This parameter is used for finding stories by categories label. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories). 
  not_categories_label: ['categories_label_example'], # Array<String> | This parameter is used for excluding stories by categories label. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories). 
  categories_level: [56], # Array<Integer> | This parameter is used for finding stories by categories level. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories). 
  not_categories_level: [56], # Array<Integer> | This parameter is used for excluding stories by categories level. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories). 
  entities_id: ['entities_id_example'], # Array<String> | This parameter is used to find stories based on the specified entities `id`. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  not_entities_id: ['entities_id_example'], # Array<String> | This parameter is used to exclude stories based on the specified entity's `id`. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  entities_links_wikipedia: ['entities_links_wikipedia_example'], # Array<String> | This parameter is used to find stories based on the specified entities wikipedia URL. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  not_entities_links_wikipedia: ['entities_links_wikipedia_example'], # Array<String> | This parameter is used to exclude stories based on the specified entity's Wikipedia URL. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  entities_links_wikidata: ['entities_links_wikidata_example'], # Array<String> | This parameter is used to find stories based on the specified entities wikidata URL. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  not_entities_links_wikidata: ['entities_links_wikidata_example'], # Array<String> | This parameter is used to exclude stories based on the specified entity's Wikidata URL. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  entities_types: ['entities_types_example'], # Array<String> | This parameter is used to find stories based on the specified entities `types`. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  not_entities_types: ['entities_types_example'], # Array<String> | This parameter is used to exclude stories based on the specified entity's `types`. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  entities_stock_tickers: ['entities_stock_tickers_example'], # Array<String> | This parameter is used to find stories based on the specified entities `stock_tickers`. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  entities_body_stock_tickers: ['entities_body_stock_tickers_example'], # Array<String> | This parameter is used to exclude stories based on the specified entity's `stock_tickers` in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  entities_surface_forms_text: ['entities_surface_forms_text_example'], # Array<String> | This parameter is used to find stories based on the specified entities `surface_form`. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  not_entities_surface_forms_text: ['entities_surface_forms_text_example'], # Array<String> | This parameter is used to exclude stories based on the specified entity's `surface_form`. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  entities_title_surface_forms_text: 'entities_title_surface_forms_text_example', # String | This parameter is used to find stories based on the specified entities `surface_form` in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  not_entities_title_surface_forms_text: ['entities_title_surface_forms_text_example'], # Array<String> | This parameter is used to exclude stories based on the specified entity's `surface_form` in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  entities_body_surface_forms_text: ['entities_body_surface_forms_text_example'], # Array<String> | This parameter is used to find stories based on the specified entities `surface_form` in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  not_entities_body_surface_forms_text: ['entities_body_surface_forms_text_example'], # Array<String> | This parameter is used to exclude stories based on the specified entity's `surface_form` in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities). 
  sentiment_title_polarity: 'sentiment_title_polarity_example', # String | This parameter is used for finding stories whose title sentiment is the specified value. 
  not_sentiment_title_polarity: 'sentiment_title_polarity_example', # String | This parameter is used for excluding stories whose title sentiment is the specified value. 
  sentiment_body_polarity: 'sentiment_body_polarity_example', # String | This parameter is used for finding stories whose body sentiment is the specified value. 
  not_sentiment_body_polarity: 'sentiment_body_polarity_example', # String | This parameter is used for excluding stories whose body sentiment is the specified value. 
  media_images_count_min: 56, # Integer | This parameter is used for finding stories whose number of images is greater than or equal to the specified value. 
  media_images_count_max: 56, # Integer | This parameter is used for finding stories whose number of images is less than or equal to the specified value. 
  media_images_width_min: 56, # Integer | This parameter is used for finding stories whose width of images are greater than or equal to the specified value. 
  media_images_width_max: 56, # Integer | This parameter is used for finding stories whose width of images are less than or equal to the specified value. 
  media_images_height_min: 56, # Integer | This parameter is used for finding stories whose height of images are greater than or equal to the specified value. 
  media_images_height_max: 56, # Integer | This parameter is used for finding stories whose height of images are less than or equal to the specified value. 
  media_images_content_length_min: 56, # Integer | This parameter is used for finding stories whose images content length are greater than or equal to the specified value. 
  media_images_content_length_max: 56, # Integer | This parameter is used for finding stories whose images content length are less than or equal to the specified value. 
  media_images_format: ['media_images_format_example'], # Array<String> | This parameter is used for finding stories whose images format are the specified value. 
  not_media_images_format: ['media_images_format_example'], # Array<String> | This parameter is used for excluding stories whose images format are the specified value. 
  media_videos_count_min: 56, # Integer | This parameter is used for finding stories whose number of videos is greater than or equal to the specified value. 
  media_videos_count_max: 56, # Integer | This parameter is used for finding stories whose number of videos is less than or equal to the specified value. 
  author_id: [56], # Array<Integer> | This parameter is used for finding stories whose author id is the specified value. 
  not_author_id: [56], # Array<Integer> | This parameter is used for excluding stories whose author id is the specified value. 
  author_name: 'author_name_example', # String | This parameter is used for finding stories whose author full name contains the specified value. 
  not_author_name: 'author_name_example', # String | This parameter is used for excluding stories whose author full name contains the specified value. 
  source_id: [56], # Array<Integer> | This parameter is used for finding stories whose source id is the specified value. 
  not_source_id: [56], # Array<Integer> | This parameter is used for excluding stories whose source id is the specified value. 
  source_name: ['source_name_example'], # Array<String> | This parameter is used for finding stories whose source name contains the specified value. 
  not_source_name: ['source_name_example'], # Array<String> | This parameter is used for excluding stories whose source name contains the specified value. 
  source_domain: ['source_domain_example'], # Array<String> | This parameter is used for finding stories whose source domain is the specified value. 
  not_source_domain: ['source_domain_example'], # Array<String> | This parameter is used for excluding stories whose source domain is the specified value. 
  source_locations_country: ['source_locations_country_example'], # Array<String> | This parameter is used for finding stories whose source country is the specified value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  not_source_locations_country: ['source_locations_country_example'], # Array<String> | This parameter is used for excluding stories whose source country is the specified value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  source_locations_state: ['source_locations_state_example'], # Array<String> | This parameter is used for finding stories whose source state/province is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  not_source_locations_state: ['source_locations_state_example'], # Array<String> | This parameter is used for excluding stories whose source state/province is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  source_locations_city: ['source_locations_city_example'], # Array<String> | This parameter is used for finding stories whose source city is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  not_source_locations_city: ['source_locations_city_example'], # Array<String> | This parameter is used for excluding stories whose source city is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  source_scopes_country: ['source_scopes_country_example'], # Array<String> | This parameter is used for finding stories whose source scopes is the specified country value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  not_source_scopes_country: ['source_scopes_country_example'], # Array<String> | This parameter is used for excluding stories whose source scopes is the specified country value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  source_scopes_state: ['source_scopes_state_example'], # Array<String> | This parameter is used for finding stories whose source scopes is the specified state/province value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  not_source_scopes_state: ['source_scopes_state_example'], # Array<String> | This parameter is used for excluding stories whose source scopes is the specified state/province value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  source_scopes_city: ['source_scopes_city_example'], # Array<String> | This parameter is used for finding stories whose source scopes is the specified city value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  not_source_scopes_city: ['source_scopes_city_example'], # Array<String> | This parameter is used for excluding stories whose source scopes is the specified city value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  source_scopes_level: ['source_scopes_level_example'], # Array<String> | This parameter is used for finding stories whose source scopes is the specified level value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
  not_source_scopes_level: ['source_scopes_level_example'], # Array<String> | This parameter is used for excluding stories whose source scopes is the specified level value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations). 
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
  aql: 'aql_example', # String | This parameter is used to supply a query in AYLIEN Query Language. 
  aql_default_field: 'text', # String | This parameter is used to supply an optional default field name used in the AQL query. 
  query: 'query_example' # String | This parameter is used to make an advanced query using $and, $or, $not logical operators and $eq for exact match, $text for a text search and $lt, $gt, $lte, $gte for range queries. value must be a json string. 
}

begin
  #List trends
  result = api_instance.list_trends(field, opts)
  p result
rescue AylienNewsApi::ApiError => e
  puts "Exception when calling DefaultApi->list_trends: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **field** | **String**| This parameter is used to specify the trend field.  | 
 **id** | [**Array&lt;Integer&gt;**](Integer.md)| This parameter is used for finding stories by story id.  | [optional] 
 **not_id** | [**Array&lt;Integer&gt;**](Integer.md)| This parameter is used for excluding stories by story id.  | [optional] 
 **title** | **String**| This parameter is used for finding stories whose title contains a specific keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).  | [optional] 
 **body** | **String**| This parameter is used for finding stories whose body contains a specific keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).  | [optional] 
 **text** | **String**| This parameter is used for finding stories whose title or body contains a specific keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).  | [optional] 
 **translations_en_title** | **String**| This parameter is used for finding stories whose translation title contains a specific keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).  | [optional] 
 **translations_en_body** | **String**| This parameter is used for finding stories whose translation body contains a specific keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).  | [optional] 
 **translations_en_text** | **String**| This parameter is used for finding stories whose translation title or body contains a specific keyword. It supports [boolean operators](https://newsapi.aylien.com/docs/boolean-operators).  | [optional] 
 **links_permalink** | [**Array&lt;String&gt;**](String.md)| This parameter is used to find stories based on their url.  | [optional] 
 **not_links_permalink** | [**Array&lt;String&gt;**](String.md)| This parameter is used to exclude stories based on their url.  | [optional] 
 **language** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose language is the specified value. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes.  | [optional] 
 **not_language** | [**Array&lt;String&gt;**](String.md)| This parameter is used for excluding stories whose language is the specified value. It supports [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes.  | [optional] 
 **published_at_start** | **String**| This parameter is used for finding stories whose published at time is greater than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates).  | [optional] 
 **published_at_end** | **String**| This parameter is used for finding stories whose published at time is less than the specified value. [Here](https://newsapi.aylien.com/docs/working-with-dates) you can find more information about how [to work with dates](https://newsapi.aylien.com/docs/working-with-dates).  | [optional] 
 **categories_taxonomy** | **String**| This parameter is used for defining the type of the taxonomy for the rest of the categories queries. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).  | [optional] 
 **categories_confident** | **Boolean**| This parameter is used for finding stories whose categories are confident. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).  | [optional] [default to true]
 **categories_id** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories by categories id. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).  | [optional] 
 **not_categories_id** | [**Array&lt;String&gt;**](String.md)| This parameter is used for excluding stories by categories id. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).  | [optional] 
 **categories_label** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories by categories label. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).  | [optional] 
 **not_categories_label** | [**Array&lt;String&gt;**](String.md)| This parameter is used for excluding stories by categories label. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).  | [optional] 
 **categories_level** | [**Array&lt;Integer&gt;**](Integer.md)| This parameter is used for finding stories by categories level. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).  | [optional] 
 **not_categories_level** | [**Array&lt;Integer&gt;**](Integer.md)| This parameter is used for excluding stories by categories level. You can read more about working with categories [here](https://newsapi.aylien.com/docs/working-with-categories).  | [optional] 
 **entities_id** | [**Array&lt;String&gt;**](String.md)| This parameter is used to find stories based on the specified entities &#x60;id&#x60;. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **not_entities_id** | [**Array&lt;String&gt;**](String.md)| This parameter is used to exclude stories based on the specified entity&#39;s &#x60;id&#x60;. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **entities_links_wikipedia** | [**Array&lt;String&gt;**](String.md)| This parameter is used to find stories based on the specified entities wikipedia URL. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **not_entities_links_wikipedia** | [**Array&lt;String&gt;**](String.md)| This parameter is used to exclude stories based on the specified entity&#39;s Wikipedia URL. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **entities_links_wikidata** | [**Array&lt;String&gt;**](String.md)| This parameter is used to find stories based on the specified entities wikidata URL. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **not_entities_links_wikidata** | [**Array&lt;String&gt;**](String.md)| This parameter is used to exclude stories based on the specified entity&#39;s Wikidata URL. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **entities_types** | [**Array&lt;String&gt;**](String.md)| This parameter is used to find stories based on the specified entities &#x60;types&#x60;. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **not_entities_types** | [**Array&lt;String&gt;**](String.md)| This parameter is used to exclude stories based on the specified entity&#39;s &#x60;types&#x60;. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **entities_stock_tickers** | [**Array&lt;String&gt;**](String.md)| This parameter is used to find stories based on the specified entities &#x60;stock_tickers&#x60;. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **entities_body_stock_tickers** | [**Array&lt;String&gt;**](String.md)| This parameter is used to exclude stories based on the specified entity&#39;s &#x60;stock_tickers&#x60; in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **entities_surface_forms_text** | [**Array&lt;String&gt;**](String.md)| This parameter is used to find stories based on the specified entities &#x60;surface_form&#x60;. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **not_entities_surface_forms_text** | [**Array&lt;String&gt;**](String.md)| This parameter is used to exclude stories based on the specified entity&#39;s &#x60;surface_form&#x60;. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **entities_title_surface_forms_text** | **String**| This parameter is used to find stories based on the specified entities &#x60;surface_form&#x60; in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **not_entities_title_surface_forms_text** | [**Array&lt;String&gt;**](String.md)| This parameter is used to exclude stories based on the specified entity&#39;s &#x60;surface_form&#x60; in story titles. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **entities_body_surface_forms_text** | [**Array&lt;String&gt;**](String.md)| This parameter is used to find stories based on the specified entities &#x60;surface_form&#x60; in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **not_entities_body_surface_forms_text** | [**Array&lt;String&gt;**](String.md)| This parameter is used to exclude stories based on the specified entity&#39;s &#x60;surface_form&#x60; in the body of stories. You can read more about working with entities [here](https://newsapi.aylien.com/docs/working-with-entities).  | [optional] 
 **sentiment_title_polarity** | **String**| This parameter is used for finding stories whose title sentiment is the specified value.  | [optional] 
 **not_sentiment_title_polarity** | **String**| This parameter is used for excluding stories whose title sentiment is the specified value.  | [optional] 
 **sentiment_body_polarity** | **String**| This parameter is used for finding stories whose body sentiment is the specified value.  | [optional] 
 **not_sentiment_body_polarity** | **String**| This parameter is used for excluding stories whose body sentiment is the specified value.  | [optional] 
 **media_images_count_min** | **Integer**| This parameter is used for finding stories whose number of images is greater than or equal to the specified value.  | [optional] 
 **media_images_count_max** | **Integer**| This parameter is used for finding stories whose number of images is less than or equal to the specified value.  | [optional] 
 **media_images_width_min** | **Integer**| This parameter is used for finding stories whose width of images are greater than or equal to the specified value.  | [optional] 
 **media_images_width_max** | **Integer**| This parameter is used for finding stories whose width of images are less than or equal to the specified value.  | [optional] 
 **media_images_height_min** | **Integer**| This parameter is used for finding stories whose height of images are greater than or equal to the specified value.  | [optional] 
 **media_images_height_max** | **Integer**| This parameter is used for finding stories whose height of images are less than or equal to the specified value.  | [optional] 
 **media_images_content_length_min** | **Integer**| This parameter is used for finding stories whose images content length are greater than or equal to the specified value.  | [optional] 
 **media_images_content_length_max** | **Integer**| This parameter is used for finding stories whose images content length are less than or equal to the specified value.  | [optional] 
 **media_images_format** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose images format are the specified value.  | [optional] 
 **not_media_images_format** | [**Array&lt;String&gt;**](String.md)| This parameter is used for excluding stories whose images format are the specified value.  | [optional] 
 **media_videos_count_min** | **Integer**| This parameter is used for finding stories whose number of videos is greater than or equal to the specified value.  | [optional] 
 **media_videos_count_max** | **Integer**| This parameter is used for finding stories whose number of videos is less than or equal to the specified value.  | [optional] 
 **author_id** | [**Array&lt;Integer&gt;**](Integer.md)| This parameter is used for finding stories whose author id is the specified value.  | [optional] 
 **not_author_id** | [**Array&lt;Integer&gt;**](Integer.md)| This parameter is used for excluding stories whose author id is the specified value.  | [optional] 
 **author_name** | **String**| This parameter is used for finding stories whose author full name contains the specified value.  | [optional] 
 **not_author_name** | **String**| This parameter is used for excluding stories whose author full name contains the specified value.  | [optional] 
 **source_id** | [**Array&lt;Integer&gt;**](Integer.md)| This parameter is used for finding stories whose source id is the specified value.  | [optional] 
 **not_source_id** | [**Array&lt;Integer&gt;**](Integer.md)| This parameter is used for excluding stories whose source id is the specified value.  | [optional] 
 **source_name** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source name contains the specified value.  | [optional] 
 **not_source_name** | [**Array&lt;String&gt;**](String.md)| This parameter is used for excluding stories whose source name contains the specified value.  | [optional] 
 **source_domain** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source domain is the specified value.  | [optional] 
 **not_source_domain** | [**Array&lt;String&gt;**](String.md)| This parameter is used for excluding stories whose source domain is the specified value.  | [optional] 
 **source_locations_country** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source country is the specified value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **not_source_locations_country** | [**Array&lt;String&gt;**](String.md)| This parameter is used for excluding stories whose source country is the specified value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **source_locations_state** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source state/province is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **not_source_locations_state** | [**Array&lt;String&gt;**](String.md)| This parameter is used for excluding stories whose source state/province is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **source_locations_city** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source city is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **not_source_locations_city** | [**Array&lt;String&gt;**](String.md)| This parameter is used for excluding stories whose source city is the specified value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **source_scopes_country** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source scopes is the specified country value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **not_source_scopes_country** | [**Array&lt;String&gt;**](String.md)| This parameter is used for excluding stories whose source scopes is the specified country value. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **source_scopes_state** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source scopes is the specified state/province value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **not_source_scopes_state** | [**Array&lt;String&gt;**](String.md)| This parameter is used for excluding stories whose source scopes is the specified state/province value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **source_scopes_city** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source scopes is the specified city value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **not_source_scopes_city** | [**Array&lt;String&gt;**](String.md)| This parameter is used for excluding stories whose source scopes is the specified city value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **source_scopes_level** | [**Array&lt;String&gt;**](String.md)| This parameter is used for finding stories whose source scopes is the specified level value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
 **not_source_scopes_level** | [**Array&lt;String&gt;**](String.md)| This parameter is used for excluding stories whose source scopes is the specified level value. [Here](https://newsapi.aylien.com/docs/working-with-locations) you can find more information about how [to work with locations](https://newsapi.aylien.com/docs/working-with-locations).  | [optional] 
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
 **aql** | **String**| This parameter is used to supply a query in AYLIEN Query Language.  | [optional] 
 **aql_default_field** | **String**| This parameter is used to supply an optional default field name used in the AQL query.  | [optional] [default to &#39;text&#39;]
 **query** | **String**| This parameter is used to make an advanced query using $and, $or, $not logical operators and $eq for exact match, $text for a text search and $lt, $gt, $lte, $gte for range queries. value must be a json string.  | [optional] 

### Return type

[**Trends**](Trends.md)

### Authorization

[app_id](../README.md#app_id), [app_key](../README.md#app_key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json, text/xml

