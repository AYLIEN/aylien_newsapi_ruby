# AylienNewsApi::DeprecatedRelatedStories

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**related_stories** | [**Array&lt;DeprecatedStory&gt;**](DeprecatedStory.md) | An array of related stories for the input story | [optional] 
**story_body** | **String** | The input story body | [optional] 
**story_language** | **String** | The input story language | [optional] 
**story_title** | **String** | The input story title | [optional] 
**published_at_end** | **DateTime** | The end of a period in which searched stories were published | [optional] 
**published_at_start** | **DateTime** | The start of a period in which searched stories were published | [optional] 

## Code Sample

```ruby
require 'AylienNewsApi'

instance = AylienNewsApi::DeprecatedRelatedStories.new(related_stories: null,
                                 story_body: null,
                                 story_language: null,
                                 story_title: null,
                                 published_at_end: null,
                                 published_at_start: null)
```


