# Volumes

## Volume

> Example

```json
{
    "containers": [
        "/api/v1/container/55b07a2e-fa72-481f-984b-0e94f275de0b/"
    ],
    "node": "/api/v1/node/fc1a5bb9-17f5-4819-b667-8c7cd819e950/",
    "resource_uri": "/api/v1/volume/1863e34d-6a7d-4945-aefc-8f27a4ab1a9e/",
    "state": "Created",
    "uuid": "1863e34d-6a7d-4945-aefc-8f27a4ab1a9e",
    "volume_group": "/api/v1/volumegroup/2f4f54e5-9d3b-4ac1-85ad-a2d4ff25a173/"
}
```


A volume is a representation of a Docker volume in a node.

### Attributes

Attribute | Description
--------- | -----------
uuid | A unique identifier for the volume generated automatically on creation
resource_uri | A unique API endpoint that represents the volume
node | The resource URI of the node where the volume is
state | The state of the volume (see table `Volume states` below)
containers | List of the resource URIs of the containers using this volume
volume_group | The resource URI of the volume group this volume belongs to


### Volume states

State | Description
----- | -----------
Init | The volume object has been created in the node and it is available
Terminated | The volume has been deleted in the node.


## List all volumes

```http
GET /api/v1/volume/ HTTP/1.1
Host: dashboard.tutum.co
Authorization: ApiKey username:apikey
Accept: application/json
```

Lists all volumes. Returns a list of `Volume` objects.

### HTTP Request

`GET /api/v1/volume/`


## Get an existing volume

```http
GET /api/v1/volume/7eaf7fff-882c-4f3d-9a8f-a22317ac00ce/ HTTP/1.1
Host: dashboard.tutum.co
Authorization: ApiKey username:apikey
Accept: application/json
```

Get all the details of an specific volume

### HTTP Request

`GET /api/v1/volume/(uuid)/`

### Query Parameters

Parameter | Description
--------- | ----------- 
uuid | The UUID of the volume to retrieve
