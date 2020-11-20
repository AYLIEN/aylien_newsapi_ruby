# AylienNewsApi::Query

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**eq** | [**OneOfstringnumber**](OneOfstringnumber.md) |  | [optional] 
**text** | [**OneOfstringnumber**](OneOfstringnumber.md) |  | [optional] 
**_in** | [**Array&lt;OneOfstringnumber&gt;**](OneOfstringnumber.md) |  | [optional] 
**gt** | **Float** |  | [optional] 
**gte** | **Float** |  | [optional] 
**lt** | **Float** |  | [optional] 
**lte** | **Float** |  | [optional] 
**boost** | **Float** |  | [optional] 

## Code Sample

```ruby
require 'AylienNewsApi'

instance = AylienNewsApi::Query.new(eq: null,
                                 text: null,
                                 _in: null,
                                 gt: null,
                                 gte: null,
                                 lt: null,
                                 lte: null,
                                 boost: null)
```


