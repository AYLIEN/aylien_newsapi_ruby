# AylienNewsApi::Scope

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**city** | **String** | The scope by city | [optional] 
**country** | **String** | The source scope by country code. It supports [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country codes.  | [optional] 
**level** | **String** | The scope by level | [optional] 
**state** | **String** | The scope by state | [optional] 

## Code Sample

```ruby
require 'AylienNewsApi'

instance = AylienNewsApi::Scope.new(city: null,
                                 country: null,
                                 level: null,
                                 state: null)
```


