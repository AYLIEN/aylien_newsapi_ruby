# AylienNewsApi::ShareCounts

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**facebook** | [**Array&lt;ShareCount&gt;**](ShareCount.md) | Facebook shares count | [optional] 
**google_plus** | [**Array&lt;ShareCount&gt;**](ShareCount.md) | Google Plus shares count | [optional] 
**linkedin** | [**Array&lt;ShareCount&gt;**](ShareCount.md) | LinkedIn shares count | [optional] 
**reddit** | [**Array&lt;ShareCount&gt;**](ShareCount.md) | Reddit shares count | [optional] 

## Code Sample

```ruby
require 'AylienNewsApi'

instance = AylienNewsApi::ShareCounts.new(facebook: null,
                                 google_plus: null,
                                 linkedin: null,
                                 reddit: null)
```


