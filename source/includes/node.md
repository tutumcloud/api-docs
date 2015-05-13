# Nodes

## Node

> Example

```json
{
	"cpu": 1,
	"current_num_containers": 4,
	"deployed_datetime": "Tue, 16 Sep 2014 17:01:15 +0000",
	"destroyed_datetime": null,
	"disk": 60,
	"docker_execdriver": "native-0.2",
	"docker_graphdriver": "aufs",
	"docker_version": "1.5.0",
	"external_fqdn": "fc1a5bb9-user.node.tutum.io",
	"last_seen": "Thu, 25 Sep 2014 13:14:44 +0000",
	"memory": 1792,
	"last_metric": {
		"cpu": 1.3278507035616,
		"disk": 462479360,
		"memory": 763170816
	},
	"node_cluster": "/api/v1/nodecluster/d787a4b7-d525-4061-97a0-f423e8f1d229/",
	"node_type": "/api/v1/nodetype/testing-provider/testing-type/",
	"public_ip": "10.45.2.11",
	"region": "/api/v1/region/testing-provider/testing-region/",
	"resource_uri": "/api/v1/node/fc1a5bb9-17f5-4819-b667-8c7cd819e949/",
	"state": "Deployed",
	"tags": [
		{"name": "tag_one"},
		{"name": "tag-two"}
	],
	"uuid": "fc1a5bb9-17f5-4819-b667-8c7cd819e949"
}
```

A node is a virtual machine provided by a cloud provider where containers can be deployed.

### Attributes

Attribute | Description
--------- | -----------
uuid | A unique identifier for the node generated automatically on creation
resource_uri | A unique API endpoint that represents the node
external_fqdn | An automatically generated FQDN for the node. Containers deployed on this node will inherit this FQDN.
state | The state of the node. See the below table for a list of possible states.
node_cluster | The resouce URI of the node cluster to which this node belongs to (if applicable)
node_type | The resource URI of the node type used for the node
region | The resource URI of the region where the node is deployed
docker_execdriver | Docker's execution driver used in the node
docker_graphdriver | Docker's storage driver used in the node
docker_version | Docker's version used in the node
cpu | Node number of CPUs
disk | Node storage size in GB
memory | Node memory in MB
last_metric | Last reported metric from the node (see table `Node Last Metric attributes` below for more information)
current_num_containers | The actual number of containers deployed in this node
last_seen | Date and time of the last time the node was contacted by Tutum
public_ip | The public IP allocated to the node
deployed_datetime | The date and time when this node cluster was deployed
destroyed_datetime | The date and time when this node cluster was terminated (if applicable)
tags | List of tags to identify the node when deploying services (see [Tags](https://support.tutum.co/support/solutions/articles/5000508859) for more information)


### Node states

State | Description
----- | -----------
Init | The node has been created and has not been deployed yet. Possible actions in this state: `deploy`, `terminate`.
Deploying | The node is being deployed in the cloud provider. No actions allowed in this state.
Provisioning | Our agent is being installed and configured on the node. No actions allowed in this state.
Deployed | The node is deployed and provisioned and is ready to deploy containers. Possible actions in this state: `terminate`.
Terminating | The node is being terminated in the cloud provider. No actions allowed in this state.
Terminated | The node has been terminated and is no longer present in the cloud provider. No actions allowed in this state.

### Node Last Metric attributes

Attribute | Description
--------- | -----------
cpu       | CPU percentage usage
memory    | Memory usage in bytes
disk      | Disk storage usage in bytes


## List all nodes

```python
import tutum

nodes = tutum.Node.list()
```

```go
import "github.com/tutumcloud/go-tutum/tutum"

nodeList, err := tutum.ListNodes()

if err != nil {
  log.Println(err)
}

log.Println(nodeList)
```

```http
GET /api/v1/node/ HTTP/1.1
Host: dashboard.tutum.co
Authorization: ApiKey username:apikey
Accept: application/json
```

```shell
tutum node list
```

Lists all current and recently terminated nodes. Returns a list of `Node` objects.

### Endpoint Type

Available in Tutum's **REST API**

### HTTP Request

`GET /api/v1/node/`

### Query Parameters

Parameter | Description
--------- | -----------
state | Filter by state. Possible values: `Init`, `Deploying`, `Provisioning`, `Deployed`, `Terminating`, `Terminated`
node_cluster | Filter by node cluster (resource URI)
node_type | Filter by node type (resource URI)
region | Filter by region (resource URI)



## Get an existing node

```python
import tutum

node = tutum.Node.fetch("7eaf7fff-882c-4f3d-9a8f-a22317ac00ce")
```

```go
import "github.com/tutumcloud/go-tutum/tutum"

node, err := tutum.GetNode("7eaf7fff-882c-4f3d-9a8f-a22317ac00ce")

if err != nil {
  log.Println(err)
}

log.Println(node)
```

```http
GET /api/v1/node/7eaf7fff-882c-4f3d-9a8f-a22317ac00ce/ HTTP/1.1
Host: dashboard.tutum.co
Authorization: ApiKey username:apikey
Accept: application/json
```

```shell
tutum node inspect 7eaf7fff
```

Get all the details of an specific node

### Endpoint Type

Available in Tutum's **REST API**

### HTTP Request

`GET /api/v1/node/(uuid)/`

### Query Parameters

Parameter | Description
--------- | -----------
uuid | The UUID of the node to retrieve


## Update a node

```python
import tutum

node = tutum.Node.fetch("7eaf7fff-882c-4f3d-9a8f-a22317ac00ce")
node.tags.add(["tag-1"])
node.save()
```

```go
import "github.com/tutumcloud/go-tutum/tutum"

node, err := tutum.GetNode("7eaf7fff-882c-4f3d-9a8f-a22317ac00ce")

if err != nil {
	log.Println(err)
}

if err = node.Update(`{"tags": [{"name": "tag-1"}]}`); err != nil {
			log.Println(err)
}
```

```http
PATCH /api/v1/node/7eaf7fff-882c-4f3d-9a8f-a22317ac00ce/ HTTP/1.1
Host: dashboard.tutum.co
Authorization: ApiKey username:apikey
Accept: application/json

{"tags": [{"name": "tag-1"}]}
```

```shell
tutum tag add -t tag-1 7eaf7fff
tutum tag set -t tag-2 7eaf7fff
```

Replaces the old tags in the node for the new list provided.

### Endpoint Type

Available in Tutum's **REST API**

### HTTP Request

`PATCH /api/v1/node/(uuid)/`

### Query Parameters

Parameter | Description
--------- | -----------
uuid | The UUID of the node to retrieve

### JSON Parameters

Parameter | Description
--------- | -----------
tags | (optional) List of tags the node will have. This operation replaces the tag list.


## Upgrade Docker Daemon

```python
import tutum

node = tutum.Node.fetch("7eaf7fff-882c-4f3d-9a8f-a22317ac00ce")
node.upgrade_docker()
```

```go
import "github.com/tutumcloud/go-tutum/tutum"

node, err := tutum.GetNode("7eaf7fff-882c-4f3d-9a8f-a22317ac00ce")

if err != nil {
  log.Println(err)
}

if err = node.Upgrade(); err != nil {
       log.Println(err)
   }
```

```http
POST /api/v1/node/7eaf7fff-882c-4f3d-9a8f-a22317ac00ce/docker-upgrade/ HTTP/1.1
Host: dashboard.tutum.co
Authorization: ApiKey username:apikey
Accept: application/json
```

```shell
tutum node upgrade 7eaf7fff
```

Upgrades the docker daemon of the node. This will restart your containers on that node. See [Docker upgrade](https://support.tutum.co/support/solutions/articles/5000515535) for more information.

### Endpoint Type

Available in Tutum's **REST API**

### HTTP Request

`POST /api/v1/node/(uuid)/docker-upgrade/`

### Query Parameters

Parameter | Description
--------- | -----------
uuid | The UUID of the node to upgrade


## Terminate a node

```python
import tutum

node = tutum.Node.fetch("7eaf7fff-882c-4f3d-9a8f-a22317ac00ce")
node.delete()
```

```http
DELETE /api/v1/node/7eaf7fff-882c-4f3d-9a8f-a22317ac00ce/ HTTP/1.1
Host: dashboard.tutum.co
Authorization: ApiKey username:apikey
Accept: application/json
```

```go
import "github.com/tutumcloud/go-tutum/tutum"

node, err := tutum.GetNode("7eaf7fff-882c-4f3d-9a8f-a22317ac00ce")

if err != nil {
  log.Println(err)
}

if err = node.Terminate(); err != nil {
   log.Println(err)
}
```

```shell
tutum node rm 7eaf7fff
```

Terminates the specified node. For security reasons, only nodes with no running containers can be terminated, otherwise the API call will fail.

### Endpoint Type

Available in Tutum's **REST API**

### HTTP Request

`DELETE /api/v1/node/(uuid)/`

### Query Parameters

Parameter | Description
--------- | -----------
uuid | The UUID of the node to terminate
