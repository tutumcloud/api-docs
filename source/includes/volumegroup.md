# Volume Groups

## Volume Group

> Example

```json
{
    "name": "mysql_etc",
    "resource_uri": "/api/infra/v1/volume/1863e34d-6a7d-4945-aefc-8f27a4ab1a9e/",
    "services": [
        "/api/app/v1/service/1ddb524a-e7f5-4b68-b99c-50bf7c57602d/"
    ],
    "state": "Created",
    "uuid": "1863e34d-6a7d-4945-aefc-8f27a4ab1a9e",
    "volumes": [
        "/api/app/v1/volume/1863e34d-6a7d-4945-aefc-8f27a4ab1a9e/"
     ]
}
```


A volume group is a representation of a group of Docker volumes belonging to a service and sharing the same container mount point.

### Attributes

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

```python
import tutum

volumegroups = tutum.VolumeGroup.list()
```

```http
GET /api/infra/v1/volumegroup/ HTTP/1.1
Host: dashboard.tutum.co
Authorization: Basic dXNlcm5hbWU6YXBpa2V5
Accept: application/json
```

```go
import "github.com/tutumcloud/go-tutum/tutum"

volumeGroupList, err := tutum.ListVolumeGroups()

if err != nil {
  log.Println(err)
}

log.Println(volumeGroupList)
```

```shell
tutum volumegroup list
```

Lists all volume groups. Returns a list of `VolumeGroup` objects.

### Endpoint Type

Available in Tutum's **REST API**

### HTTP Request

`GET /api/infra/v1/volumegroup/`

### Query Parameters

Parameter | Description
--------- | -----------
uuid | Filter by UUID
name | Filter by volume group name
volumes | Filter by resource URI of the target volumes
services | Filter by resource URI of the target services


## Get an existing volume group

```python
import tutum

volumegroup = tutum.VolumeGroup.inspect("7eaf7fff-882c-4f3d-9a8f-a22317ac00ce")
```

```go
import "github.com/tutumcloud/go-tutum/tutum"

volumeGroup, err := tutum.GetVolumeGroup("7eaf7fff-882c-4f3d-9a8f-a22317ac00ce")

if err != nil {
  log.Println(err)
}

log.Println(volumeGroup)
```

```http
GET /api/infra/v1/volumegroup/7eaf7fff-882c-4f3d-9a8f-a22317ac00ce/ HTTP/1.1
Host: dashboard.tutum.co
Authorization: Basic dXNlcm5hbWU6YXBpa2V5
Accept: application/json
```

```shell
tutum volumegroup inspect 7eaf7fff-882c-4f3d-9a8f-a22317ac00ce
```

Get all the details of an specific volume group

### Endpoint Type

Available in Tutum's **REST API**

### HTTP Request

`GET /api/infra/v1/volumegroup/(uuid)/`

### Path Parameters

Parameter | Description
--------- | -----------
uuid | The UUID of the volume group to retrieve
