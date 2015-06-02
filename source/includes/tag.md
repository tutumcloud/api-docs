# Tags

## Tag

> Example

```json
{
    "name": "byon=false",
    "origin": "tutum"
}
```

Tags are used to target the deployment of services to a specific set of nodes. [Learn more](https://support.tutum.co/support/solutions/articles/5000508859)

### Attributes

Attribute | Description
--------- | -----------
name | Name of the tag
origin | Possible values: `user`, `tutum`


## List all node tags

```http
GET /api/v1/tag/ HTTP/1.1
Host: dashboard.tutum.co
Authorization: ApiKey username:apikey
Accept: application/json
```

Lists all tags used by all nodes. Returns a list of `Tag` objects.

### Endpoint Type

Available in Tutum's **REST API**

### HTTP Request

`GET /api/v1/tag/`

### Query Parameters

Parameter | Description
--------- | -----------
name | Filter by name
origin | Filter by origin. Possible values: `user`, `tutum`
