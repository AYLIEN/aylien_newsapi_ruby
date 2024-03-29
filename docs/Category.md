# AylienNewsApi::Category

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**confident** | **Boolean** | It defines whether the extracted category is confident or not | [optional] 
**id** | **String** | The ID of the category | [optional] 
**label** | **String** | The label of the category | [optional] 
**level** | **Integer** | The level of the category | [optional] 
**score** | **Float** | The score of the category | [optional] 
**taxonomy** | [**CategoryTaxonomy**](CategoryTaxonomy.md) |  | [optional] 
**links** | [**CategoryLinks**](CategoryLinks.md) |  | [optional] 

## Code Sample

```ruby
require 'AylienNewsApi'

instance = AylienNewsApi::Category.new(confident: null,
                                 id: null,
                                 label: null,
                                 level: null,
                                 score: null,
                                 taxonomy: null,
                                 links: null)
```


