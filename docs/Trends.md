# AylienNewsApi::Trends

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**field** | **String** | The field of trends | [optional] 
**trends** | [**Array&lt;Trend&gt;**](Trend.md) | An array of trends | [optional] 
**published_at_end** | **DateTime** | The end of a period in which searched stories were published | [optional] 
**published_at_start** | **DateTime** | The start of a period in which searched stories were published | [optional] 

## Code Sample

```ruby
require 'AylienNewsApi'

instance = AylienNewsApi::Trends.new(field: null,
                                 trends: null,
                                 published_at_end: null,
                                 published_at_start: null)
```


