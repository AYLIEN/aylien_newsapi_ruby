# AylienNewsApi::Story

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **Integer** | ID of the story which is unique identification | [optional] 
**title** | **String** | Title of the story | [optional] 
**body** | **String** | Body of the story | [optional] 
**summary** | [**Summary**](Summary.md) | The suggested story summary | [optional] 
**source** | [**Source**](Source.md) | The story source | [optional] 
**author** | [**Author**](Author.md) | The story author | [optional] 
**entities** | [**Entities**](Entities.md) | Extracted entities from the story title or body | [optional] 
**keywords** | **Array&lt;String&gt;** | Extracted keywords mentioned in the story title or body | [optional] 
**hashtags** | **Array&lt;String&gt;** | An array of suggested Story hashtags | [optional] 
**characters_count** | **Integer** | Characters count of the story body | [optional] 
**words_count** | **Integer** | Words count of the story body | [optional] 
**sentences_count** | **Integer** | Sentences count of the story body | [optional] 
**paragraphs_count** | **Integer** | Paragraphs count of the story body | [optional] 
**categories** | [**Array&lt;Category&gt;**](Category.md) | Suggested categories for the story | [optional] 
**social_shares_count** | [**ShareCounts**](ShareCounts.md) | Social shares count for the story | [optional] 
**media** | [**Array&lt;Media&gt;**](Media.md) | An array of extracted media such as images and videos | [optional] 
**sentiment** | [**Sentiments**](Sentiments.md) | Suggested sentiments for the story title or body | [optional] 
**language** | **String** | Language of the story | [optional] 
**published_at** | **DateTime** | Published date of the story | [optional] 
**links** | [**StoryLinks**](StoryLinks.md) | Links which is related to the story | [optional] 


