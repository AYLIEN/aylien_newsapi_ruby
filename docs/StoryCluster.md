# AylienNewsApi::StoryCluster

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **Integer** | A unique identification for the cluster | [optional] 
**phrases** | **Array&lt;String&gt;** | Suggested labels for the cluster | [optional] 
**score** | **Float** | The cluster score | [optional] 
**size** | **Integer** | Size of the cluster | [optional] 
**stories** | **Array&lt;Integer&gt;** | Story ids which are in the cluster | [optional] 

## Code Sample

```ruby
require 'AylienNewsApi'

instance = AylienNewsApi::StoryCluster.new(id: null,
                                 phrases: null,
                                 score: null,
                                 size: null,
                                 stories: null)
```


