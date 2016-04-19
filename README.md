# AYLIEN News API

The Ruby gem for the AYLIEN News API

AYLIEN News API is the most powerful way of sourcing, searching and syndicating analyzed and enriched news content. If you haven't already done so, you will need to [sign up](https://newsapi.aylien.com/signup).

## Installation

### RubyGems

Add this to the Gemfile:

    gem 'aylien_news_api', '~> 0.0.1'

or install it directly:

	gem install aylien_news_api

### Install from Git

If the Ruby gem is hosted at a git repository: https://github.com/AYLIEN/aylien_newsapi_ruby, then add the following in the Gemfile:

    gem 'aylien_news_api', :git => 'https://github.com/AYLIEN/aylien_newsapi_ruby.git'


## Getting Started

Please follow the [installation](#installation) procedure and then run the following code:
```ruby
# Load the gem
require 'aylien_news_api'

# Setup authorization
AylienNewsApi.configure do |config|
  # Configure API key authorization: app_id
  config.api_key['X-AYLIEN-NewsAPI-Application-ID'] = 'YOUR APP ID'
  
  # Configure API key authorization: app_key
  config.api_key['X-AYLIEN-NewsAPI-Application-Key'] = 'YOUR APP KEY'
end

api_instance = AylienNewsApi::DefaultApi.new

opts = {
  :title => 'trump',
  :published_at_start => "NOW-7DAYS",
  :published_at_end => "NOW",
  :entities_body_links_dbpedia => [
    'http://dbpedia.org/resource/Donald_Trump',
    'http://dbpedia.org/resource/Hillary_Rodham_Clinton'
  ],
  :language => ['en'],
  :sort_by => 'social_shares_count.facebook'
}


begin
  #List stories
  result = api_instance.list_stories(opts)
  puts result
rescue AylienNewsApi::ApiError => e
  puts "Exception when calling DefaultApi->list_stories: #{e}"
end

```

## Documentation for API Endpoints

All URIs are relative to *https://api.newsapi.aylien.com/api/v1*

Class | Method | HTTP request | Description
------------ | ------------- | ------------- | -------------
*AylienNewsApi::DefaultApi* | [**list_autocompletes**](docs/DefaultApi.md#list_autocompletes) | **GET** /autocompletes | List autocompletes
*AylienNewsApi::DefaultApi* | [**list_coverages**](docs/DefaultApi.md#list_coverages) | **POST** /coverages | List coverages
*AylienNewsApi::DefaultApi* | [**list_histograms**](docs/DefaultApi.md#list_histograms) | **GET** /histograms | List histograms
*AylienNewsApi::DefaultApi* | [**list_related_stories**](docs/DefaultApi.md#list_related_stories) | **POST** /related_stories | List related stories
*AylienNewsApi::DefaultApi* | [**list_stories**](docs/DefaultApi.md#list_stories) | **GET** /stories | List Stories
*AylienNewsApi::DefaultApi* | [**list_time_series**](docs/DefaultApi.md#list_time_series) | **GET** /time_series | List time series
*AylienNewsApi::DefaultApi* | [**list_trends**](docs/DefaultApi.md#list_trends) | **GET** /trends | List trends


## Documentation for Models

 - [AylienNewsApi::Author](docs/Author.md)
 - [AylienNewsApi::Autocomplete](docs/Autocomplete.md)
 - [AylienNewsApi::Autocompletes](docs/Autocompletes.md)
 - [AylienNewsApi::Category](docs/Category.md)
 - [AylienNewsApi::CategoryLinks](docs/CategoryLinks.md)
 - [AylienNewsApi::Coverages](docs/Coverages.md)
 - [AylienNewsApi::Entities](docs/Entities.md)
 - [AylienNewsApi::Entity](docs/Entity.md)
 - [AylienNewsApi::EntityLinks](docs/EntityLinks.md)
 - [AylienNewsApi::Error](docs/Error.md)
 - [AylienNewsApi::ErrorLinks](docs/ErrorLinks.md)
 - [AylienNewsApi::Errors](docs/Errors.md)
 - [AylienNewsApi::HistogramInterval](docs/HistogramInterval.md)
 - [AylienNewsApi::Histograms](docs/Histograms.md)
 - [AylienNewsApi::Location](docs/Location.md)
 - [AylienNewsApi::Media](docs/Media.md)
 - [AylienNewsApi::RelatedStories](docs/RelatedStories.md)
 - [AylienNewsApi::Scope](docs/Scope.md)
 - [AylienNewsApi::Sentiment](docs/Sentiment.md)
 - [AylienNewsApi::Sentiments](docs/Sentiments.md)
 - [AylienNewsApi::ShareCount](docs/ShareCount.md)
 - [AylienNewsApi::ShareCounts](docs/ShareCounts.md)
 - [AylienNewsApi::Source](docs/Source.md)
 - [AylienNewsApi::Stories](docs/Stories.md)
 - [AylienNewsApi::Story](docs/Story.md)
 - [AylienNewsApi::StoryCluster](docs/StoryCluster.md)
 - [AylienNewsApi::StoryLinks](docs/StoryLinks.md)
 - [AylienNewsApi::Summary](docs/Summary.md)
 - [AylienNewsApi::TimeSeries](docs/TimeSeries.md)
 - [AylienNewsApi::TimeSeriesList](docs/TimeSeriesList.md)
 - [AylienNewsApi::Trend](docs/Trend.md)
 - [AylienNewsApi::Trends](docs/Trends.md)


## Documentation for Authorization


### app_key

- **Type**: API key
- **API key parameter name**: X-AYLIEN-NewsAPI-Application-Key
- **Location**: HTTP header

### app_id

- **Type**: API key
- **API key parameter name**: X-AYLIEN-NewsAPI-Application-ID
- **Location**: HTTP header

