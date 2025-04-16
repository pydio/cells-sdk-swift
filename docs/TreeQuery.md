# TreeQuery

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**content** | **String** |  | [optional] 
**durationDate** | **String** |  | [optional] 
**eTag** | **String** |  | [optional] 
**excludedPathPrefix** | **[String]** |  | [optional] 
**_extension** | **String** |  | [optional] 
**fileName** | **String** |  | [optional] 
**fileNameOrContent** | **String** |  | [optional] 
**freeString** | **String** | Bleve-like search query to search for a specific metadata value. When querying nodes, this will redirect this query to the Search Engine. When filtering an input, this will load an in-memory bleve engine to evaluate the node.  Bleve query string format is a space separated list of &#x60;[+-]key:value&#x60;, where node meta keys must be prepended with \&quot;Meta.\&quot; For Example, for tags: &#x60;+Meta.usermeta-tags:myvalue&#x60; | [optional] 
**geoQuery** | [**TreeGeoQuery**](TreeGeoQuery.md) |  | [optional] 
**maxDate** | **String** |  | [optional] 
**maxSize** | **String** |  | [optional] 
**minDate** | **String** |  | [optional] 
**minSize** | **String** |  | [optional] 
**not** | **Bool** |  | [optional] 
**pathDepth** | **Int** |  | [optional] 
**pathPrefix** | **[String]** |  | [optional] 
**paths** | **[String]** |  | [optional] 
**type** | [**TreeNodeType**](TreeNodeType.md) |  | [optional] 
**uUIDs** | **[String]** |  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


