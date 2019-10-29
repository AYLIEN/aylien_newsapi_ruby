# AylienNewsApi::Entity

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**indices** | **Array&lt;Array&lt;Integer&gt;&gt;** | The indices of the entity text | [optional] 
**links** | [**EntityLinks**](EntityLinks.md) |  | [optional] 
**score** | **Float** | The entity score | [optional] 
**text** | **String** | The entity text | [optional] 
**types** | **Array&lt;String&gt;** | An array of the dbpedia types | [optional] 

## Code Sample

```ruby
require 'AylienNewsApi'

instance = AylienNewsApi::Entity.new(indices: null,
                                 links: null,
                                 score: null,
                                 text: null,
                                 types: null)
```


