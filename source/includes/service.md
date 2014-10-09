# Services

## Service

> Example (coming soon)


A service is a template used to deploy one or more containers.

### Attributes

Attribute | Description
--------- | -----------
uuid | A unique identifier for the service generated automatically on creation
resource_uri | A unique API endpoint that represents the service
image_name | The Docker image name and tag used for the service containers
image_tag | Resource URI of the image (including tag) used for the service containers
name | A user provided name for the service. This name will be inherited by the service containers and will be used in endpoint URLs, environment variable names, etc.
unique_name | A unique name automatically assigned based on the user provided name to be used in the endpoint URLs, environment variable names, etc.
state | The state of the service.
target_num_containers | The requested number of containers to deploy for the service
current_num_containers | The actual number of containers deployed for the service


### Service states

State | Description
----- | -----------
Init | The service has been created and has no deployed containers yet. Possible actions in this state: `start`, `terminate`.
Starting | All containers for the service are either starting or already running. No actions allowed in this state.
Running | All containers for the service are deployed and running. Possible actions in this state: `stop`, `redeploy`, `terminate`.
Partly running | One or more containers of the service are deployed and running. Possible actions in this state: `stop`, `redeploy`, `terminate`.
Scaling | The service is either deploying new containers or destroying existing ones responding to a scaling request. No actions allowed in this state.
Redeploying | The service is redeploying all its containers with the updated configuration. No actions allowed in this state.
Stopping | All containers for the service are either stopping or already stopped. No actions allowed in this state.
Stopped | All containers for the service are stopped. Possible actions in this state: `start`, `redeploy`, `terminate`.
Terminating | All containers for the service are either being terminated or already terminated. No actions allowed in this state.
Terminated | The service and all its containers have been terminated. No actions allowed in this state.
Not running | There are no containers to be deployed for this service. Possible actions in this state: `terminate`.


## List all services

```python
import tutum

services = tutum.Service.list()
```

```http
GET /api/v1/service/ HTTP/1.1
Host: dashboard.tutum.co
Authorization: ApiKey username:apikey
Accept: application/json
```

```shell
tutum service ps
```

Lists all current and recently terminated services. Returns a list of `Service` objects.

### HTTP Request

`GET /api/v1/service/`

### Query Parameters

Parameter | Description
--------- | ----------- 
state | Filter by state. Possible values: `Init`, `Starting`, `Running`, `Partly running`, `Scaling`, `Redeploying`, `Stopping`, `Stopped`, `Terminating`, `Terminated`, `Not running`
name | Filter by service name
unique_name | Filter by unique name



## Create a new service

```python
import tutum

service = tutum.Service.create(image="tutum/hello-world", name="my-new-app", target_num_containers=2)
service.save()
```

```http
POST /api/v1/service/ HTTP/1.1
Host: dashboard.tutum.co
Authorization: ApiKey username:apikey
Accept: application/json
Content-Type: application/json

{"image": "tutum/hello-world", "name": "my-new-app", "target_num_containers": 2}
```

```shell
tutum service run -t 2 --name my-new-app tutum/hello-world
```

Creates a new service without deploying it.

### HTTP Request

`POST /api/v1/service/`

### JSON Parameters

Parameter | Description
--------- | ----------- 
image | (required) The image used to deploy this service in docker format, i.e. `tutum/hello-world`
name | (optional) A human-readable name for the service, i.e. `my-hello-world-app` (default: `image` without namespace)
target_num_containers | (optional) The number of containers to run for this service initially (default: 1)
run_command | (optional) The command used to start the containers of this service, i.e. `/run.sh` (default: as defined in the image)
entrypoint | (optional) The command prefix used to start the cluster containers, i.e. `/usr/sbin/sshd` (default: as defined in the image)
container_ports | (optional) An array of objects with port information to be published in the containers for this service, i.e. `[{"protocol": "tcp", "inner_port": 80, "outer_port": 80}]`(default: all ports exposed in the image will be published in random ports)
container_envvars | (optional) An array of objects with environment variables to be set in the service containers on launch, i.e. `[{"key": "DB_PASSWORD", "value": "mypass"}]` (default: as defined in the image, plus any link- or role-generated variables)
linked_to_service | (optional) An array of service resource URIs to link this service to, including the link name, i.e. `[{"to_service": "/api/v1/service/80ff1635-2d56-478d-a97f-9b59c720e513/", "name": "db"}]` (default: no links)
autorestart | (optional) Whether the containers for this service should be restarted if they stop, i.e. `ALWAYS` (default: `OFF`, possible values: `OFF`, `ON_FAILURE`, `ALWAYS`)
autoreplace | (optional) whether the containers should be replaced with a new one if they stop, i.e. `ALWAYS` (default: `OFF`, possible values: `OFF`, `ON_FAILURE`, `ALWAYS`)
autodestroy | (optional) Whether the containers should be terminated if they stop, i.e. `OFF` (default: `OFF`, possible values: `OFF`, `ON_FAILURE`, `ALWAYS`)
sequential_deployment | (optional) Whether the containers should be launched and scaled in sequence, i.e. `true` (default: `false`)
roles | (optional) A list of Tutum API roles to grant the service, i.e. `["global"]` (default: no roles, possible values: `global`)


## Get an existing service

```python
import tutum

service = tutum.Service.fetch("7eaf7fff-882c-4f3d-9a8f-a22317ac00ce")
```

```http
GET /api/v1/service/7eaf7fff-882c-4f3d-9a8f-a22317ac00ce/ HTTP/1.1
Host: dashboard.tutum.co
Authorization: ApiKey username:apikey
Accept: application/json
```

```shell
tutum service inspect 7eaf7fff
```

Get all the details of an specific service

### HTTP Request

`GET /api/v1/service/(uuid)/`

### Query Parameters

Parameter | Description
--------- | ----------- 
uuid | The UUID of the service to retrieve


## Get the logs of a service

```python
import tutum

service = tutum.Service.fetch("7eaf7fff-882c-4f3d-9a8f-a22317ac00ce")
print service.logs
```

```http
GET /api/v1/service/7eaf7fff-882c-4f3d-9a8f-a22317ac00ce/logs/ HTTP/1.1
Host: dashboard.tutum.co
Authorization: ApiKey username:apikey
Accept: application/json
```

```shell
tutum service logs 7eaf7fff
```

Get the aggregated logs of all the containers of the service.

### HTTP Request

`GET /api/v1/service/(uuid)/logs/`

### Query Parameters

Parameter | Description
--------- | ----------- 
uuid | The UUID of the service to retrieve logs



## Update an existing service

```python
import tutum

service = tutum.Service.fetch("7eaf7fff-882c-4f3d-9a8f-a22317ac00ce")
service.target_num_containers = 3
service.save()
```

```http
PATCH /api/v1/service/7eaf7fff-882c-4f3d-9a8f-a22317ac00ce/ HTTP/1.1
Host: dashboard.tutum.co
Authorization: ApiKey username:apikey
Accept: application/json
Content-Type: application/json

{"target_num_containers": 3}
```

```shell
tutum service scale 7eaf7fff 3
```

Updates the service details and redeploys the changes automatically.

### HTTP Request

`PATCH /api/v1/service/(uuid)/`

### Query Parameters

Parameter | Description
--------- | ----------- 
uuid | The UUID of the service to update


### JSON Parameters

Parameter | Description
--------- | -----------
target_num_containers | (optional) The number of containers to scale this service to


## Start a service

```python
import tutum

service = tutum.Service.fetch("7eaf7fff-882c-4f3d-9a8f-a22317ac00ce")
service.start()
```

```http
POST /api/v1/service/7eaf7fff-882c-4f3d-9a8f-a22317ac00ce/start/ HTTP/1.1
Host: dashboard.tutum.co
Authorization: ApiKey username:apikey
Accept: application/json
```

```shell
tutum service start 7eaf7fff
```

Starts all containers in a stopped or partly running service.

### HTTP Request

`POST /api/v1/service/(uuid)/start/`

### Query Parameters

Parameter | Description
--------- | ----------- 
uuid | The UUID of the service to start


## Stop a service

```python
import tutum

service = tutum.Service.fetch("7eaf7fff-882c-4f3d-9a8f-a22317ac00ce")
service.stop()
```

```http
POST /api/v1/service/7eaf7fff-882c-4f3d-9a8f-a22317ac00ce/stop/ HTTP/1.1
Host: dashboard.tutum.co
Authorization: ApiKey username:apikey
Accept: application/json
```

```shell
tutum service stop 7eaf7fff
```

Stops all containers in a running or partly running service.

### HTTP Request

`POST /api/v1/service/(uuid)/stop/`

### Query Parameters

Parameter | Description
--------- | ----------- 
uuid | The UUID of the service to stop


## Redeploy a service

```python
import tutum

service = tutum.Service.fetch("7eaf7fff-882c-4f3d-9a8f-a22317ac00ce")
service.redeploy()
```

```http
POST /api/v1/service/7eaf7fff-882c-4f3d-9a8f-a22317ac00ce/redeploy/ HTTP/1.1
Host: dashboard.tutum.co
Authorization: ApiKey username:apikey
Accept: application/json
```

```shell
tutum service redeploy 7eaf7fff
```

Redeploys all containers in the service with the current service configuration. It uses the latest version of the image tag configured.

### HTTP Request

`POST /api/v1/service/(uuid)/redeploy/`

### Query Parameters

Parameter | Description
--------- | ----------- 
uuid | The UUID of the service to redeploy


## Terminate a service

```python
import tutum

service = tutum.Service.fetch("7eaf7fff-882c-4f3d-9a8f-a22317ac00ce")
service.delete()
```

```http
DELETE /api/v1/service/7eaf7fff-882c-4f3d-9a8f-a22317ac00ce/ HTTP/1.1
Host: dashboard.tutum.co
Authorization: ApiKey username:apikey
Accept: application/json
```

```shell
tutum service terminate 7eaf7fff
```

Terminate all the containers in a service and the service itself. This is not reversible. All the data stored in all containers of the service will be permanently deleted.

### HTTP Request

`DELETE /api/v1/service/(uuid)/`

### Query Parameters

Parameter | Description
--------- | ----------- 
uuid | The UUID of the service to terminate
