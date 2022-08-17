# AylienNewsApi::Entity

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** | The unique ID of the entity | [optional] 
**links** | [**EntityLinks**](EntityLinks.md) |  | [optional] 
**stock_tickers** | **Array&lt;String&gt;** | The stock tickers of the entity (might be empty) | [optional] 
**types** | **Array&lt;String&gt;** | An array of the entity types | [optional] 
**overall_sentiment** | [**EntitySentiment**](EntitySentiment.md) |  | [optional] 
**overall_prominence** | **Float** | Describes how relevant an entity is to the article | [optional] 
**overall_frequency** | **Integer** | Amount of entity surface form mentions in the article | [optional] 
**body** | [**EntityInText**](EntityInText.md) |  | [optional] 
**title** | [**EntityInText**](EntityInText.md) |  | [optional] 

## Code Sample

```ruby
require 'AylienNewsApi'

instance = AylienNewsApi::Entity.new(id: null,
                                 links: null,
                                 stock_tickers: null,
                                 types: null,
                                 overall_sentiment: null,
                                 overall_prominence: null,
                                 overall_frequency: null,
                                 body: null,
                                 title: null)
```


