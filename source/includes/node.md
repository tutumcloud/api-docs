# Nodes

## Node

> Example

```json
{
	"actions": [
		"/api/v1/action/6ed5716b-9bcc-4911-9688-bc7e36988a92/",
		"/api/v1/action/880f0c59-d8b5-4c5d-8563-35627b6bfc65/",
		"/api/v1/action/dac67186-813f-4fc9-984a-e57ac969b5d8/"
	],
	"deployed_datetime": "Tue, 16 Sep 2014 17:01:15 +0000",
	"destroyed_datetime": null,
	"docker_execdriver": "native-0.2",
	"docker_graphdriver": "devicemapper",
	"docker_version": "1.1.2",
	"external_fqdn": "fc1a5bb9-user.node.tutum.io",
	"last_seen": "Thu, 25 Sep 2014 13:14:44 +0000",
	"node_cluster": "/api/v1/nodecluster/d787a4b7-d525-4061-97a0-f423e8f1d229/",
	"node_type": "/api/v1/nodetype/testing-provider/testing-type/",
	"public_ip": "10.45.2.11",
	"region": "/api/v1/region/testing-provider/testing-region/",
	"resource_uri": "/api/v1/node/fc1a5bb9-17f5-4819-b667-8c7cd819e949/",
	"state": "Deployed",
	"uuid": "fc1a5bb9-17f5-4819-b667-8c7cd819e949",
	"tags": [
		{"name": "tag_one"},
		{"name": "tag-two"}
	]
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
actions | A list of resource URIs of the `Action` objects applicable to the node
node_cluster | The resouce URI of the node cluster to which this node belongs to (if applicable)
node_type | The resource URI of the node type used for the node
region | The resource URI of the region where the node is deployed
docker_execdriver | Docker's execution driver used in the node
docker_graphdriver | Docker's storage driver used in the node
docker_version | Docker's version used in the node
last_seen | Date and time of the last time the node was contacted by Tutum
public_ip | The public IP allocated to the node
deployed_datetime | The date and time when this node cluster was deployed
destroyed_datetime | The date and time when this node cluster was terminated (if applicable)
tags | List of labels to manage the node [(see Tags section for more information)](tags.md)


### Node states

State | Description
----- | -----------
Init | The node has been created and has not been deployed yet. Possible actions in this state: `deploy`, `terminate`.
Deploying | The node is being deployed in the cloud provider. No actions allowed in this state.
Provisioning | Our agent is being installed and configured on the node. No actions allowed in this state.
Deployed | The node is deployed and provisioned and is ready to deploy containers. Possible actions in this state: `terminate`.
Terminating | The node is being terminated in the cloud provider. No actions allowed in this state.
Terminated | The node has been terminated and is no longer present in the cloud provider. No actions allowed in this state.


## List all nodes

```python
import tutum

nodes = tutum.Node.list()
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

### HTTP Request

`GET /api/v1/node/(uuid)/`

### Query Parameters

Parameter | Description
--------- | ----------- 
uuid | The UUID of the node to retrieve



## Deploy a node

```python
import tutum

node = tutum.Node.fetch("7eaf7fff-882c-4f3d-9a8f-a22317ac00ce")
node.deploy()
```

```http
POST /api/v1/node/7eaf7fff-882c-4f3d-9a8f-a22317ac00ce/deploy/ HTTP/1.1
Host: dashboard.tutum.co
Authorization: ApiKey username:apikey
Accept: application/json
```

Deploys and provisions a recently created node in the specified region and cloud provider.

### HTTP Request

`POST /api/v1/node/(uuid)/deploy/`

### Query Parameters

Parameter | Description
--------- | ----------- 
uuid | The UUID of the node to deploy


## Edit node tags

```python
*** TODO
```

```http
PATCH /api/v1/node/7eaf7fff-882c-4f3d-9a8f-a22317ac00ce/ HTTP/1.1
Host: dashboard.tutum.co
Authorization: ApiKey username:apikey
Accept: application/json
```

Replaces the old tags in the node for the new list provided.

### HTTP Request

`PATCH /api/v1/node/(uuid)/`

### Query Parameters

Parameter | Description
--------- | ----------- 
uuid | The UUID of the node to retrieve

### JSON Parameters

Parameter | Description
--------- | ----------- 
tags | A list of labels the node will be tagged with [(see Tags section for mor information)](tags.md)


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

```shell
tutum node rm 7eaf7fff
```

Terminates the specified node. For security reasons, only nodes with no running containers can be terminated, otherwise the API call will fail.

### HTTP Request

`DELETE /api/v1/node/(uuid)/`

### Query Parameters

Parameter | Description
--------- | ----------- 
uuid | The UUID of the node to terminate



