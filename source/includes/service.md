# Services

## Service

> Example

```json
{
  "actions": [
    "/api/v1/action/ee921c03-0f52-438f-8b7d-7331df2a9c18/", 
    "/api/v1/action/ed4324c3-c3a3-4dad-a780-fc11ad55975d/"
  ], 
  "autodestroy": "OFF", 
  "autoreplace": "OFF", 
  "autorestart": "ON_FAILURE", 
  "container_envvars": [
    {
      "key": "DB_PASS", 
      "value": "test"
    }
  ], 
  "container_ports": [
    {
      "inner_port": 80, 
      "outer_port": 80, 
      "port_name": "http", 
      "protocol": "tcp",
      "published": true
    }
  ], 
  "containers": [
    "/api/v1/container/6f8ee454-9dc3-4387-80c3-57aac1be3cc6/", 
    "/api/v1/container/fdf9c116-7c08-4a60-b0ce-c54ca72c2f25/"
  ], 
  "cpu_shares": 100, 
  "current_num_containers": 2, 
  "deployed_datetime": "Mon, 13 Oct 2014 11:01:43 +0000", 
  "destroyed_datetime": null, 
  "entrypoint": "", 
  "image_name": "tutum/wordpress-stackable:latest", 
  "image_tag": "/api/v1/image/tutum/wordpress-stackable/tag/latest/", 
  "link_variables": {
    "WORDPRESS_STACKABLE_1_ENV_DB_HOST": "**LinkMe**",
    "WORDPRESS_STACKABLE_1_ENV_DB_NAME": "wordpress",
    "WORDPRESS_STACKABLE_1_ENV_DB_PASS": "szVaPz925B7I",
    "WORDPRESS_STACKABLE_1_ENV_DB_PORT": "**LinkMe**",
    "WORDPRESS_STACKABLE_1_ENV_DB_USER": "admin",
    "WORDPRESS_STACKABLE_1_ENV_DEBIAN_FRONTEND": "noninteractive",
    "WORDPRESS_STACKABLE_1_ENV_HOME": "/",
    "WORDPRESS_STACKABLE_1_ENV_PATH": "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
    "WORDPRESS_STACKABLE_1_PORT": "tcp://wordpress-stackable-1.9691c44e-admin.node.staging.tutum.io:49153",
    "WORDPRESS_STACKABLE_1_PORT_80_TCP": "tcp://wordpress-stackable-1.9691c44e-admin.node.staging.tutum.io:49153",
    "WORDPRESS_STACKABLE_1_PORT_80_TCP_ADDR": "wordpress-stackable-1.9691c44e-admin.node.staging.tutum.io",
    "WORDPRESS_STACKABLE_1_PORT_80_TCP_PORT": "49153",
    "WORDPRESS_STACKABLE_1_PORT_80_TCP_PROTO": "tcp",
    "WORDPRESS_STACKABLE_2_ENV_DB_HOST": "**LinkMe**",
    "WORDPRESS_STACKABLE_2_ENV_DB_NAME": "wordpress",
    "WORDPRESS_STACKABLE_2_ENV_DB_PASS": "szVaPz925B7I",
    "WORDPRESS_STACKABLE_2_ENV_DB_PORT": "**LinkMe**",
    "WORDPRESS_STACKABLE_2_ENV_DB_USER": "admin",
    "WORDPRESS_STACKABLE_2_ENV_DEBIAN_FRONTEND": "noninteractive",
    "WORDPRESS_STACKABLE_2_ENV_HOME": "/",
    "WORDPRESS_STACKABLE_2_ENV_PATH": "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
    "WORDPRESS_STACKABLE_2_PORT": "tcp://wordpress-stackable-2.2686cf70-admin.node.staging.tutum.io:49154",
    "WORDPRESS_STACKABLE_2_PORT_80_TCP": "tcp://wordpress-stackable-2.2686cf70-admin.node.staging.tutum.io:49154",
    "WORDPRESS_STACKABLE_2_PORT_80_TCP_ADDR": "wordpress-stackable-2.2686cf70-admin.node.staging.tutum.io",
    "WORDPRESS_STACKABLE_2_PORT_80_TCP_PORT": "49154",
    "WORDPRESS_STACKABLE_2_PORT_80_TCP_PROTO": "tcp",
    "WORDPRESS_STACKABLE_ENV_DB_HOST": "**LinkMe**",
    "WORDPRESS_STACKABLE_ENV_DB_NAME": "wordpress",
    "WORDPRESS_STACKABLE_ENV_DB_PASS": "szVaPz925B7I",
    "WORDPRESS_STACKABLE_ENV_DB_PORT": "**LinkMe**",
    "WORDPRESS_STACKABLE_ENV_DB_USER": "admin",
    "WORDPRESS_STACKABLE_ENV_DEBIAN_FRONTEND": "noninteractive",
    "WORDPRESS_STACKABLE_ENV_HOME": "/",
    "WORDPRESS_STACKABLE_ENV_PATH": "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
    "WORDPRESS_STACKABLE_PORT": "tcp://wordpress-stackable-1.9691c44e-admin.node.staging.tutum.io:49153",
    "WORDPRESS_STACKABLE_PORT_80_TCP": "tcp://wordpress-stackable-1.9691c44e-admin.node.staging.tutum.io:49153",
    "WORDPRESS_STACKABLE_PORT_80_TCP_ADDR": "wordpress-stackable-1.9691c44e-admin.node.staging.tutum.io",
    "WORDPRESS_STACKABLE_PORT_80_TCP_PORT": "49153",
    "WORDPRESS_STACKABLE_PORT_80_TCP_PROTO": "tcp",
    "WORDPRESS_STACKABLE_TUTUM_API_URL": "https://app-test.tutum.co/api/v1/service/adeebc1b-1b81-4af0-b8f2-cefffc69d7fb/"
  },
  "linked_from_service": [], 
  "linked_to_service": [
    {
      "from_service": "/api/v1/service/09cbcf8d-a727-40d9-b420-c8e18b7fa55b/",
      "name": "DB", 
      "to_service": "/api/v1/service/72f175bd-390b-46e3-9463-830aca32ce3e/"
    }
  ], 
  "memory": 2048, 
  "name": "wordpress-stackable", 
  "privileged": false,
  "resource_uri": "/api/v1/service/09cbcf8d-a727-40d9-b420-c8e18b7fa55b/", 
  "roles": ["global"], 
  "run_command": "/run-wordpress.sh", 
  "running_num_containers": 1, 
  "sequential_deployment": false, 
  "started_datetime": "Mon, 13 Oct 2014 11:01:43 +0000", 
  "state": "Partly running", 
  "stopped_datetime": null, 
  "stopped_num_containers": 0, 
  "target_num_containers": 2, 
  "unique_name": "wordpress-stackable", 
  "uuid": "09cbcf8d-a727-40d9-b420-c8e18b7fa55b",
  "tags": [
        {"name": "tag_one"},
        {"name": "tag-two"},
        {"name": "tagthree3"}
  ]
}
```


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
state | The state of the service (see table `Service states` below)
deployed_datetime | The date and time of the last deployment of the service (if applicable, `null` otherwise)
started_datetime | The date and time of the last `start` operation on the service (if applicable, `null` otherwise)
stopped_datetime | The date and time of the last `stop` operation on the service (if applicable, `null` otherwise)
destroyed_datetime | The date and time of the `terminate` operation on the service (if applicable, `null` otherwise)
target_num_containers | The requested number of containers to deploy for the service
current_num_containers | The actual number of containers deployed for the service
running_num_containers | The actual number of containers deployed for the service in `Running` state
stopped_num_containers | The actual number of containers deployed for the service in `Stopped` state
containers | List of resource URIs of the containers launched as part of the service
container_ports | List of ports to be published on the containers of this service (see table `Service Port attributes` below)
container_envvars | List of user-defined environment variables to set on the containers of the service, which will override the image environment variables (see table `Service Environment Variable attributes` below)
entrypoint | Entrypoint to be set on the containers launched as part of the service, which will override the image entrypoint
run_command | Run command to be set on the containers launched as part of the service, which will override the image run command
sequential_deployment | Whether the containers for this service should be deployed in sequence, linking each of them to the previous containers (see [Service scaling](https://support.tutum.co/support/solutions/articles/5000012179-service) for more information)
cpu_shares | The relative CPU priority of the containers of the service (see [Runtime Constraints on CPU and Memory](https://docs.docker.com/reference/run/#runtime-constraints-on-cpu-and-memory) for more information)
memory | The memory limit of the containers of the service in MB (see [Runtime Constraints on CPU and Memory](https://docs.docker.com/reference/run/#runtime-constraints-on-cpu-and-memory) for more information)
linked_from_service | A list of services that are linked to this one (see table `Related services attributes` below)
linked_to_service | A list of services that the service is linked to (see table `Related services attributes` below)
autorestart | Whether to restart the containers of the service automatically if they stop (see [Crash recovery](https://support.tutum.co/support/solutions/articles/5000012174-crash) for more information)
autoreplace | Whether to replace the containers of the service automatically with new ones if they stop (see [Crash recovery](https://support.tutum.co/support/solutions/articles/5000012174-crash) for more information)
autodestroy | Whether to terminate the containers of the service automatically if they stop (see [Autodestroy](https://support.tutum.co/support/solutions/articles/5000012175-) for more information)
roles | List of Tutum roles asigned to this service (see [Service links](https://support.tutum.co/support/solutions/articles/5000012181-service) for more information)
actions | List of resource URIs of the `Action` objects that apply to the service
link_variables | List of environment variables that would be exposed in the containers if they are linked to this service
privileged | Whether to start the containers with Docker's `privileged` flag set or not, which allows containers to access all devices on the host among other things (see [Runtime privilege](https://docs.docker.com/reference/run/#runtime-privilege-linux-capabilities-and-lxc-configuration) for more information)
tags | List of labels to manage the service [(see Tags section for more information)](tags.md)


### Service Port attributes

Attribute | Description
--------- | -----------
protocol | The protocol of the port, either `tcp` or `udp`
inner_port | The published port number inside the container
outer_port | The published port number in the node public network interface
port_name | Name of the service associated to this port
published | Whether the port has been published in the host public network interface or not. Non-published ports can only be accessed via links.


### Service Environment Variable attributes

Attribute | Description
--------- | -----------
key | The name of the environment variable
value | The value of the environment variable


### Related services attributes

Attribute | Description
--------- | -----------
name | The link name
from_service | The resource URI of the origin of the link
to_service | The resource URI of the target of the link


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
tutum service create -t 2 --name my-new-app tutum/hello-world
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
run_command | (optional) The command used to start the containers of this service, overriding the value specified in the image, i.e. `/run.sh` (default: `null`)
entrypoint | (optional) The command prefix used to start the containers of this service, overriding the value specified in the image, i.e. `/usr/sbin/sshd` (default: `null`)
container_ports | (optional) An array of objects with port information to be published in the containers for this service, which will be added to the image port information, i.e. `[{"protocol": "tcp", "inner_port": 80, "outer_port": 80}]` (default: `[]`) (See table `Service Port attributes` below)
container_envvars | (optional) An array of objects with environment variables to be added in the service containers on launch (overriding any image-defined environment variables), i.e. `[{"key": "DB_PASSWORD", "value": "mypass"}]` (default: `[]`) (See table `Service Environment Variable attributes` below)
linked_to_service | (optional) An array of service resource URIs to link this service to, including the link name, i.e. `[{"to_service": "/api/v1/service/80ff1635-2d56-478d-a97f-9b59c720e513/", "name": "db"}]` (default: `[]`) (See table `Related services attributes` below)
autorestart | (optional) Whether the containers for this service should be restarted if they stop, i.e. `ALWAYS` (default: `OFF`, possible values: `OFF`, `ON_FAILURE`, `ALWAYS`) (see [Crash recovery](https://support.tutum.co/support/solutions/articles/5000012174-crash) for more information)
autoreplace | (optional) whether the containers should be replaced with a new one if they stop, i.e. `ALWAYS` (default: `OFF`, possible values: `OFF`, `ON_FAILURE`, `ALWAYS`) (see [Crash recovery](https://support.tutum.co/support/solutions/articles/5000012174-crash) for more information)
autodestroy | (optional) Whether the containers should be terminated if they stop, i.e. `OFF` (default: `OFF`, possible values: `OFF`, `ON_FAILURE`, `ALWAYS`) (see [Autodestroy](https://support.tutum.co/support/solutions/articles/5000012175-) for more information)
sequential_deployment | (optional) Whether the containers should be launched and scaled in sequence, i.e. `true` (default: `false`) (see [Service scaling](https://support.tutum.co/support/solutions/articles/5000012179-service) for more information)
roles | (optional) A list of Tutum API roles to grant the service, i.e. `["global"]` (default: `[]`, possible values: `global`) (see [Service links](https://support.tutum.co/support/solutions/articles/5000012181-service) for more information)
privileged | (optional) Whether to start the containers with Docker's `privileged` flag set or not, i.e. `false` (default: `false`) (see [Runtime privilege](https://docs.docker.com/reference/run/#runtime-privilege-linux-capabilities-and-lxc-configuration) for more information)
tags | (optional) A list of labels the service will be tagged with [(see Tags section for mor information)](tags.md)


### Service Port attributes

Attribute | Description
--------- | -----------
protocol | (required) The protocol of the port, either `tcp` or `udp`
inner_port | (required) The port number inside the container to be published
outer_port | (optional) The port number in the node public network interface to be published (default: dynamic allocation if `published` is `true`)
published | (optional) Whether to publish the port in the host public network interface or not. Non-published ports can only be accessed via links. (default: `false`)


### Service Environment Variable attributes

Attribute | Description
--------- | -----------
key | (required) The name of the environment variable
value | (required) The value of the environment variable


### Related services attributes

Attribute | Description
--------- | -----------
to_service | (required) The resource URI of the target of the link
name | (optional) The link name


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
tags | (optional) List of new labels the service will have. This operation removes the old ones [(see Tags section for more information)](tags.md).


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
