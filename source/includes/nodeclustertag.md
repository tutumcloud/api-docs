# Node Cluster Tags

## Node Cluster Tag

> Example

```json
{
    "name": "provider=digitalocean",
    "origin": "tutum"
}
```

Node Cluster Tags help to identify the node cluster nodes when deploying services

### Attributes

Attribute | Description
--------- | -----------
name | Name of the tag
origin | Possible values: `user`, `tutum`

## List all node cluster tags

```http
GET /api/v1/nodeclustertag/ HTTP/1.1
Host: dashboard.tutum.co
Authorization: ApiKey username:apikey
Accept: application/json
```

Lists all node cluster tags. Returns a list of `NodeClusterTag` objects.

### Endpoint Type

Available in Tutum's **REST API**

### HTTP Request

`GET /api/v1/nodeclustertag/`

### Query Parameters

Parameter | Description
--------- | -----------
name | Filter by name
origin | Filter by origin. Possible values: `user`, `tutum`