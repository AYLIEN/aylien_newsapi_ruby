# AylienNewsApi::Source

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**description** | **String** | A general explanation about the source | [optional] 
**domain** | **String** | The domain name of the source which is extracted from the source URL | [optional] 
**home_page_url** | **String** | The home page URL of the source | [optional] 
**id** | **Integer** | The source id which is a unique value | [optional] 
**links_in_count** | **Integer** | The number of websites that link to the source | [optional] 
**locations** | [**Array&lt;Location&gt;**](Location.md) | The source locations which are tend to be the physical locations of the source, e.g. BBC headquarter is located in London.  | [optional] 
**logo_url** | **String** | A URL which points to the source logo | [optional] 
**name** | **String** | The source name | [optional] 
**rankings** | [**Rankings**](Rankings.md) |  | [optional] 
**scopes** | [**Array&lt;Scope&gt;**](Scope.md) | The source scopes which is tend to be scope locations of the source, e.g. BBC scopes is international.  | [optional] 
**title** | **String** | The title of the home page URL | [optional] 

## Code Sample

```ruby
require 'AylienNewsApi'

instance = AylienNewsApi::Source.new(description: null,
                                 domain: null,
                                 home_page_url: null,
                                 id: null,
                                 links_in_count: null,
                                 locations: null,
                                 logo_url: null,
                                 name: null,
                                 rankings: null,
                                 scopes: null,
                                 title: null)
```


