# AylienNewsApi::Histograms

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**field** | **String** |  | [optional] 
**interval_end** | **Integer** | The end interval of the histogram | [optional] 
**interval_start** | **Integer** | The start interval of the histogram | [optional] 
**interval_width** | **Integer** | The width of the histogram | [optional] 
**intervals** | [**Array&lt;HistogramInterval&gt;**](HistogramInterval.md) | The intervals of the histograms | [optional] 
**published_at_end** | **DateTime** | The end of a period in which searched stories were published | [optional] 
**published_at_start** | **DateTime** | The start of a period in which searched stories were published | [optional] 

## Code Sample

```ruby
require 'AylienNewsApi'

instance = AylienNewsApi::Histograms.new(field: null,
                                 interval_end: null,
                                 interval_start: null,
                                 interval_width: null,
                                 intervals: null,
                                 published_at_end: null,
                                 published_at_start: null)
```


