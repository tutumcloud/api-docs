# Providers

## Provider

> Example

```json
{
    "available": true,
    "label": "Digital Ocean",
    "name": "digitalocean",
    "regions": [
        "/api/v1/region/digitalocean/ams1/",
        "/api/v1/region/digitalocean/ams2/",
        "/api/v1/region/digitalocean/ams3/",
        "/api/v1/region/digitalocean/lon1/",
        "/api/v1/region/digitalocean/nyc1/",
        "/api/v1/region/digitalocean/nyc2/",
        "/api/v1/region/digitalocean/nyc3/",
        "/api/v1/region/digitalocean/sfo1/",
        "/api/v1/region/digitalocean/sgp1/"
    ],
    "resource_uri": "/api/v1/provider/digitalocean/"
}
```

A provider is a representation of a cloud provider supported by Tutum. Providers have one or more regions where nodes are deployed.


### Attributes

Attribute | Description
--------- | -----------
resource_uri | A unique API endpoint that represents the provider
name | A unique identifier for the provider
label | A user-friendly name for the provider
regions | A list of resource URIs of the regions available in this provider
available | Whether the provider is currently available for new node deployments


## List all providers

```python
import tutum

providers = tutum.Provider.list()
```

```http
GET /api/v1/provider/ HTTP/1.1
Host: dashboard.tutum.co
Authorization: ApiKey username:apikey
Accept: application/json
```


Lists all supported cloud providers. Returns a list of `Provider` objects.

### HTTP Request

`GET /api/v1/provider/`

### Query Parameters

Parameter | Description
--------- | ----------- 
name | Filter by provider name



## Get an individual provider

```python
import tutum

provider = tutum.Provider.fetch("digitalocean")
```

```http
GET /api/v1/provider/digitalocean/ HTTP/1.1
Host: dashboard.tutum.co
Authorization: ApiKey username:apikey
Accept: application/json
```


Get all the details of a specific provider

### HTTP Request

`GET /api/v1/provider/(name)/`

### Query Parameters

Parameter | Description
--------- | ----------- 
name | The name of the provider to retrieve
