# AylienNewsApi::AutocompleteApi

All URIs are relative to *https://api.aylien.com/news*

Method | HTTP request | Description
------------- | ------------- | -------------
[**list_autocompletes**](AutocompleteApi.md#list_autocompletes) | **GET** /autocompletes | List autocompletes



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

api_instance = AylienNewsApi::AutocompleteApi.new
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
  puts "Exception when calling AutocompleteApi->list_autocompletes: #{e}"
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

