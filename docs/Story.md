# AylienNewsApi::Story

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**author** | [**Author**](Author.md) |  | [optional] 
**body** | **String** | Body of the story | [optional] 
**categories** | [**Array&lt;Category&gt;**](Category.md) | Suggested categories for the story | [optional] 
**characters_count** | **Integer** | Character count of the story body | [optional] 
**clusters** | **Array&lt;Integer&gt;** | An array of clusters the story is associated with | [optional] 
**entities** | [**Entities**](Entities.md) |  | [optional] 
**hashtags** | **Array&lt;String&gt;** | An array of suggested Story hashtags | [optional] 
**id** | **Integer** | ID of the story which is a unique identification | [optional] 
**keywords** | **Array&lt;String&gt;** | Extracted keywords mentioned in the story title or body | [optional] 
**language** | **String** | Language of the story | [optional] 
**links** | [**StoryLinks**](StoryLinks.md) |  | [optional] 
**media** | [**Array&lt;Media&gt;**](Media.md) | An array of extracted media such as images and videos | [optional] 
**paragraphs_count** | **Integer** | Paragraph count of the story body | [optional] 
**published_at** | **DateTime** | Published date of the story | [optional] 
**sentences_count** | **Integer** | Sentence count of the story body | [optional] 
**sentiment** | [**Sentiments**](Sentiments.md) |  | [optional] 
**social_shares_count** | [**ShareCounts**](ShareCounts.md) |  | [optional] 
**source** | [**Source**](Source.md) |  | [optional] 
**summary** | [**Summary**](Summary.md) |  | [optional] 
**title** | **String** | Title of the story | [optional] 
**translations** | [**StoryTranslations**](StoryTranslations.md) |  | [optional] 
**words_count** | **Integer** | Word count of the story body | [optional] 

## Code Sample

```ruby
require 'AylienNewsApi'

instance = AylienNewsApi::Story.new(author: null,
                                 body: null,
                                 categories: null,
                                 characters_count: null,
                                 clusters: null,
                                 entities: null,
                                 hashtags: null,
                                 id: null,
                                 keywords: null,
                                 language: null,
                                 links: null,
                                 media: null,
                                 paragraphs_count: null,
                                 published_at: null,
                                 sentences_count: null,
                                 sentiment: null,
                                 social_shares_count: null,
                                 source: null,
                                 summary: null,
                                 title: null,
                                 translations: null,
                                 words_count: null)
```


