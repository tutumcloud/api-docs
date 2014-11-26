# Tokens

## Token

> Example

```json
{
    "token": "21268a001bcf40acb5c0884679d4fd1f"
}
```

A token allows authentication for agents running in Nodes

### Attributes

Attribute | Description
--------- | -----------
token | Value of the token

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
