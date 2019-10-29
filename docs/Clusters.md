# AylienNewsApi::Clusters

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**cluster_count** | **Integer** | The total number of clusters | [optional] 
**clusters** | [**Array&lt;Cluster&gt;**](Cluster.md) | An array of clusters | [optional] 
**next_page_cursor** | **String** | The next page cursor | [optional] 

## Code Sample

```ruby
require 'AylienNewsApi'

instance = AylienNewsApi::Clusters.new(cluster_count: null,
                                 clusters: null,
                                 next_page_cursor: null)
```


