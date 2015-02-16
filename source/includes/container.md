# Containers

## Container

> Example

```json
{
    "autodestroy": "OFF",
    "autorestart": "OFF",
    "bindings": [
        {
            "volume": "/api/v1/volume/1863e34d-6a7d-4945-aefc-8f27a4ab1a9e/",
            "host_path": null,
            "container_path": "/data",
            "rewritable": true
        },
        {
            "volume": null,
            "host_path": "/etc",
            "container_path": "/etc",
            "rewritable": true
        }
    ],
    "container_envvars": [
        {
            "key": "DB_1_ENV_DEBIAN_FRONTEND",
            "value": "noninteractive"
        },
        {
            "key": "DB_1_ENV_MYSQL_PASS",
            "value": "**Random**"
        },
        {
            "key": "DB_1_ENV_MYSQL_USER",
            "value": "admin"
        },
        {
            "key": "DB_1_ENV_PATH",
            "value": "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
        },
        {
            "key": "DB_1_ENV_REPLICATION_MASTER",
            "value": "**False**"
        },
        {
            "key": "DB_1_ENV_REPLICATION_PASS",
            "value": "replica"
        },
        {
            "key": "DB_1_ENV_REPLICATION_SLAVE",
            "value": "**False**"
        },
        {
            "key": "DB_1_ENV_REPLICATION_USER",
            "value": "replica"
        },
        {
            "key": "DB_1_PORT",
            "value": "tcp://172.16.0.3:3306"
        },
        {
            "key": "DB_1_PORT_3306_TCP",
            "value": "tcp://172.16.0.3:3306"
        },
        {
            "key": "DB_1_PORT_3306_TCP_ADDR",
            "value": "172.16.0.3"
        },
        {
            "key": "DB_1_PORT_3306_TCP_PORT",
            "value": "3306"
        },
        {
            "key": "DB_1_PORT_3306_TCP_PROTO",
            "value": "tcp"
        },
        {
            "key": "DB_ENV_DEBIAN_FRONTEND",
            "value": "noninteractive"
        },
        {
            "key": "DB_ENV_MYSQL_PASS",
            "value": "**Random**"
        },
        {
            "key": "DB_ENV_MYSQL_USER",
            "value": "admin"
        },
        {
            "key": "DB_ENV_PATH",
            "value": "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
        },
        {
            "key": "DB_ENV_REPLICATION_MASTER",
            "value": "**False**"
        },
        {
            "key": "DB_ENV_REPLICATION_PASS",
            "value": "replica"
        },
        {
            "key": "DB_ENV_REPLICATION_SLAVE",
            "value": "**False**"
        },
        {
            "key": "DB_ENV_REPLICATION_USER",
            "value": "replica"
        },
        {
            "key": "DB_PASS",
            "value": "szVaPz925B7I"
        },
        {
            "key": "DB_PORT",
            "value": "tcp://172.16.0.3:3306"
        },
        {
            "key": "DB_PORT_3306_TCP",
            "value": "tcp://172.16.0.3:3306"
        },
        {
            "key": "DB_PORT_3306_TCP_ADDR",
            "value": "172.16.0.3"
        },
        {
            "key": "DB_PORT_3306_TCP_PORT",
            "value": "3306"
        },
        {
            "key": "DB_PORT_3306_TCP_PROTO",
            "value": "tcp"
        },
        {
            "key": "DB_TUTUM_API_URL",
            "value": "https://app-test.tutum.co/api/v1/service/c0fed1dc-c528-40c9-aa4c-dc00672ebcbf/"
        }
    ],
    "container_ports": [
        {
            "endpoint_uri": "http://wordpress-stackable-1.admin.cont.tutum.io:49153/",
            "inner_port": 80,
            "outer_port": 49153,
            "port_name": "http",
            "protocol": "tcp",
            "published": true,
            "uri_protocol": "http"
        }
    ],
    "cpu_shares": 100,
    "deployed_datetime": "Thu, 16 Oct 2014 12:04:08 +0000",
    "destroyed_datetime": null,
    "entrypoint": "",
    "exit_code": null,
    "exit_code_msg": null,
    "image_name": "tutum/wordpress-stackable:latest",
    "image_tag": "/api/v1/image/tutum/wordpress-stackable/tag/latest/",
    "linked_to_container": [
    	{
    		"endpoints": {
    			"3306/tcp": "tcp://172.16.0.3:3306"
    		},
    		"from_container": "/api/v1/container/c1dd4e1e-1356-411c-8613-e15146633640/",
    		"name": "DB_1",
    		"to_container": "/api/v1/container/ba434e1e-1234-411c-8613-e15146633640/"
    	}
    ],
    "link_variables": {
        "WORDPRESS_STACKABLE_1_ENV_DB_HOST": "**LinkMe**",
        "WORDPRESS_STACKABLE_1_ENV_DB_NAME": "wordpress",
        "WORDPRESS_STACKABLE_1_ENV_DB_PASS": "szVaPz925B7I",
        "WORDPRESS_STACKABLE_1_ENV_DB_PORT": "**LinkMe**",
        "WORDPRESS_STACKABLE_1_ENV_DB_USER": "admin",
        "WORDPRESS_STACKABLE_1_ENV_DEBIAN_FRONTEND": "noninteractive",
        "WORDPRESS_STACKABLE_1_ENV_HOME": "/",
        "WORDPRESS_STACKABLE_1_ENV_PATH": "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
        "WORDPRESS_STACKABLE_1_PORT": "tcp://172.16.0.2:80",
        "WORDPRESS_STACKABLE_1_PORT_80_TCP": "tcp://172.16.0.2:80",
        "WORDPRESS_STACKABLE_1_PORT_80_TCP_ADDR": "172.16.0.2",
        "WORDPRESS_STACKABLE_1_PORT_80_TCP_PORT": "80",
        "WORDPRESS_STACKABLE_1_PORT_80_TCP_PROTO": "tcp",
        "WORDPRESS_STACKABLE_ENV_DB_HOST": "**LinkMe**",
        "WORDPRESS_STACKABLE_ENV_DB_NAME": "wordpress",
        "WORDPRESS_STACKABLE_ENV_DB_PASS": "szVaPz925B7I",
        "WORDPRESS_STACKABLE_ENV_DB_PORT": "**LinkMe**",
        "WORDPRESS_STACKABLE_ENV_DB_USER": "admin",
        "WORDPRESS_STACKABLE_ENV_DEBIAN_FRONTEND": "noninteractive",
        "WORDPRESS_STACKABLE_ENV_HOME": "/",
        "WORDPRESS_STACKABLE_ENV_PATH": "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
        "WORDPRESS_STACKABLE_PORT": "tcp://172.16.0.2:80",
        "WORDPRESS_STACKABLE_PORT_80_TCP": "tcp://172.16.0.2:80",
        "WORDPRESS_STACKABLE_PORT_80_TCP_ADDR": "172.16.0.2",
        "WORDPRESS_STACKABLE_PORT_80_TCP_PORT": "80",
        "WORDPRESS_STACKABLE_PORT_80_TCP_PROTO": "tcp"
    },
    "memory": 1024,
    "name": "wordpress-stackable",
    "node": "/api/v1/node/9691c44e-3155-4ca2-958d-c9571aac0a14/",
    "private_ip": "10.7.0.1",
    "privileged": false,
    "public_dns": "wordpress-stackable-1.admin.cont.tutum.io",
    "resource_uri": "/api/v1/container/c1dd4e1e-1356-411c-8613-e15146633640/",
    "roles": ["global"],
    "run_command": "/run-wordpress.sh",
    "service": "/api/v1/service/adeebc1b-1b81-4af0-b8f2-cefffc69d7fb/",
    "started_datetime": "Thu, 16 Oct 2014 12:04:08 +0000",
    "state": "Running",
    "stopped_datetime": null,
    "uuid": "c1dd4e1e-1356-411c-8613-e15146633640"
}
```


A container is a representation of a Docker container in a node.

### Attributes

Attribute | Description
--------- | -----------
uuid | A unique identifier for the container generated automatically on creation
resource_uri | A unique API endpoint that represents the container
image_name | The Docker image name and tag of the container
image_tag | Resource URI of the image (including tag) of the container
bindings | A list of volume bindings that the container has mounted (see table `Container Binding attributes` below)
name | A user provided name for the container (inherited from the service)
node | The resource URI of the node where this container is running
service | The resource URI of the service which this container is part of
public_dns | The external FQDN of the container
state | The state of the container (see table `Container states` below)
exit_code | The numeric exit code of the container (if applicable, `null` otherwise)
exit_code_msg | A string representation of the exit code of the container (if applicable, `null` otherwise)
deployed_datetime | The date and time of the last deployment of the container (if applicable, `null` otherwise)
started_datetime | The date and time of the last `start` operation on the container (if applicable, `null` otherwise)
stopped_datetime | The date and time of the last `stop` operation on the container (if applicable, `null` otherwise)
destroyed_datetime | The date and time of the `terminate` operation on the container (if applicable, `null` otherwise)
container_ports | List of published ports of this container (see table `Container Port attributes` below)
container_envvars | List of user-defined environment variables set on the containers of the service, which will override the container environment variables (see table `Container Environment Variable attributes` below)
entrypoint | Entrypoint used on the container on launch
run_command | Run command used on the container on launch
cpu_shares | The relative CPU priority of the container (see [Runtime Constraints on CPU and Memory](https://docs.docker.com/reference/run/#runtime-constraints-on-cpu-and-memory) for more information)
memory | The memory limit of the container in MB (see [Runtime Constraints on CPU and Memory](https://docs.docker.com/reference/run/#runtime-constraints-on-cpu-and-memory) for more information)
autorestart | Whether to restart the container automatically if it stops (see [Crash recovery](https://support.tutum.co/support/solutions/articles/5000012174-crash) for more information)
autodestroy | Whether to terminate the container automatically if it stops (see [Autodestroy](https://support.tutum.co/support/solutions/articles/5000012175-) for more information)
roles | List of Tutum roles asigned to this container (see [API roles](https://support.tutum.co/support/solutions/articles/5000524639) for more information))
linked_to_container | List of IP addresses of the linked containers (see table `Container Link attributes` below and [Service links](https://support.tutum.co/support/solutions/articles/5000012181) for more information)
link_variables | List of environment variables that would be exposed in any container that is linked to this one
privileged | Whether the container has Docker's `privileged` flag set or not (see [Runtime privilege](https://docs.docker.com/reference/run/#runtime-privilege-linux-capabilities-and-lxc-configuration) for more information)
private_ip | IP address of the container on the overlay network. This IP will be reachable from any other container.


### Container Binding attributes

Attribute | Description
--------- | -----------
host_path | The host path of the volume
container_path | The container path where the volume is mounted
rewritable | `true` is the volume has writable permissions
volume | The resource URI of the volume


### Container Port attributes

Attribute | Description
--------- | -----------
protocol | The protocol of the port, either `tcp` or `udp`
inner_port | The published port number inside the container
outer_port | The published port number in the node public network interface
port_name | Name of the service associated to this port
uri_protocol | The protocol to be used in the endpoint for this port (i.e. `http`)
endpoint_uri | The URI of the endpoint for this port
published | Whether the port has been published in the host public network interface or not. Non-published ports can only be accessed via links.


### Container Environment Variable attributes

Attribute | Description
--------- | -----------
key | The name of the environment variable
value | The value of the environment variable


### Container States

State | Description
----- | -----------
Init | The container object has been created but hasn't being deployed yet. Possible actions in this state: `start`, `terminate`.
Starting | The container is being deployed (from Init) or started (from Stopped). No actions allowed in this state.
Running | The container is deployed and running. Possible actions in this state: `stop`, `terminate`.
Stopping | The container is being stopped. No actions allowed in this state.
Stopped | The container is stopped. Possible actions in this state: `start`, `terminate`.
Terminating | The container is being deleted. No actions allowed in this state.
Terminated | The container has been deleted. No actions allowed in this state.


### Container Link attributes

Attribute | Description
--------- | -----------
name | The name given to the link
from_container | The resource URI of the "client" container
to_container | The resource URI of the "server" container being linked
endpoints | A dictionary with the endpoints (protocol, IP and port) to be used to reach each of the "server" container exposed ports


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

```shell
tutum container ps
```

Lists all current and recently terminated containers. Returns a list of `Container` objects.

### HTTP Request

`GET /api/v1/container/`

### Query Parameters

Parameter | Description
--------- | ----------- 
state | Filter by state. Possible values: `Init`, `Starting`, `Running`, `Stopping`, `Stopped`, `Terminating`, `Terminated`
name | Filter by container name



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

```shell
tutum container inspect 7eaf7fff
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

```shell
tutum container logs 7eaf7fff
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

```shell
tutum container start 7eaf7fff
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

```shell
tutum container stop 7eaf7fff
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

```shell
tutum container terminate 7eaf7fff
```

Terminates the specified container. This is not reversible. All data stored in the container will be permanently deleted.

### HTTP Request

`DELETE /api/v1/container/(uuid)/`

### Query Parameters

Parameter | Description
--------- | ----------- 
uuid | The UUID of the container to terminate



