# AylienNewsApi::Media

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**content_length** | **Integer** | The content length of media | [optional] 
**format** | [**MediaFormat**](MediaFormat.md) |  | [optional] 
**height** | **Integer** | The height of media | [optional] 
**type** | [**MediaType**](MediaType.md) |  | [optional] 
**url** | **String** | A URL which points to the media file | [optional] 
**width** | **Integer** | The width of media | [optional] 

## Code Sample

```ruby
require 'AylienNewsApi'

instance = AylienNewsApi::Media.new(content_length: null,
                                 format: null,
                                 height: null,
                                 type: null,
                                 url: null,
                                 width: null)
```


