# AylienNewsApi::Warning

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** | The identfier of the warning, represents its origin. | [optional] 
**links** | [**ErrorLinks**](ErrorLinks.md) |  | [optional] 
**detail** | **String** | The detailed description of the warning. | [optional] 

## Code Sample

```ruby
require 'AylienNewsApi'

instance = AylienNewsApi::Warning.new(id: null,
                                 links: null,
                                 detail: null)
```


