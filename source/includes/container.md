# Containers

## Container

> Example (coming soon)


A container is a representation of a Docker container in a node.

### Attributes

Attribute | Description
--------- | -----------
uuid | A unique identifier for the container generated automatically on creation
resource_uri | A unique API endpoint that represents the container
image_name | The Docker image name and tag of the container
image_tag | Resource URI of the image (including tag) of the container
name | A user provided name for the container (inherited from the service)
unique_name | A unique name automatically assigned based on the user provided name
state | The state of the container


### Container states

State | Description
----- | -----------
Init | The container object has been created but hasn't being deployed yet. Possible actions in this state: `start`, `terminate`.
Starting | The container is being deployed (from Init) or started (from Stopped). No actions allowed in this state.
Running | The container is deployed and running. Possible actions in this state: `stop`, `terminate`.
Stopping | The container is being stopped. No actions allowed in this state.
Stopped | The container is stopped. Possible actions in this state: `start`, `terminate`.
Terminating | The container is being deleted. No actions allowed in this state.
Terminated | The container has been deleted. No actions allowed in this state.


## List all containers

```python
import tutum

containers = tutum.Container.list()
```

```http
GET /api/v1/container/ HTTP/1.1
Host: dashboard.tutum.co
Authorization: ApiKey username:apikey
Accept: application/json
```

Lists all current and recently terminated containers. Returns a list of `Container` objects.

### HTTP Request

`GET /api/v1/container/`

### Query Parameters

Parameter | Description
--------- | ----------- 
state | Filter by state. Possible values: `Init`, `Starting`, `Running`, `Stopping`, `Stopped`, `Terminating`, `Terminated`
name | Filter by container name
unique_name | Filter by unique name



## Get an existing container

```python
import tutum

container = tutum.Container.fetch("7eaf7fff-882c-4f3d-9a8f-a22317ac00ce")
```

```http
GET /api/v1/container/7eaf7fff-882c-4f3d-9a8f-a22317ac00ce/ HTTP/1.1
Host: dashboard.tutum.co
Authorization: ApiKey username:apikey
Accept: application/json
```


Get all the details of an specific container

### HTTP Request

`GET /api/v1/container/(uuid)/`

### Query Parameters

Parameter | Description
--------- | ----------- 
uuid | The UUID of the container to retrieve


## Get the logs of a container

```python
import tutum

container = tutum.Container.fetch("7eaf7fff-882c-4f3d-9a8f-a22317ac00ce")
print container.logs
```

```http
GET /api/v1/container/7eaf7fff-882c-4f3d-9a8f-a22317ac00ce/logs/ HTTP/1.1
Host: dashboard.tutum.co
Authorization: ApiKey username:apikey
Accept: application/json
```

Get the logs of the specified container.

### HTTP Request

`GET /api/v1/container/(uuid)/logs/`

### Query Parameters

Parameter | Description
--------- | ----------- 
uuid | The UUID of the container to retrieve logs



## Start a container

```python
import tutum

container = tutum.Container.fetch("7eaf7fff-882c-4f3d-9a8f-a22317ac00ce")
container.start()
```

```http
POST /api/v1/container/7eaf7fff-882c-4f3d-9a8f-a22317ac00ce/start/ HTTP/1.1
Host: dashboard.tutum.co
Authorization: ApiKey username:apikey
Accept: application/json
```

Starts a stopped container.

### HTTP Request

`POST /api/v1/container/(uuid)/start/`

### Query Parameters

Parameter | Description
--------- | ----------- 
uuid | The UUID of the container to start


## Stop a container

```python
import tutum

container = tutum.Container.fetch("7eaf7fff-882c-4f3d-9a8f-a22317ac00ce")
container.stop()
```

```http
POST /api/v1/container/7eaf7fff-882c-4f3d-9a8f-a22317ac00ce/stop/ HTTP/1.1
Host: dashboard.tutum.co
Authorization: ApiKey username:apikey
Accept: application/json
```


Stops a running container.

### HTTP Request

`POST /api/v1/container/(uuid)/stop/`

### Query Parameters

Parameter | Description
--------- | ----------- 
uuid | The UUID of the container to stop



## Terminate a container

```python
import tutum

container = tutum.Container.fetch("7eaf7fff-882c-4f3d-9a8f-a22317ac00ce")
container.delete()
```

```http
DELETE /api/v1/container/7eaf7fff-882c-4f3d-9a8f-a22317ac00ce/ HTTP/1.1
Host: dashboard.tutum.co
Authorization: ApiKey username:apikey
Accept: application/json
```


Terminates the specified container. This is not reversible. All data stored in the container will be permanently deleted.

### HTTP Request

`DELETE /api/v1/container/(uuid)/`

### Query Parameters

Parameter | Description
--------- | ----------- 
uuid | The UUID of the container to terminate



