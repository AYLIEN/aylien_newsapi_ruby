# AylienNewsApi::Entity

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** | The unique ID of the entity | [optional] 
**indices** | **Array&lt;Array&lt;Integer&gt;&gt;** | The indices of the entity text | [optional] 
**links** | [**EntityLinks**](EntityLinks.md) |  | [optional] 
**text** | **String** | The entity text | [optional] 
**stock_ticker** | **String** | The stock_ticker of the entity (might be null) | [optional] 
**types** | **Array&lt;String&gt;** | An array of the entity types | [optional] 
**sentiment** | [**EntitySentiment**](EntitySentiment.md) |  | [optional] 
**surface_forms** | [**Array&lt;EntitySurfaceForm&gt;**](EntitySurfaceForm.md) |  | [optional] 
**prominence_score** | **Float** | Describes how relevant an entity is to the article | [optional] 

## Code Sample

```ruby
require 'AylienNewsApi'

instance = AylienNewsApi::Entity.new(id: null,
                                 indices: null,
                                 links: null,
                                 text: null,
                                 stock_ticker: null,
                                 types: null,
                                 sentiment: null,
                                 surface_forms: null,
                                 prominence_score: null)
```


