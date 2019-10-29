# AylienNewsApi::RelatedStories

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**related_stories** | [**Array&lt;Story&gt;**](Story.md) | An array of related stories for the input story | [optional] 
**story_body** | **String** | The input story body | [optional] 
**story_language** | **String** | The input story language | [optional] 
**story_title** | **String** | The input story title | [optional] 

## Code Sample

```ruby
require 'AylienNewsApi'

instance = AylienNewsApi::RelatedStories.new(related_stories: null,
                                 story_body: null,
                                 story_language: null,
                                 story_title: null)
```


