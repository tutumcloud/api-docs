# Volume Groups

## Volume Group

> Example

```json
{
    "name": "mysql_etc",
    "resource_uri": "/api/v1/volume/1863e34d-6a7d-4945-aefc-8f27a4ab1a9e/",
    "services": [
        "/api/v1/service/1ddb524a-e7f5-4b68-b99c-50bf7c57602d/"
    ],
    "state": "Created",
    "uuid": "1863e34d-6a7d-4945-aefc-8f27a4ab1a9e",
    "volumes": [
        "/api/v1/volume/1863e34d-6a7d-4945-aefc-8f27a4ab1a9e/"
     ]
}
```


A volume group is a representation of a group of Docker volumes belonging to a service and sharing the same container mount point.

### Attributes

Attribute | Description
--------- | -----------
uuid | A unique identifier for the volume group generated automatically on creation
name | The name of the volume group
resource_uri | A unique API endpoint that represents the volume group
state | The state of the volume group (see table `Volume Group states` below)
services | List of the resource URIs of the services using this volume group
volumes | List of the resource URIs of the volumes belonging to this volume group


### Volume Group states

State | Description
----- | -----------
Created | The volume group object has been created and it is available
Terminated | The volume group and its associated volumes have been deleted


## List all volume groups

```http
GET /api/v1/volumegroup/ HTTP/1.1
Host: dashboard.tutum.co
Authorization: ApiKey username:apikey
Accept: application/json
```

Lists all volume groups. Returns a list of `VolumeGroup` objects.

### HTTP Request

`GET /api/v1/volumegroup/`


## Get an existing volume group

```http
GET /api/v1/volumegroup/7eaf7fff-882c-4f3d-9a8f-a22317ac00ce/ HTTP/1.1
Host: dashboard.tutum.co
Authorization: ApiKey username:apikey
Accept: application/json
```

Get all the details of an specific volume group

### HTTP Request

`GET /api/v1/volumegroup/(uuid)/`

### Query Parameters

Parameter | Description
--------- | ----------- 
uuid | The UUID of the volume group to retrieve
