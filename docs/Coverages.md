# AylienNewsApi::Coverages

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**coverages** | [**Array&lt;Story&gt;**](Story.md) | An array of coverages for the input story | [optional] 
**story_body** | **String** | The input story body | [optional] 
**story_language** | **String** | The input story language | [optional] 
**story_published_at** | **DateTime** | The input story published date | [optional] 
**story_title** | **String** | The input story title | [optional] 

## Code Sample

```ruby
require 'AylienNewsApi'

instance = AylienNewsApi::Coverages.new(coverages: null,
                                 story_body: null,
                                 story_language: null,
                                 story_published_at: null,
                                 story_title: null)
```


