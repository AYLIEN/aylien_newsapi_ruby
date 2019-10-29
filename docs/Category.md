# AylienNewsApi::Category

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**confident** | **Boolean** | It defines whether the extracted category is confident or not | [optional] 
**id** | **String** | The ID of the category | [optional] 
**level** | **Integer** | The level of the category | [optional] 
**links** | [**CategoryLinks**](CategoryLinks.md) |  | [optional] 
**score** | **Float** | The score of the category | [optional] 
**taxonomy** | **String** | The taxonomy of the category | [optional] 

## Code Sample

```ruby
require 'AylienNewsApi'

instance = AylienNewsApi::Category.new(confident: null,
                                 id: null,
                                 level: null,
                                 links: null,
                                 score: null,
                                 taxonomy: null)
```


