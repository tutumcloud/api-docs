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

```go
import "github.com/tutumcloud/go-tutum/tutum"

token, err := tutum.CreateToken()

if err != nil {
  log.Println(err)
}

log.Println(token)
```

```http
POST /api/infra/v1/token/ HTTP/1.1
Host: dashboard.tutum.co
Authorization: Basic dXNlcm5hbWU6YXBpa2V5
Accept: application/json
Content-Type: application/json

```

Creates a new token.

### Endpoint Type

Available in Tutum's **REST API**

### HTTP Request

`POST /api/infra/v1/token/`
