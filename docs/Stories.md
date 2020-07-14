# AylienNewsApi::Stories

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**next_page_cursor** | **String** | The next page cursor | [optional] 
**stories** | [**Array&lt;Story&gt;**](Story.md) | An array of stories | [optional] 
**published_at_end** | **DateTime** | The end of a period in which searched stories were published | [optional] 
**published_at_start** | **DateTime** | The start of a period in which searched stories were published | [optional] 
**warnings** | [**Array&lt;Warning&gt;**](Warning.md) | Notifies about possible issues that occurred when searching for stories | [optional] 

## Code Sample

```ruby
require 'AylienNewsApi'

instance = AylienNewsApi::Stories.new(next_page_cursor: null,
                                 stories: null,
                                 published_at_end: null,
                                 published_at_start: null,
                                 warnings: null)
```


