# Registries

## Registry

> Example

```json
{
  "host": "registry.local",
  "icon_url": "",
  "is_ssl": true,
  "is_tutum_registry": true,
  "name": "Tutum TEST",
  "resource_uri": "/api/v1/registry/registry.local/",
}
```

A registry where image repositories are hosted

### Attributes

Attribute | Description
--------- | -----------
resource_uri | A unique API endpoint that represents the registry
name | Human-readable name of the registry
host | FQDN of the registry, i.e. 'tutum.co'
icon_url | URL of the registry icon
is_tutum_registry | Whether this registry is run by Tutum
is_ssl | Whether this registry has SSL activated or not


## List all registries

```http
GET /api/v1/registry/ HTTP/1.1
Host: dashboard.tutum.co
Authorization: Basic dXNlcm5hbWU6YXBpa2V5
Accept: application/json
```

Lists all current registries. Returns a list of `Registry` objects.

### Endpoint Type

Available in Tutum's **REST API**

### HTTP Request

`GET /api/v1/registry/`


## Get an existing registry

```http
GET /api/v1/registry/registry.local/ HTTP/1.1
Host: dashboard.tutum.co
Authorization: Basic dXNlcm5hbWU6YXBpa2V5
Accept: application/json
```

Gets all the details of an specific registry

### Endpoint Type

Available in Tutum's **REST API**

### HTTP Request

`GET /api/v1/registry/(host)/`

### Path Parameters

Parameter | Description
--------- | -----------
host | The host of the registry to retrieve
