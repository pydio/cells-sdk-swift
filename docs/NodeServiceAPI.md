# NodeServiceAPI

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**backgroundActionInfo**](NodeServiceAPI.md#backgroundactioninfo) | **GET** /n/action/{Name}/{JobUuid} | Retrieve information about an action running in background
[**batchUpdateMeta**](NodeServiceAPI.md#batchupdatemeta) | **PATCH** /n/meta/batch | Update/delete user meta in batch. Passed UserMetas must contain a NodeUuid
[**controlBackgroundAction**](NodeServiceAPI.md#controlbackgroundaction) | **PATCH** /n/action/{Name}/{JobUuid} | Send control commands to a background job
[**create**](NodeServiceAPI.md#create) | **POST** /n/nodes/create | Create one or many files (empty or hydrated from a TemplateUuid) or folders
[**createCheck**](NodeServiceAPI.md#createcheck) | **POST** /n/nodes/create/precheck | Apply some pre-validation checks on node name before sending an upload
[**createPublicLink**](NodeServiceAPI.md#createpubliclink) | **POST** /n/node/{Uuid}/link | Create a public link on a given node
[**createSelection**](NodeServiceAPI.md#createselection) | **POST** /n/selection | Create and persist a temporary selection of nodes, that can be used by other actions
[**deletePublicLink**](NodeServiceAPI.md#deletepubliclink) | **DELETE** /n/link/{LinkUuid} | Remove a public link
[**deleteVersion**](NodeServiceAPI.md#deleteversion) | **DELETE** /n/node/{Uuid}/versions/{VersionId} | Delete a version by its ID
[**getByUuid**](NodeServiceAPI.md#getbyuuid) | **GET** /n/node/{Uuid} | Load a node by its Uuid
[**getPublicLink**](NodeServiceAPI.md#getpubliclink) | **GET** /n/link/{LinkUuid} | Load public link information by Uuid
[**listNamespaceValues**](NodeServiceAPI.md#listnamespacevalues) | **GET** /n/meta/namespace/{Namespace} | List values for a given namespace
[**listNamespaces**](NodeServiceAPI.md#listnamespaces) | **GET** /n/meta/namespace | List defined meta namespaces
[**lookup**](NodeServiceAPI.md#lookup) | **POST** /n/nodes | Generic request to either list (using Locators) or search (using Query) for nodes
[**nodeVersions**](NodeServiceAPI.md#nodeversions) | **POST** /n/node/{Uuid}/versions | List all known versions of a node
[**patchNode**](NodeServiceAPI.md#patchnode) | **PATCH** /n/node/{Uuid} | Update a node specific meta. It is used for reserved meta as well (bookmarks, contentLock)
[**performAction**](NodeServiceAPI.md#performaction) | **POST** /n/action/{Name} | Trigger an action on the tree. Returns a JobInfo describing a background task.
[**promoteVersion**](NodeServiceAPI.md#promoteversion) | **POST** /n/node/{Uuid}/versions/{VersionId}/promote | Promotes a version by ID to be the publicly available content of the node - files only
[**publishNode**](NodeServiceAPI.md#publishnode) | **POST** /n/node/{Uuid}/publish | Unset draft status of a resource, typically to publish a folder in draft mode
[**searchMeta**](NodeServiceAPI.md#searchmeta) | **POST** /n/meta/find | Search a list of meta by node Id or by User id and by namespace
[**templates**](NodeServiceAPI.md#templates) | **GET** /n/templates | List available templates for hydrating empty files
[**updateNamespaceValues**](NodeServiceAPI.md#updatenamespacevalues) | **PATCH** /n/meta/namespace/{Namespace} | Add/delete a values for a given namespace
[**updatePublicLink**](NodeServiceAPI.md#updatepubliclink) | **PATCH** /n/link/{LinkUuid} | Update public link settings
[**userBookmarks**](NodeServiceAPI.md#userbookmarks) | **GET** /n/nodes/bookmarks | Special API for Bookmarks, will load userMeta and the associated nodes, and return as a node list


# **backgroundActionInfo**
```swift
    open class func backgroundActionInfo(name: Name_backgroundActionInfo, jobUuid: String, completion: @escaping (_ data: RestBackgroundAction?, _ error: Error?) -> Void)
```

Retrieve information about an action running in background

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import CellsSDK

let name = "name_example" // String | 
let jobUuid = "jobUuid_example" // String | 

// Retrieve information about an action running in background
NodeServiceAPI.backgroundActionInfo(name: name, jobUuid: jobUuid) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **String** |  | 
 **jobUuid** | **String** |  | 

### Return type

[**RestBackgroundAction**](RestBackgroundAction.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **batchUpdateMeta**
```swift
    open class func batchUpdateMeta(body: RestBatchUpdateMetaList, completion: @escaping (_ data: RestBatchUpdateMetaList?, _ error: Error?) -> Void)
```

Update/delete user meta in batch. Passed UserMetas must contain a NodeUuid

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import CellsSDK

let body = restBatchUpdateMetaList(updates: [restMetaUpdate(operation: restMetaUpdateOp(), userMeta: restUserMeta(editable: false, jsonValue: "jsonValue_example", namespace: "namespace_example", nodeUuid: "nodeUuid_example"))]) // RestBatchUpdateMetaList | 

// Update/delete user meta in batch. Passed UserMetas must contain a NodeUuid
NodeServiceAPI.batchUpdateMeta(body: body) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**RestBatchUpdateMetaList**](RestBatchUpdateMetaList.md) |  | 

### Return type

[**RestBatchUpdateMetaList**](RestBatchUpdateMetaList.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **controlBackgroundAction**
```swift
    open class func controlBackgroundAction(name: Name_controlBackgroundAction, jobUuid: String, command: JobsCtrlCommand, completion: @escaping (_ data: RestBackgroundAction?, _ error: Error?) -> Void)
```

Send control commands to a background job

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import CellsSDK

let name = "name_example" // String | 
let jobUuid = "jobUuid_example" // String | 
let command = jobsCtrlCommand(cmd: jobsCommand(), jobId: "jobId_example", ownerId: "ownerId_example", runParameters: "TODO", taskId: "taskId_example") // JobsCtrlCommand | 

// Send control commands to a background job
NodeServiceAPI.controlBackgroundAction(name: name, jobUuid: jobUuid, command: command) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **String** |  | 
 **jobUuid** | **String** |  | 
 **command** | [**JobsCtrlCommand**](JobsCtrlCommand.md) |  | 

### Return type

[**RestBackgroundAction**](RestBackgroundAction.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **create**
```swift
    open class func create(body: RestCreateRequest, completion: @escaping (_ data: RestNodeCollection?, _ error: Error?) -> Void)
```

Create one or many files (empty or hydrated from a TemplateUuid) or folders

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import CellsSDK

let body = restCreateRequest(inputs: [restIncomingNode(contentType: "contentType_example", draftMode: false, knownSize: "knownSize_example", locator: restNodeLocator(path: "path_example", uuid: "uuid_example"), metadata: [restUserMeta(editable: false, jsonValue: "jsonValue_example", namespace: "namespace_example", nodeUuid: "nodeUuid_example")], resourceUuid: "resourceUuid_example", templateUuid: "templateUuid_example", type: treeNodeType(), versionId: "versionId_example")], recursive: false) // RestCreateRequest | 

// Create one or many files (empty or hydrated from a TemplateUuid) or folders
NodeServiceAPI.create(body: body) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**RestCreateRequest**](RestCreateRequest.md) |  | 

### Return type

[**RestNodeCollection**](RestNodeCollection.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createCheck**
```swift
    open class func createCheck(body: RestCreateCheckRequest, completion: @escaping (_ data: RestCreateCheckResponse?, _ error: Error?) -> Void)
```

Apply some pre-validation checks on node name before sending an upload

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import CellsSDK

let body = restCreateCheckRequest(findAvailablePath: false, inputs: [restIncomingNode(contentType: "contentType_example", draftMode: false, knownSize: "knownSize_example", locator: restNodeLocator(path: "path_example", uuid: "uuid_example"), metadata: [restUserMeta(editable: false, jsonValue: "jsonValue_example", namespace: "namespace_example", nodeUuid: "nodeUuid_example")], resourceUuid: "resourceUuid_example", templateUuid: "templateUuid_example", type: treeNodeType(), versionId: "versionId_example")]) // RestCreateCheckRequest | Request for pre-checking nodes before uploading or creating them.

// Apply some pre-validation checks on node name before sending an upload
NodeServiceAPI.createCheck(body: body) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**RestCreateCheckRequest**](RestCreateCheckRequest.md) | Request for pre-checking nodes before uploading or creating them. | 

### Return type

[**RestCreateCheckResponse**](RestCreateCheckResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createPublicLink**
```swift
    open class func createPublicLink(uuid: String, publicLinkRequest: RestPublicLinkRequest, completion: @escaping (_ data: RestShareLink?, _ error: Error?) -> Void)
```

Create a public link on a given node

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import CellsSDK

let uuid = "uuid_example" // String | 
let publicLinkRequest = restPublicLinkRequest(createPassword: "createPassword_example", link: restShareLink(accessEnd: "accessEnd_example", accessStart: "accessStart_example", currentDownloads: "currentDownloads_example", description: "description_example", label: "label_example", linkHash: "linkHash_example", linkUrl: "linkUrl_example", maxDownloads: "maxDownloads_example", passwordRequired: false, permissions: [restShareLinkAccessType()], policies: [serviceResourcePolicy(action: serviceResourcePolicyAction(), effect: serviceResourcePolicyPolicyEffect(), jsonConditions: "jsonConditions_example", resource: "resource_example", subject: "subject_example", id: "id_example")], policiesContextEditable: false, restrictToTargetUsers: false, rootNodes: [treeNode(appearsIn: [treeWorkspaceRelativePath(path: "path_example", wsLabel: "wsLabel_example", wsScope: "wsScope_example", wsSlug: "wsSlug_example", wsUuid: "wsUuid_example")], commits: [treeChangeLog(data: 123, description: "description_example", event: treeNodeChangeEvent(metadata: "TODO", optimistic: false, silent: false, source: nil, target: nil, type: treeNodeChangeEventEventType()), location: nil, mTime: "mTime_example", ownerUuid: "ownerUuid_example", size: "size_example", uuid: "uuid_example")], etag: "etag_example", mTime: "mTime_example", metaStore: "TODO", mode: 123, modeString: "modeString_example", path: "path_example", size: "size_example", type: treeNodeType(), uuid: "uuid_example")], targetUsers: "TODO", userLogin: "userLogin_example", userUuid: "userUuid_example", uuid: "uuid_example", viewTemplateName: "viewTemplateName_example"), passwordEnabled: false, updateCustomHash: "updateCustomHash_example", updatePassword: "updatePassword_example") // RestPublicLinkRequest | 

// Create a public link on a given node
NodeServiceAPI.createPublicLink(uuid: uuid, publicLinkRequest: publicLinkRequest) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uuid** | **String** |  | 
 **publicLinkRequest** | [**RestPublicLinkRequest**](RestPublicLinkRequest.md) |  | 

### Return type

[**RestShareLink**](RestShareLink.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createSelection**
```swift
    open class func createSelection(body: RestSelection, completion: @escaping (_ data: RestSelection?, _ error: Error?) -> Void)
```

Create and persist a temporary selection of nodes, that can be used by other actions

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import CellsSDK

let body = restSelection(nodes: [restNode(activities: [activityObject(context: "context_example", accuracy: 123, actor: nil, altitude: 123, anyOf: nil, attachment: nil, attributedTo: nil, audience: nil, bcc: nil, bto: nil, cc: nil, closed: Date(), content: nil, current: nil, deleted: Date(), duration: Date(), endTime: Date(), first: nil, formerType: activityObjectType(), generator: nil, height: 123, href: "href_example", hreflang: "hreflang_example", icon: nil, id: "id_example", image: nil, inReplyTo: nil, instrument: nil, items: [nil], last: nil, latitude: 123, location: nil, longitude: 123, markdown: "markdown_example", mediaType: "mediaType_example", name: "name_example", next: nil, object: nil, oneOf: nil, origin: nil, partOf: nil, prev: nil, preview: nil, published: Date(), radius: 123, rel: "rel_example", relationship: nil, replies: nil, result: nil, startTime: Date(), subject: nil, summary: "summary_example", tag: nil, target: nil, to: nil, totalItems: 123, type: nil, units: "units_example", updated: Date(), url: nil, width: 123)], contentHash: "contentHash_example", contentLock: restLockInfo(isLocked: false, owner: "owner_example"), contentType: "contentType_example", contextWorkspace: restContextWorkspace(description: "description_example", isRoot: false, isVirtualRoot: false, label: "label_example", permissions: "permissions_example", quota: "quota_example", quotaUsage: "quotaUsage_example", scope: idmWorkspaceScope(), skipRecycle: false, slug: "slug_example", syncable: false, uuid: "uuid_example"), dataSourceFeatures: restDataSourceFeatures(encrypted: false, versioned: false), folderMeta: [restCountMeta(namespace: "namespace_example", value: 123)], hashingMethod: "hashingMethod_example", imageMeta: restImageMeta(height: 123, jsonEXIF: "jsonEXIF_example", orientation: 123, width: 123), isBookmarked: false, isDraft: false, isRecycleBin: false, isRecycled: false, metadata: [restJsonMeta(namespace: "namespace_example", value: "value_example")], mode: restMode(), modified: "modified_example", path: "path_example", preSignedGET: restPreSignedURL(expiresAt: "expiresAt_example", url: "url_example"), previews: [restFilePreview(bucket: "bucket_example", contentType: "contentType_example", dimension: 123, error: false, key: "key_example", preSignedGET: nil, processing: false)], shares: [restShareLink(accessEnd: "accessEnd_example", accessStart: "accessStart_example", currentDownloads: "currentDownloads_example", description: "description_example", label: "label_example", linkHash: "linkHash_example", linkUrl: "linkUrl_example", maxDownloads: "maxDownloads_example", passwordRequired: false, permissions: [restShareLinkAccessType()], policies: [serviceResourcePolicy(action: serviceResourcePolicyAction(), effect: serviceResourcePolicyPolicyEffect(), jsonConditions: "jsonConditions_example", resource: "resource_example", subject: "subject_example", id: "id_example")], policiesContextEditable: false, restrictToTargetUsers: false, rootNodes: [treeNode(appearsIn: [treeWorkspaceRelativePath(path: "path_example", wsLabel: "wsLabel_example", wsScope: "wsScope_example", wsSlug: "wsSlug_example", wsUuid: "wsUuid_example")], commits: [treeChangeLog(data: 123, description: "description_example", event: treeNodeChangeEvent(metadata: "TODO", optimistic: false, silent: false, source: nil, target: nil, type: treeNodeChangeEventEventType()), location: nil, mTime: "mTime_example", ownerUuid: "ownerUuid_example", size: "size_example", uuid: "uuid_example")], etag: "etag_example", mTime: "mTime_example", metaStore: "TODO", mode: 123, modeString: "modeString_example", path: "path_example", size: "size_example", type: treeNodeType(), uuid: "uuid_example")], targetUsers: "TODO", userLogin: "userLogin_example", userUuid: "userUuid_example", uuid: "uuid_example", viewTemplateName: "viewTemplateName_example")], size: "size_example", storageETag: "storageETag_example", subscriptions: [activitySubscription(events: ["events_example"], objectId: "objectId_example", objectType: activityOwnerType(), userId: "userId_example")], type: nil, userMetadata: [restUserMeta(editable: false, jsonValue: "jsonValue_example", namespace: "namespace_example", nodeUuid: "nodeUuid_example")], uuid: "uuid_example", versionMeta: restVersionMeta(description: "description_example", isDraft: false, isHead: false, ownerUuid: "ownerUuid_example", versionId: "versionId_example"), versions: [restVersion(contentHash: "contentHash_example", description: "description_example", draft: false, eTag: "eTag_example", isHead: false, mTime: "mTime_example", ownerName: "ownerName_example", ownerUuid: "ownerUuid_example", size: "size_example", versionId: "versionId_example")])], uuid: "uuid_example") // RestSelection | Request to create a selection from a list of nodes.

// Create and persist a temporary selection of nodes, that can be used by other actions
NodeServiceAPI.createSelection(body: body) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**RestSelection**](RestSelection.md) | Request to create a selection from a list of nodes. | 

### Return type

[**RestSelection**](RestSelection.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deletePublicLink**
```swift
    open class func deletePublicLink(linkUuid: String, completion: @escaping (_ data: RestPublicLinkDeleteSuccess?, _ error: Error?) -> Void)
```

Remove a public link

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import CellsSDK

let linkUuid = "linkUuid_example" // String | 

// Remove a public link
NodeServiceAPI.deletePublicLink(linkUuid: linkUuid) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **linkUuid** | **String** |  | 

### Return type

[**RestPublicLinkDeleteSuccess**](RestPublicLinkDeleteSuccess.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteVersion**
```swift
    open class func deleteVersion(uuid: String, versionId: String, completion: @escaping (_ data: RestDeleteVersionResponse?, _ error: Error?) -> Void)
```

Delete a version by its ID

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import CellsSDK

let uuid = "uuid_example" // String | 
let versionId = "versionId_example" // String | 

// Delete a version by its ID
NodeServiceAPI.deleteVersion(uuid: uuid, versionId: versionId) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uuid** | **String** |  | 
 **versionId** | **String** |  | 

### Return type

[**RestDeleteVersionResponse**](RestDeleteVersionResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getByUuid**
```swift
    open class func getByUuid(uuid: String, path: String? = nil, completion: @escaping (_ data: RestNode?, _ error: Error?) -> Void)
```

Load a node by its Uuid

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import CellsSDK

let uuid = "uuid_example" // String | 
let path = "path_example" // String |  (optional)

// Load a node by its Uuid
NodeServiceAPI.getByUuid(uuid: uuid, path: path) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uuid** | **String** |  | 
 **path** | **String** |  | [optional] 

### Return type

[**RestNode**](RestNode.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPublicLink**
```swift
    open class func getPublicLink(linkUuid: String, completion: @escaping (_ data: RestShareLink?, _ error: Error?) -> Void)
```

Load public link information by Uuid

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import CellsSDK

let linkUuid = "linkUuid_example" // String | 

// Load public link information by Uuid
NodeServiceAPI.getPublicLink(linkUuid: linkUuid) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **linkUuid** | **String** |  | 

### Return type

[**RestShareLink**](RestShareLink.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listNamespaceValues**
```swift
    open class func listNamespaceValues(namespace: String, completion: @escaping (_ data: RestNamespaceValuesResponse?, _ error: Error?) -> Void)
```

List values for a given namespace

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import CellsSDK

let namespace = "namespace_example" // String | List persisted values for this namespace

// List values for a given namespace
NodeServiceAPI.listNamespaceValues(namespace: namespace) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **namespace** | **String** | List persisted values for this namespace | 

### Return type

[**RestNamespaceValuesResponse**](RestNamespaceValuesResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listNamespaces**
```swift
    open class func listNamespaces(completion: @escaping (_ data: RestUserMetaNamespaceCollection?, _ error: Error?) -> Void)
```

List defined meta namespaces

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import CellsSDK


// List defined meta namespaces
NodeServiceAPI.listNamespaces() { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**RestUserMetaNamespaceCollection**](RestUserMetaNamespaceCollection.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **lookup**
```swift
    open class func lookup(body: RestLookupRequest, completion: @escaping (_ data: RestNodeCollection?, _ error: Error?) -> Void)
```

Generic request to either list (using Locators) or search (using Query) for nodes

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import CellsSDK

let body = restLookupRequest(filters: restLookupFilter(date: LookupFilterDateRange(max: "max_example", min: "min_example", relativeDuration: "relativeDuration_example"), extensions: ["extensions_example"], freeExpression: "freeExpression_example", metadata: [LookupFilterMetaFilter(namespace: "namespace_example", operation: LookupFilterMetaFilterOp(), term: "term_example")], prefixes: [LookupFilterPathPrefix(exclude: false, _prefix: "_prefix_example")], size: LookupFilterSizeRange(max: "max_example", min: "min_example"), status: LookupFilterStatusFilter(deleted: StatusFilterDeletedStatus(), hasPublicLink: false, isBookmarked: false, isDraft: false), text: LookupFilterTextSearch(searchIn: LookupFilterTextSearchIn(), term: "term_example"), type: treeNodeType()), flags: [restFlag()], limit: "limit_example", locators: restNodeLocators(many: [restNodeLocator(path: "path_example", uuid: "uuid_example")]), offset: "offset_example", query: treeQuery(content: "content_example", durationDate: "durationDate_example", eTag: "eTag_example", excludedPathPrefix: ["excludedPathPrefix_example"], _extension: "_extension_example", fileName: "fileName_example", fileNameOrContent: "fileNameOrContent_example", freeString: "freeString_example", geoQuery: treeGeoQuery(bottomRight: treeGeoPoint(lat: 123, lon: 123), center: nil, distance: "distance_example", topLeft: nil), maxDate: "maxDate_example", maxSize: "maxSize_example", minDate: "minDate_example", minSize: "minSize_example", not: false, pathDepth: 123, pathPrefix: ["pathPrefix_example"], paths: ["paths_example"], type: nil, uUIDs: ["uUIDs_example"]), scope: restLookupScope(nodes: [nil], recursive: false, root: nil), sortDirDesc: false, sortField: "sortField_example") // RestLookupRequest | 

// Generic request to either list (using Locators) or search (using Query) for nodes
NodeServiceAPI.lookup(body: body) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**RestLookupRequest**](RestLookupRequest.md) |  | 

### Return type

[**RestNodeCollection**](RestNodeCollection.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **nodeVersions**
```swift
    open class func nodeVersions(uuid: String, query: RestNodeVersionsFilter, completion: @escaping (_ data: RestVersionCollection?, _ error: Error?) -> Void)
```

List all known versions of a node

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import CellsSDK

let uuid = "uuid_example" // String | The node Uuid
let query = restNodeVersionsFilter(filterBy: restVersionsTypes(), limit: "limit_example", offset: "offset_example", sortDirDesc: false, sortField: "sortField_example") // RestNodeVersionsFilter | Additional parameters for filtering/sorting

// List all known versions of a node
NodeServiceAPI.nodeVersions(uuid: uuid, query: query) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uuid** | **String** | The node Uuid | 
 **query** | [**RestNodeVersionsFilter**](RestNodeVersionsFilter.md) | Additional parameters for filtering/sorting | 

### Return type

[**RestVersionCollection**](RestVersionCollection.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **patchNode**
```swift
    open class func patchNode(uuid: String, nodeUpdates: RestNodeUpdates, completion: @escaping (_ data: RestNode?, _ error: Error?) -> Void)
```

Update a node specific meta. It is used for reserved meta as well (bookmarks, contentLock)

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import CellsSDK

let uuid = "uuid_example" // String | 
let nodeUpdates = restNodeUpdates(bookmark: restMetaToggle(value: false), contentLock: nil, metaUpdates: [restMetaUpdate(operation: restMetaUpdateOp(), userMeta: restUserMeta(editable: false, jsonValue: "jsonValue_example", namespace: "namespace_example", nodeUuid: "nodeUuid_example"))]) // RestNodeUpdates | 

// Update a node specific meta. It is used for reserved meta as well (bookmarks, contentLock)
NodeServiceAPI.patchNode(uuid: uuid, nodeUpdates: nodeUpdates) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uuid** | **String** |  | 
 **nodeUpdates** | [**RestNodeUpdates**](RestNodeUpdates.md) |  | 

### Return type

[**RestNode**](RestNode.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **performAction**
```swift
    open class func performAction(name: Name_performAction, parameters: RestActionParameters, jobUuid: String? = nil, completion: @escaping (_ data: RestPerformActionResponse?, _ error: Error?) -> Void)
```

Trigger an action on the tree. Returns a JobInfo describing a background task.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import CellsSDK

let name = "name_example" // String | 
let parameters = restActionParameters(awaitStatus: jobsTaskStatus(), awaitTimeout: "awaitTimeout_example", copyMoveOptions: restActionOptionsCopyMove(targetIsParent: false, targetPath: "targetPath_example"), deleteOptions: restActionOptionsDelete(permanentDelete: false), extractCompressOptions: restActionOptionsExtractCompress(archiveFormat: "archiveFormat_example", targetPath: "targetPath_example"), jsonParameters: "jsonParameters_example", nodes: [restNodeLocator(path: "path_example", uuid: "uuid_example")], selectionUuid: "selectionUuid_example") // RestActionParameters | 
let jobUuid = "jobUuid_example" // String |  (optional)

// Trigger an action on the tree. Returns a JobInfo describing a background task.
NodeServiceAPI.performAction(name: name, parameters: parameters, jobUuid: jobUuid) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **String** |  | 
 **parameters** | [**RestActionParameters**](RestActionParameters.md) |  | 
 **jobUuid** | **String** |  | [optional] 

### Return type

[**RestPerformActionResponse**](RestPerformActionResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **promoteVersion**
```swift
    open class func promoteVersion(uuid: String, versionId: String, parameters: RestPromoteParameters, completion: @escaping (_ data: RestPromoteVersionResponse?, _ error: Error?) -> Void)
```

Promotes a version by ID to be the publicly available content of the node - files only

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import CellsSDK

let uuid = "uuid_example" // String | 
let versionId = "versionId_example" // String | 
let parameters = restPromoteParameters(ignoreConflicts: false, publish: false) // RestPromoteParameters | 

// Promotes a version by ID to be the publicly available content of the node - files only
NodeServiceAPI.promoteVersion(uuid: uuid, versionId: versionId, parameters: parameters) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uuid** | **String** |  | 
 **versionId** | **String** |  | 
 **parameters** | [**RestPromoteParameters**](RestPromoteParameters.md) |  | 

### Return type

[**RestPromoteVersionResponse**](RestPromoteVersionResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **publishNode**
```swift
    open class func publishNode(uuid: String, parameters: RestPublishNodeParameters, completion: @escaping (_ data: RestPublishNodeResponse?, _ error: Error?) -> Void)
```

Unset draft status of a resource, typically to publish a folder in draft mode

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import CellsSDK

let uuid = "uuid_example" // String | 
let parameters = restPublishNodeParameters(cascade: false, promoteLatest: false) // RestPublishNodeParameters | 

// Unset draft status of a resource, typically to publish a folder in draft mode
NodeServiceAPI.publishNode(uuid: uuid, parameters: parameters) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uuid** | **String** |  | 
 **parameters** | [**RestPublishNodeParameters**](RestPublishNodeParameters.md) |  | 

### Return type

[**RestPublishNodeResponse**](RestPublishNodeResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **searchMeta**
```swift
    open class func searchMeta(body: IdmSearchUserMetaRequest, completion: @escaping (_ data: RestUserMetaList?, _ error: Error?) -> Void)
```

Search a list of meta by node Id or by User id and by namespace

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import CellsSDK

let body = idmSearchUserMetaRequest(metaUuids: ["metaUuids_example"], namespace: "namespace_example", nodeUuids: ["nodeUuids_example"], resourceQuery: serviceResourcePolicyQuery(action: serviceResourcePolicyAction(), any: false, empty: false, leftIdentifier: "leftIdentifier_example", subjects: ["subjects_example"]), resourceSubjectOwner: "resourceSubjectOwner_example") // IdmSearchUserMetaRequest | 

// Search a list of meta by node Id or by User id and by namespace
NodeServiceAPI.searchMeta(body: body) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**IdmSearchUserMetaRequest**](IdmSearchUserMetaRequest.md) |  | 

### Return type

[**RestUserMetaList**](RestUserMetaList.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **templates**
```swift
    open class func templates(templateType: String? = nil, completion: @escaping (_ data: RestListTemplatesResponse?, _ error: Error?) -> Void)
```

List available templates for hydrating empty files

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import CellsSDK

let templateType = "templateType_example" // String |  (optional)

// List available templates for hydrating empty files
NodeServiceAPI.templates(templateType: templateType) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **templateType** | **String** |  | [optional] 

### Return type

[**RestListTemplatesResponse**](RestListTemplatesResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateNamespaceValues**
```swift
    open class func updateNamespaceValues(namespace: String, operation: RestNamespaceValuesOperation, completion: @escaping (_ data: RestNamespaceValuesResponse?, _ error: Error?) -> Void)
```

Add/delete a values for a given namespace

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import CellsSDK

let namespace = "namespace_example" // String | List persisted values for this namespace
let operation = restNamespaceValuesOperation(operation: restNsOp(), values: ["values_example"]) // RestNamespaceValuesOperation | 

// Add/delete a values for a given namespace
NodeServiceAPI.updateNamespaceValues(namespace: namespace, operation: operation) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **namespace** | **String** | List persisted values for this namespace | 
 **operation** | [**RestNamespaceValuesOperation**](RestNamespaceValuesOperation.md) |  | 

### Return type

[**RestNamespaceValuesResponse**](RestNamespaceValuesResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updatePublicLink**
```swift
    open class func updatePublicLink(linkUuid: String, publicLinkRequest: RestPublicLinkRequest, completion: @escaping (_ data: RestShareLink?, _ error: Error?) -> Void)
```

Update public link settings

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import CellsSDK

let linkUuid = "linkUuid_example" // String | 
let publicLinkRequest = restPublicLinkRequest(createPassword: "createPassword_example", link: restShareLink(accessEnd: "accessEnd_example", accessStart: "accessStart_example", currentDownloads: "currentDownloads_example", description: "description_example", label: "label_example", linkHash: "linkHash_example", linkUrl: "linkUrl_example", maxDownloads: "maxDownloads_example", passwordRequired: false, permissions: [restShareLinkAccessType()], policies: [serviceResourcePolicy(action: serviceResourcePolicyAction(), effect: serviceResourcePolicyPolicyEffect(), jsonConditions: "jsonConditions_example", resource: "resource_example", subject: "subject_example", id: "id_example")], policiesContextEditable: false, restrictToTargetUsers: false, rootNodes: [treeNode(appearsIn: [treeWorkspaceRelativePath(path: "path_example", wsLabel: "wsLabel_example", wsScope: "wsScope_example", wsSlug: "wsSlug_example", wsUuid: "wsUuid_example")], commits: [treeChangeLog(data: 123, description: "description_example", event: treeNodeChangeEvent(metadata: "TODO", optimistic: false, silent: false, source: nil, target: nil, type: treeNodeChangeEventEventType()), location: nil, mTime: "mTime_example", ownerUuid: "ownerUuid_example", size: "size_example", uuid: "uuid_example")], etag: "etag_example", mTime: "mTime_example", metaStore: "TODO", mode: 123, modeString: "modeString_example", path: "path_example", size: "size_example", type: treeNodeType(), uuid: "uuid_example")], targetUsers: "TODO", userLogin: "userLogin_example", userUuid: "userUuid_example", uuid: "uuid_example", viewTemplateName: "viewTemplateName_example"), passwordEnabled: false, updateCustomHash: "updateCustomHash_example", updatePassword: "updatePassword_example") // RestPublicLinkRequest | 

// Update public link settings
NodeServiceAPI.updatePublicLink(linkUuid: linkUuid, publicLinkRequest: publicLinkRequest) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **linkUuid** | **String** |  | 
 **publicLinkRequest** | [**RestPublicLinkRequest**](RestPublicLinkRequest.md) |  | 

### Return type

[**RestShareLink**](RestShareLink.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **userBookmarks**
```swift
    open class func userBookmarks(all: Bool? = nil, completion: @escaping (_ data: RestNodeCollection?, _ error: Error?) -> Void)
```

Special API for Bookmarks, will load userMeta and the associated nodes, and return as a node list

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import CellsSDK

let all = true // Bool |  (optional)

// Special API for Bookmarks, will load userMeta and the associated nodes, and return as a node list
NodeServiceAPI.userBookmarks(all: all) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **all** | **Bool** |  | [optional] 

### Return type

[**RestNodeCollection**](RestNodeCollection.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

