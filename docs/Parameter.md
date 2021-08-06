# AylienNewsApi::Parameter

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**author_id** | [**Query**](Query.md) |  | [optional] 
**author_name** | [**Query**](Query.md) |  | [optional] 
**body** | [**Query**](Query.md) |  | [optional] 
**categories_confident** | [**Query**](Query.md) |  | [optional] 
**categories_id** | [**Query**](Query.md) |  | [optional] 
**categories_level** | [**Query**](Query.md) |  | [optional] 
**categories_taxonomy** | [**Query**](Query.md) |  | [optional] 
**clusters** | [**Query**](Query.md) |  | [optional] 
**links_permalink** | [**Query**](Query.md) |  | [optional] 
**entities_id** | [**Query**](Query.md) |  | [optional] 
**entities_surface_forms_text** | [**Query**](Query.md) |  | [optional] 
**entities_links_wikipedia** | [**Query**](Query.md) |  | [optional] 
**entities_links_wikidata** | [**Query**](Query.md) |  | [optional] 
**entities_title_surface_forms_text** | [**Query**](Query.md) |  | [optional] 
**entities_body_surface_forms_text** | [**Query**](Query.md) |  | [optional] 
**id** | [**Query**](Query.md) |  | [optional] 
**language** | [**Query**](Query.md) |  | [optional] 
**media_images_content_length_max** | [**Query**](Query.md) |  | [optional] 
**media_images_content_length_min** | [**Query**](Query.md) |  | [optional] 
**media_images_count_max** | [**Query**](Query.md) |  | [optional] 
**media_images_count_min** | [**Query**](Query.md) |  | [optional] 
**media_images_format** | [**Query**](Query.md) |  | [optional] 
**media_images_height_max** | [**Query**](Query.md) |  | [optional] 
**media_images_height_min** | [**Query**](Query.md) |  | [optional] 
**media_images_width_max** | [**Query**](Query.md) |  | [optional] 
**media_images_width_min** | [**Query**](Query.md) |  | [optional] 
**media_videos_count_max** | [**Query**](Query.md) |  | [optional] 
**media_videos_count_min** | [**Query**](Query.md) |  | [optional] 
**sentiment_body_polarity** | [**Query**](Query.md) |  | [optional] 
**sentiment_title_polarity** | [**Query**](Query.md) |  | [optional] 
**social_shares_count_facebook_max** | [**Query**](Query.md) |  | [optional] 
**social_shares_count_facebook_min** | [**Query**](Query.md) |  | [optional] 
**social_shares_count_reddit_max** | [**Query**](Query.md) |  | [optional] 
**social_shares_count_reddit_min** | [**Query**](Query.md) |  | [optional] 
**source_domain** | [**Query**](Query.md) |  | [optional] 
**source_id** | [**Query**](Query.md) |  | [optional] 
**source_links_in_count_max** | [**Query**](Query.md) |  | [optional] 
**source_links_in_count_min** | [**Query**](Query.md) |  | [optional] 
**source_locations_city** | [**Query**](Query.md) |  | [optional] 
**source_locations_country** | [**Query**](Query.md) |  | [optional] 
**source_locations_state** | [**Query**](Query.md) |  | [optional] 
**source_rankings_alexa_country** | [**Query**](Query.md) |  | [optional] 
**source_rankings_alexa_rank_max** | [**Query**](Query.md) |  | [optional] 
**source_rankings_alexa_rank_min** | [**Query**](Query.md) |  | [optional] 
**source_scopes_city** | [**Query**](Query.md) |  | [optional] 
**source_scopes_country** | [**Query**](Query.md) |  | [optional] 
**source_scopes_level** | [**Query**](Query.md) |  | [optional] 
**source_scopes_state** | [**Query**](Query.md) |  | [optional] 
**story_url** | [**Query**](Query.md) |  | [optional] 
**story_language** | [**Query**](Query.md) |  | [optional] 
**text** | [**Query**](Query.md) |  | [optional] 
**title** | [**Query**](Query.md) |  | [optional] 
**translations_en_body** | [**Query**](Query.md) |  | [optional] 
**translations_en_text** | [**Query**](Query.md) |  | [optional] 
**translations_en_title** | [**Query**](Query.md) |  | [optional] 
**entity** | [**OneOfNestedEntityLogicals**](OneOfNestedEntityLogicals.md) |  | [optional] 

## Code Sample

```ruby
require 'AylienNewsApi'

instance = AylienNewsApi::Parameter.new(author_id: null,
                                 author_name: null,
                                 body: null,
                                 categories_confident: null,
                                 categories_id: null,
                                 categories_level: null,
                                 categories_taxonomy: null,
                                 clusters: null,
                                 links_permalink: null,
                                 entities_id: null,
                                 entities_surface_forms_text: null,
                                 entities_links_wikipedia: null,
                                 entities_links_wikidata: null,
                                 entities_title_surface_forms_text: null,
                                 entities_body_surface_forms_text: null,
                                 id: null,
                                 language: null,
                                 media_images_content_length_max: null,
                                 media_images_content_length_min: null,
                                 media_images_count_max: null,
                                 media_images_count_min: null,
                                 media_images_format: null,
                                 media_images_height_max: null,
                                 media_images_height_min: null,
                                 media_images_width_max: null,
                                 media_images_width_min: null,
                                 media_videos_count_max: null,
                                 media_videos_count_min: null,
                                 sentiment_body_polarity: null,
                                 sentiment_title_polarity: null,
                                 social_shares_count_facebook_max: null,
                                 social_shares_count_facebook_min: null,
                                 social_shares_count_reddit_max: null,
                                 social_shares_count_reddit_min: null,
                                 source_domain: null,
                                 source_id: null,
                                 source_links_in_count_max: null,
                                 source_links_in_count_min: null,
                                 source_locations_city: null,
                                 source_locations_country: null,
                                 source_locations_state: null,
                                 source_rankings_alexa_country: null,
                                 source_rankings_alexa_rank_max: null,
                                 source_rankings_alexa_rank_min: null,
                                 source_scopes_city: null,
                                 source_scopes_country: null,
                                 source_scopes_level: null,
                                 source_scopes_state: null,
                                 story_url: null,
                                 story_language: null,
                                 text: null,
                                 title: null,
                                 translations_en_body: null,
                                 translations_en_text: null,
                                 translations_en_title: null,
                                 entity: null)
```


