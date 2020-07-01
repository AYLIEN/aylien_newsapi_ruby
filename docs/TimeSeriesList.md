# AylienNewsApi::TimeSeriesList

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**period** | **String** | The size of each date range expressed as an interval to be added to the lower bound.  | [optional] 
**published_at_end** | **DateTime** | The end published date of the time series | [optional] 
**published_at_start** | **DateTime** | The start published date of the time series | [optional] 
**time_series** | [**Array&lt;TimeSeries&gt;**](TimeSeries.md) | An array of time series | [optional] 

## Code Sample

```ruby
require 'AylienNewsApi'

instance = AylienNewsApi::TimeSeriesList.new(period: null,
                                 published_at_end: null,
                                 published_at_start: null,
                                 time_series: null)
```


