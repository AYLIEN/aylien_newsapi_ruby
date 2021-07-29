# AylienNewsApi::EntitySurfaceForm

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**text** | **String** | The entity text | [optional] 
**frequency** | **Integer** | Amount of entity surface form mentions in the article | [optional] 
**mentions** | [**Array&lt;EntityMention&gt;**](EntityMention.md) | Mentions of the entity text | [optional] 

## Code Sample

```ruby
require 'AylienNewsApi'

instance = AylienNewsApi::EntitySurfaceForm.new(text: null,
                                 frequency: null,
                                 mentions: null)
```


