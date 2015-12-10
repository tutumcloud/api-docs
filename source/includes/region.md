# Regions

## Region

> Example

```json
{
    "availability_zones": [],
    "available": true,
    "label": "Amsterdam 2",
    "name": "ams2",
    "node_types": [
        "/api/v1/nodetype/digitalocean/1gb/",
        "/api/v1/nodetype/digitalocean/2gb/",
        "/api/v1/nodetype/digitalocean/4gb/",
        "/api/v1/nodetype/digitalocean/8gb/",
        "/api/v1/nodetype/digitalocean/16gb/",
        "/api/v1/nodetype/digitalocean/32gb/",
        "/api/v1/nodetype/digitalocean/48gb/",
        "/api/v1/nodetype/digitalocean/64gb/"
    ],
    "provider": "/api/v1/provider/digitalocean/",
    "resource_uri": "/api/v1/region/digitalocean/ams2/"
}
```

A region is a representation of an entire or a subset of a data center of a cloud provider. It can contain availability zones (depending on the provider) and one or more node types.


### Attributes

Attribute | Description
--------- | -----------
resource_uri | A unique API endpoint that represents the region
name | An identifier for the region
label | A user-friendly name for the region
node_types | A list of resource URIs of the node types available in the region
availability_zones | A list of resource URIs of the availability zones available in the region
provider | The resource URI of the provider of the region
available | Whether the region is currently available for new node deployments


## List all regions

```python
import tutum

regions = tutum.Region.list()
```

```http
GET /api/v1/region/ HTTP/1.1
Host: dashboard.tutum.co
Authorization: Basic dXNlcm5hbWU6YXBpa2V5
Accept: application/json
```

```go
import "github.com/tutumcloud/go-tutum/tutum"

regionList, err := tutum.ListRegions()

if err != nil {
  log.Println(err)
}

log.Println(regionList)
```

```shell
tutum nodecluster region
```

Lists all regions of all supported cloud providers. Returns a list of `Region` objects.

### Endpoint Type

Available in Tutum's **REST API**

### HTTP Request

`GET /api/v1/region/`

### Query Parameters

Parameter | Description
--------- | -----------
name | Filter by region name
provider | Filter by provider (resource URI)



## Get an individual region

```python
import tutum

region = tutum.Region.fetch("digitalocean/lon1")
```

```go
import "github.com/tutumcloud/go-tutum/tutum"

region, err := tutum.GetRegion("digitalocean","lon1")

if err != nil {
  log.Println(err)
}

log.Println(region)
```

```http
GET /api/v1/region/digitalocean/lon1/ HTTP/1.1
Host: dashboard.tutum.co
Authorization: Basic dXNlcm5hbWU6YXBpa2V5
Accept: application/json
```


Get all the details of a specific region

### Endpoint Type

Available in Tutum's **REST API**

### HTTP Request

`GET /api/v1/region/(provider.name)/(name)/`

### Path Parameters

Parameter | Description
--------- | -----------
name | The name of the region to retrieve
provider.name | The name of the provider of the region
