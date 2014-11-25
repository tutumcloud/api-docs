# Tokens

## Token

> Example

```json
{
    "nodes": [
        "/api/v1/node/fc1a5bb9-17f5-4819-b667-8c7cd819e949/"
    ],
    "resource_uri": "/api/v1/token/21268a001bcf40acb5c0884679d4fd1f/",
    "token": "21268a001bcf40acb5c0884679d4fd1f"
}
```

A token allows authentication for agents running in Nodes

### Attributes

Attribute | Description
--------- | -----------
nodes | List of nodes using this token
token | Value of the token
resource_uri | A unique API endpoint that represents the URL of the token.

## List all tokens

```http
GET /api/v1/token/ HTTP/1.1
Host: dashboard.tutum.co
Authorization: ApiKey username:apikey
Accept: application/json
```

Lists all tokens.

### HTTP Request

`GET /api/v1/token/`


## Create a new token

```http
POST /api/v1/token/ HTTP/1.1
Host: dashboard.tutum.co
Authorization: ApiKey username:apikey
Accept: application/json
Content-Type: application/json

```

Creates a new token.

### HTTP Request

`POST /api/v1/token/`


## Get an existing token

```http
GET /api/v1/token/7eaf7fff-882c-4f3d-9a8f-a22317ac00ce/ HTTP/1.1
Host: dashboard.tutum.co
Authorization: ApiKey username:apikey
Accept: application/json
```

Get an specific token

### HTTP Request

`GET /api/v1/token/(token)/`

### Query Parameters

Parameter | Description
--------- | -----------
token | The value of the token to retrieve


## Delete a token

```http
DELETE /api/v1/token/7eaf7fff-882c-4f3d-9a8f-a22317ac00ce/ HTTP/1.1
Host: dashboard.tutum.co
Authorization: ApiKey username:apikey
Accept: application/json
```

Delete a token.

### HTTP Request

`DELETE /api/v1/token/(token)/`

### Query Parameters

Parameter | Description
--------- | -----------
token | The value of the token to delete



