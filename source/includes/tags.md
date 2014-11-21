# Tags 

## Tag

> Example

```json
{
    "name": "tag_one",
    "resource_uri": "/api/v1/nodecluster/91df1eaf-cef5-4810-a06c-bbddba290dc9/tags/tag_one/"
}
```

A tag is a label to manage any of the following resources: Node Cluster, Node and Service.

### Attributes

Attribute | Description
--------- | -----------
name | A unique identifier for the tag
resource_uri | A unique API endpoint that represents the URL of the resource tagged. Possible values: `nodecluster`, `node` or `service`.

## List all tags 

```python
service = tutum.Service.fetch("91df1eaf-cef5-4810-a06c-bbddba290dc9")
service.tag.list()
```

```http
GET /api/v1/nodecluster/91df1eaf-cef5-4810-a06c-bbddba290dc9/tags/ HTTP/1.1
Host: dashboard.tutum.co
Authorization: ApiKey username:apikey
Accept: application/json
```

```shell
tutum tag list 91df1eaf-cef5-4810-a06c-bbddba290dc9
```

Get a list of all tags associated with the specific resource. 

### HTTP Request

`GET /api/v1/(resource)/(uuid)/tags/`

### Query Parameters

Parameter | Description
--------- | ----------- 
resource | Type of the target resource. Possible values: `nodecluster`, `node`, `service`.
uuid | A unique identifier for the resource generated automatically on creation.


## Tagging a resource

```python
service = tutum.Service.fetch("f1ac7396-7154-47f3-9fce-77ca07ad1e7a")
service.tag.add(["tag_one", "tag-2", "tagthree"])
```

```http
GET /api/v1/service/f1ac7396-7154-47f3-9fce-77ca07ad1e7a/tags/ HTTP/1.1
Host: dashboard.tutum.co
Authorization: ApiKey username:apikey
Accept: application/json

{"tags": [{"name": "tag_one"}, {"name": "tag-2"}, {"name": "tagthree"}]}
```

```shell
tutum tag add --tag tag_one --tag tag-2 --tag tagthree f1ac7396-7154-47f3-9fce-77ca07ad1e7a
```

Creates a new tag/list of tags to a specific resource.

### HTTP Request

`POST /api/v1/(resource)/(uuid)/tags/`

### Query Parameters

Parameter | Description
--------- | ----------- 
resource | Type of the target resource. Possible values: `nodecluster`, `node`, `service`.
uuid | A unique identifier for the resource generated automatically on creation.

### JSON Parameters

Parameter | Description
--------- | -----------
tags | An array of objects with the names of the new tags, i.e. `[{"name": "tag_one"}, {"name": "tag-2"}, {"name": "tagthree"}]`. You can also create only one tag providing just the object, i.e. `{"name": "just_one_tag"}`.


## Delete tag

```python
service = tutum.Service.fetch("4c4b3a8d-be28-4b8d-95e6-61c45c96f771")
service.tag.delete("example_tag")
```

```http
GET /api/v1/nodecluster/91df1eaf-cef5-4810-a06c-bbddba290dc9/tags/tag_one/ HTTP/1.1
Host: dashboard.tutum.co
Authorization: ApiKey username:apikey
Accept: application/json
```

```shell
tutum tag rm --tag example_tag 4c4b3a8d-be28-4b8d-95e6-61c45c96f771
```

Deletes specific tag.

### HTTP Request

`DELETE /api/v1/(resource)/(uuid)/tags/(name)/`

### Query Parameters

Parameter | Description
--------- | ----------- 
resource | Type of the target resource. Possible values: `nodecluster`, `node`, `service`
uuid | A unique identifier for the resource generated automatically on creation
name | The name of the tag to delete
