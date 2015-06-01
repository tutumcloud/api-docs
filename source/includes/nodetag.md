# Node Tags

## Node Tag

> Example

```json
{
    "name": "byon=false",
    "origin": "tutum"
}
```

Node Tags help to identify the nodes when deploying services

### Attributes

Attribute | Description
--------- | -----------
name | Name of the tag
origin | Possible values: `user`, `tutum`

## List all node tags

```http
GET /api/v1/nodetag/ HTTP/1.1
Host: dashboard.tutum.co
Authorization: ApiKey username:apikey
Accept: application/json
```

Lists all node tags. Returns a list of `NodeTag` objects.

### Endpoint Type

Available in Tutum's **REST API**

### HTTP Request

`GET /api/v1/nodetag/`

### Query Parameters

Parameter | Description
--------- | -----------
name | Filter by name
origin | Filter by origin. Possible values: `user`, `tutum`
