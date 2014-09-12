# Node Cluster

## Node Cluster

> Example

```json
{
    "actions": [
        "/api/v1/action/61a29874-9134-48f9-b460-f37d4bec4826/",
        "/api/v1/action/c9f69056-5c79-432c-8265-f0e7e48a3a82/",
        "/api/v1/action/cfe03be8-ffbf-4ff2-bb1f-86a7d8925616/",
        "/api/v1/action/4a726c7e-7e6a-409e-8e07-30bdbb03f96e/"
    ],
    "current_num_nodes": 1,
    "deployed_datetime": "Tue, 16 Sep 2014 17:01:15 +0000",
    "destroyed_datetime": null,
    "name": "TestCluster",
    "node_type": "/api/v1/nodetype/digitalocean/512mb/",
    "nodes": [
        "/api/v1/node/75d20367-0948-4f10-8ba4-ffb4d16ed3c6/"
    ],
    "region": "/api/v1/region/digitalocean/ams1/",
    "resource_uri": "/api/v1/nodecluster/5516df0b-721e-4470-b350-741ff22e63a0/",
    "state": "Deployed",
    "target_num_nodes": 2,
    "uuid": "5516df0b-721e-4470-b350-741ff22e63a0"
}
```

A node cluster is a group of nodes that share the same provider, region and/or availability zone, and node type. They are on the same private network.


### Attributes

Attribute | Description
--------- | -----------
uuid | A unique identifier for the node cluster generated automatically on creation
resource_uri | A unique API endpoint that represents the node cluster
name | A user provided name for the node cluster
state | The state of the node cluster. See the below table for a list of possible states.
actions | A list of resource URIs of the `Action` objects applicable to the node cluster
node_type | The resource URI of the node type used for the node cluster
nodes | A list of resource URIs of the `Node` objects on the node cluster
region | The resource URI of the `Region` object where the node cluster is deployed
target_num_nodes | The desired number of nodes for the node cluster
current_num_nodes | The actual number of nodes in the node cluster. This may differ from `target_num_nodes` if the node cluster is being deployed or scaled
deployed_datetime | The date and time when this node cluster was deployed
destroyed_datetime | The date and time when this node cluster was terminated (if applicable)


### Node Cluster states

State | Description
----- | -----------
Init | The node cluster has been created and has no deployed containers yet. Possible actions in this state: `deploy`, `terminate`.
Deploying | All nodes in the cluster are either deployed or being deployed. No actions allowed in this state.
Deployed | All nodes in the cluster are deployed and provisioned. Possible actions in this state: `terminate`.
Partly deployed | One or more nodes of the cluster are deployed and running. Possible actions in this state: `terminate`.
Scaling | The cluster is either deploying new nodes or terminating existing ones responding to a scaling request. No actions allowed in this state.
Terminating | All nodes in the cluster are either being terminated or already terminated. No actions allowed in this state.
Terminated | The node cluster and all its nodes have been terminated. No actions allowed in this state.
Empty cluster | There are no nodes deployed in this cluster. Possible actions in this state: `terminate`.


## List all node clusters

```python
import tutum

nodeclusters = tutum.NodeCluster.list()
```

```shell
curl "https://dashboard.tutum.co/api/v1/nodecluster/"
  -H "Authorization: ApiKey username:apikey"
  -H "Accept: application/json"
```


Lists all current and recently terminated node clusters. Returns a list of `NodeCluster` objects.

### HTTP Request

`GET /api/v1/nodecluster/`

### Query Parameters

Parameter | Description
--------- | ----------- 
state | Filter by state. Possible values: `Init`, `Deploying`, `Deployed`, `Partly deployed`, `Scaling`, `Terminating`, `Terminated`, `Empty cluster`
name | Filter by node cluster name
region | Filter by region (resource URI)
node_type | Filter by node type (resource URI)


## Create a new node cluster

```python
import tutum

region = tutum.Region.fetch("digitalocean/lon1")
node_type = tutum.NodeType.fetch("digitalocean/1gb")
nodecluster = tutum.NodeCluster.create(name="my_cluster", node_type=node_type, region=region)
nodecluster.save()
```

```shell
curl "https://dashboard.tutum.co/api/v1/nodecluster/"
  -X POST
  -H "Authorization: ApiKey username:apikey"
  -H "Content-Type: application/json"
  -d '{"name": "my_cluster", "region": "/api/v1/region/digitalocean/lon1/", "node_type": "/api/v1/nodetype/digitalocean/1gb/"}'
```


Creates a new node cluster without deploying it.

### HTTP Request

`POST /api/v1/nodecluster/`

### JSON Parameters

Parameter | Description
--------- | -----------
name | (required) A user provided name for the node cluster
node_type | (required) The resource URI of the node type to be used for the node cluster
region | (required) The resource URI of the region where the node cluster is to be deployed
target_num_nodes | (optional) The desired number of nodes for the node cluster (default: 1)


## Get an existing node cluster

```python
import tutum

service = tutum.NodeCluster.fetch("7eaf7fff-882c-4f3d-9a8f-a22317ac00ce")
```

```shell
curl "https://dashboard.tutum.co/api/v1/nodecluster/7eaf7fff-882c-4f3d-9a8f-a22317ac00ce/"
  -H "Authorization: ApiKey username:apikey"
  -H "Accept: application/json"
```


Get all the details of an specific node cluster

### HTTP Request

`GET /api/v1/nodecluster/(uuid)/`

### Query Parameters

Parameter | Description
--------- | ----------- 
uuid | The UUID of the node cluster to retrieve


## Update an existing node cluster

```python
import tutum

nodecluster = tutum.NodeCluster.fetch("7eaf7fff-882c-4f3d-9a8f-a22317ac00ce")
nodecluster.target_num_nodes = 3
nodecluster.save()
```

```shell
curl "https://dashboard.tutum.co/api/v1/nodecluster/7eaf7fff-882c-4f3d-9a8f-a22317ac00ce/"
  -X PATCH
  -H "Authorization: ApiKey username:apikey"
  -H "Content-Type: application/json"
  -d '{"target_num_nodes": 3}'
```


Updates the node cluster details and applies the changes automatically.

### HTTP Request

`PATCH /api/v1/nodecluster/(uuid)/`

### Query Parameters

Parameter | Description
--------- | ----------- 
uuid | The UUID of the node cluster to update


### JSON Parameters

Parameter | Description
--------- | -----------
target_num_nodes | (optional) The number of nodes to scale this node cluster to


## Terminate a node cluster

```python
import tutum

nodecluster = tutum.NodeCluster.fetch("7eaf7fff-882c-4f3d-9a8f-a22317ac00ce")
nodecluster.delete()
```

```shell
curl "https://dashboard.tutum.co/api/v1/nodecluster/7eaf7fff-882c-4f3d-9a8f-a22317ac00ce/"
  -X DELETE
  -H "Authorization: ApiKey username:apikey"
```

Terminates all the nodes in a node cluster and the node cluster itself. This is not reversible.

### HTTP Request

`DELETE /api/v1/nodecluster/(uuid)/`

### Query Parameters

Parameter | Description
--------- | ----------- 
uuid | The UUID of the node cluster to terminate
