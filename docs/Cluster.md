# AylienNewsApi::Cluster

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**earliest_story** | **DateTime** | Publication date of the earliest story in cluster | [optional] 
**id** | **Integer** | ID of the cluster which is a unique identification | [optional] 
**latest_story** | **DateTime** | Publication date of the latest story in cluster | [optional] 
**location** | [**Location**](Location.md) |  | [optional] 
**representative_story** | [**RepresentativeStory**](RepresentativeStory.md) |  | [optional] 
**story_count** | **Integer** | Number of stories associated with the cluster | [optional] 
**time** | **DateTime** | Time of the event | [optional] 

## Code Sample

```ruby
require 'AylienNewsApi'

instance = AylienNewsApi::Cluster.new(earliest_story: null,
                                 id: null,
                                 latest_story: null,
                                 location: null,
                                 representative_story: null,
                                 story_count: null,
                                 time: null)
```


