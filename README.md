# Swift6 API client for CellsSDK

No description provided (generated by Openapi Generator https://github.com/openapitools/openapi-generator)

## Overview
This API client was generated by the [OpenAPI Generator](https://openapi-generator.tech) project.  By using the [openapi-spec](https://github.com/OAI/OpenAPI-Specification) from a remote server, you can easily generate an API client.

- API version: v2
- Package version: 
- Generator version: 7.10.0
- Build package: org.openapitools.codegen.languages.Swift6ClientCodegen
For more information, please visit [https://pydio.com](https://pydio.com)

## Installation

### Carthage

Run `carthage update`

### CocoaPods

Run `pod install`

## Documentation for API Endpoints

All URIs are relative to *http://localhost*

Class | Method | HTTP request | Description
------------ | ------------- | ------------- | -------------
*NodeServiceAPI* | [**backgroundActionInfo**](docs/NodeServiceAPI.md#backgroundactioninfo) | **GET** /n/action/{Name}/{JobUuid} | Retrieve information about an action running in background
*NodeServiceAPI* | [**batchUpdateMeta**](docs/NodeServiceAPI.md#batchupdatemeta) | **PATCH** /n/meta/batch | Update/delete user meta in batch. Passed UserMetas must contain a NodeUuid
*NodeServiceAPI* | [**controlBackgroundAction**](docs/NodeServiceAPI.md#controlbackgroundaction) | **PATCH** /n/action/{Name}/{JobUuid} | Send control commands to a background job
*NodeServiceAPI* | [**create**](docs/NodeServiceAPI.md#create) | **POST** /n/nodes/create | Create one or many files (empty or hydrated from a TemplateUuid) or folders
*NodeServiceAPI* | [**createCheck**](docs/NodeServiceAPI.md#createcheck) | **POST** /n/nodes/create/precheck | Apply some pre-validation checks on node name before sending an upload
*NodeServiceAPI* | [**createPublicLink**](docs/NodeServiceAPI.md#createpubliclink) | **POST** /n/node/{Uuid}/link | Create a public link on a given node
*NodeServiceAPI* | [**createSelection**](docs/NodeServiceAPI.md#createselection) | **POST** /n/selection | Create and persist a temporary selection of nodes, that can be used by other actions
*NodeServiceAPI* | [**deletePublicLink**](docs/NodeServiceAPI.md#deletepubliclink) | **DELETE** /n/link/{LinkUuid} | Remove a public link
*NodeServiceAPI* | [**deleteVersion**](docs/NodeServiceAPI.md#deleteversion) | **DELETE** /n/node/{Uuid}/versions/{VersionId} | Delete a version by its ID
*NodeServiceAPI* | [**getByUuid**](docs/NodeServiceAPI.md#getbyuuid) | **GET** /n/node/{Uuid} | Load a node by its Uuid
*NodeServiceAPI* | [**getPublicLink**](docs/NodeServiceAPI.md#getpubliclink) | **GET** /n/link/{LinkUuid} | Load public link information by Uuid
*NodeServiceAPI* | [**listNamespaceValues**](docs/NodeServiceAPI.md#listnamespacevalues) | **GET** /n/meta/namespace/{Namespace} | List values for a given namespace
*NodeServiceAPI* | [**listNamespaces**](docs/NodeServiceAPI.md#listnamespaces) | **GET** /n/meta/namespace | List defined meta namespaces
*NodeServiceAPI* | [**lookup**](docs/NodeServiceAPI.md#lookup) | **POST** /n/nodes | Generic request to either list (using Locators) or search (using Query) for nodes
*NodeServiceAPI* | [**nodeVersions**](docs/NodeServiceAPI.md#nodeversions) | **POST** /n/node/{Uuid}/versions | List all known versions of a node
*NodeServiceAPI* | [**patchNode**](docs/NodeServiceAPI.md#patchnode) | **PATCH** /n/node/{Uuid} | Update a node specific meta. It is used for reserved meta as well (bookmarks, contentLock)
*NodeServiceAPI* | [**performAction**](docs/NodeServiceAPI.md#performaction) | **POST** /n/action/{Name} | Trigger an action on the tree. Returns a JobInfo describing a background task.
*NodeServiceAPI* | [**promoteVersion**](docs/NodeServiceAPI.md#promoteversion) | **POST** /n/node/{Uuid}/versions/{VersionId}/promote | Promotes a version by ID to be the publicly available content of the node - files only
*NodeServiceAPI* | [**publishNode**](docs/NodeServiceAPI.md#publishnode) | **POST** /n/node/{Uuid}/publish | Unset draft status of a resource, typically to publish a folder in draft mode
*NodeServiceAPI* | [**searchMeta**](docs/NodeServiceAPI.md#searchmeta) | **POST** /n/meta/find | Search a list of meta by node Id or by User id and by namespace
*NodeServiceAPI* | [**templates**](docs/NodeServiceAPI.md#templates) | **GET** /n/templates | List available templates for hydrating empty files
*NodeServiceAPI* | [**updateNamespaceValues**](docs/NodeServiceAPI.md#updatenamespacevalues) | **PATCH** /n/meta/namespace/{Namespace} | Add/delete a values for a given namespace
*NodeServiceAPI* | [**updatePublicLink**](docs/NodeServiceAPI.md#updatepubliclink) | **PATCH** /n/link/{LinkUuid} | Update public link settings
*NodeServiceAPI* | [**userBookmarks**](docs/NodeServiceAPI.md#userbookmarks) | **GET** /n/nodes/bookmarks | Special API for Bookmarks, will load userMeta and the associated nodes, and return as a node list


## Documentation For Models

 - [ActivityObject](docs/ActivityObject.md)
 - [ActivityObjectType](docs/ActivityObjectType.md)
 - [ActivityOwnerType](docs/ActivityOwnerType.md)
 - [ActivitySubscription](docs/ActivitySubscription.md)
 - [IdmSearchUserMetaRequest](docs/IdmSearchUserMetaRequest.md)
 - [IdmUserMetaNamespace](docs/IdmUserMetaNamespace.md)
 - [IdmWorkspaceScope](docs/IdmWorkspaceScope.md)
 - [JobsCommand](docs/JobsCommand.md)
 - [JobsCtrlCommand](docs/JobsCtrlCommand.md)
 - [JobsTaskStatus](docs/JobsTaskStatus.md)
 - [MetaUpdateOp](docs/MetaUpdateOp.md)
 - [ProtobufAny](docs/ProtobufAny.md)
 - [RestActionParameters](docs/RestActionParameters.md)
 - [RestActionStatus](docs/RestActionStatus.md)
 - [RestBackgroundAction](docs/RestBackgroundAction.md)
 - [RestBatchUpdateMetaList](docs/RestBatchUpdateMetaList.md)
 - [RestCheckResult](docs/RestCheckResult.md)
 - [RestContextWorkspace](docs/RestContextWorkspace.md)
 - [RestCountMeta](docs/RestCountMeta.md)
 - [RestCreateCheckRequest](docs/RestCreateCheckRequest.md)
 - [RestCreateCheckResponse](docs/RestCreateCheckResponse.md)
 - [RestCreateRequest](docs/RestCreateRequest.md)
 - [RestDataSourceFeatures](docs/RestDataSourceFeatures.md)
 - [RestDeleteVersionResponse](docs/RestDeleteVersionResponse.md)
 - [RestError](docs/RestError.md)
 - [RestFilePreview](docs/RestFilePreview.md)
 - [RestFlag](docs/RestFlag.md)
 - [RestImageMeta](docs/RestImageMeta.md)
 - [RestIncomingNode](docs/RestIncomingNode.md)
 - [RestJsonMeta](docs/RestJsonMeta.md)
 - [RestListTemplatesResponse](docs/RestListTemplatesResponse.md)
 - [RestLockInfo](docs/RestLockInfo.md)
 - [RestLookupRequest](docs/RestLookupRequest.md)
 - [RestMetaToggle](docs/RestMetaToggle.md)
 - [RestMetaUpdate](docs/RestMetaUpdate.md)
 - [RestMode](docs/RestMode.md)
 - [RestNamespaceValuesOperation](docs/RestNamespaceValuesOperation.md)
 - [RestNamespaceValuesResponse](docs/RestNamespaceValuesResponse.md)
 - [RestNode](docs/RestNode.md)
 - [RestNodeCollection](docs/RestNodeCollection.md)
 - [RestNodeLocator](docs/RestNodeLocator.md)
 - [RestNodeLocators](docs/RestNodeLocators.md)
 - [RestNodeUpdates](docs/RestNodeUpdates.md)
 - [RestNodeVersionsFilter](docs/RestNodeVersionsFilter.md)
 - [RestNsOp](docs/RestNsOp.md)
 - [RestPagination](docs/RestPagination.md)
 - [RestPerformActionResponse](docs/RestPerformActionResponse.md)
 - [RestPromoteParameters](docs/RestPromoteParameters.md)
 - [RestPromoteVersionResponse](docs/RestPromoteVersionResponse.md)
 - [RestPublicLinkDeleteSuccess](docs/RestPublicLinkDeleteSuccess.md)
 - [RestPublicLinkRequest](docs/RestPublicLinkRequest.md)
 - [RestPublishCascadeResult](docs/RestPublishCascadeResult.md)
 - [RestPublishNodeParameters](docs/RestPublishNodeParameters.md)
 - [RestPublishNodeResponse](docs/RestPublishNodeResponse.md)
 - [RestSelection](docs/RestSelection.md)
 - [RestShareLink](docs/RestShareLink.md)
 - [RestShareLinkAccessType](docs/RestShareLinkAccessType.md)
 - [RestShareLinkTargetUser](docs/RestShareLinkTargetUser.md)
 - [RestTemplate](docs/RestTemplate.md)
 - [RestTemplateNode](docs/RestTemplateNode.md)
 - [RestUserActionType](docs/RestUserActionType.md)
 - [RestUserMeta](docs/RestUserMeta.md)
 - [RestUserMetaList](docs/RestUserMetaList.md)
 - [RestUserMetaNamespaceCollection](docs/RestUserMetaNamespaceCollection.md)
 - [RestVersion](docs/RestVersion.md)
 - [RestVersionCollection](docs/RestVersionCollection.md)
 - [RestVersionMeta](docs/RestVersionMeta.md)
 - [RestVersionsTypes](docs/RestVersionsTypes.md)
 - [ServiceResourcePolicy](docs/ServiceResourcePolicy.md)
 - [ServiceResourcePolicyAction](docs/ServiceResourcePolicyAction.md)
 - [ServiceResourcePolicyPolicyEffect](docs/ServiceResourcePolicyPolicyEffect.md)
 - [ServiceResourcePolicyQuery](docs/ServiceResourcePolicyQuery.md)
 - [TreeChangeLog](docs/TreeChangeLog.md)
 - [TreeGeoPoint](docs/TreeGeoPoint.md)
 - [TreeGeoQuery](docs/TreeGeoQuery.md)
 - [TreeNode](docs/TreeNode.md)
 - [TreeNodeChangeEvent](docs/TreeNodeChangeEvent.md)
 - [TreeNodeChangeEventEventType](docs/TreeNodeChangeEventEventType.md)
 - [TreeNodeType](docs/TreeNodeType.md)
 - [TreeQuery](docs/TreeQuery.md)
 - [TreeSearchFacet](docs/TreeSearchFacet.md)
 - [TreeWorkspaceRelativePath](docs/TreeWorkspaceRelativePath.md)


<a id="documentation-for-authorization"></a>
## Documentation For Authorization


Authentication schemes defined for the API:
<a id="Bearer"></a>
### Bearer

- **Type**: API key
- **API key parameter name**: Authorization
- **Location**: HTTP header


# How do I migrate from the Swift 5 generator to the swift 6 generator?

https://openapi-generator.tech/docs/faq-generators#how-do-i-migrate-from-the-swift-5-generator-to-the-swift-6-generator

### How do I implement bearer token authentication with URLSession on the Swift 6 API client?

https://openapi-generator.tech/docs/faq-generators#how-do-i-implement-bearer-token-authentication-with-urlsession-on-the-swift-6-api-client

## Author



