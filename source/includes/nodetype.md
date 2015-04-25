# Node Types

## Node Type

> Example

```json
{
	"availability_zones": [],
	"available": true,
	"label": "1GB",
	"name": "1gb",
	"provider": "/api/v1/provider/digitalocean/",
	"regions": [
		"/api/v1/region/digitalocean/ams1/",
		"/api/v1/region/digitalocean/sfo1/",
		"/api/v1/region/digitalocean/nyc2/",
		"/api/v1/region/digitalocean/ams2/",
		"/api/v1/region/digitalocean/sgp1/",
		"/api/v1/region/digitalocean/lon1/",
		"/api/v1/region/digitalocean/nyc3/",
		"/api/v1/region/digitalocean/nyc1/"
	],
	"resource_uri": "/api/v1/nodetype/digitalocean/1gb/"
}
```

A node type is a representation of an instance size supported by a certain cloud provider in a certain region and/or availability zone.


### Attributes

Attribute | Description
--------- | -----------
resource_uri | A unique API endpoint that represents the node type
name | An identifier for the node type
label | A user-friendly name for the node type
regions | A list of resource URIs of the regions to which this node type can be deployed to
availability_zones | A list of resource URIs of the availability zones to which this node type can be deployed to
provider | The resource URI of the provider of the node type
available | Whether the node type is currently available for new node deployments


## List all node types

```python
import tutum

nodetypes = tutum.NodeType.list()
```

```go
import "github.com/tutumcloud/go-tutum/tutum"

nodetypeList, err := tutum.ListNodeTypes()

if err != nil {
  log.Println(err)
}

log.Println(nodetypeList)
```

```http
GET /api/v1/nodetype/ HTTP/1.1
Host: dashboard.tutum.co
Authorization: ApiKey username:apikey
Accept: application/json
```

```shell
tutum nodecluster nodetype
```

Lists all node types of all supported cloud providers. Returns a list of `NodeType` objects.

### Endpoint Type

Available in Tutum's **REST API**

### HTTP Request

`GET /api/v1/nodetype/`

### Query Parameters

Parameter | Description
--------- | -----------
name | Filter by node type name
regions | Filter by region (resource URI)
availability_zones | Filter by availability zone (resource URI)


## Get an individual node type

```python
import tutum

nodetype = tutum.NodeType.fetch("digitalocean/1gb")
```

```go
import "github.com/tutumcloud/go-tutum/tutum"

nodetype, err := tutum.GetNodeType("digitalocean","1gb")

if err != nil {
  log.Println(err)
}

log.Println(nodetype)
```

```http
GET /api/v1/nodetype/digitalocean/1gb/ HTTP/1.1
Host: dashboard.tutum.co
Authorization: ApiKey username:apikey
Accept: application/json
```


Get all the details of a specific node type

### Endpoint Type

Available in Tutum's **REST API**

### HTTP Request

`GET /api/v1/nodetype/(provider.name)/(name)/`

### Query Parameters

Parameter | Description
--------- | -----------
name | The name of the node type to retrieve
provider.name | The name of the provider of the node type
