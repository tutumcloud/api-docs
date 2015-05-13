# Stacks

## Stack

> Example

```json
{
  "deployed_datetime": "Mon, 13 Oct 2014 11:01:43 +0000",
  "destroyed_datetime": null,
  "name": "tutum-app",
  "resource_uri": "/api/v1/stack/7fe7ec85-58be-4904-81da-de2219098d7c/",
  "services": [
    {
      "autodestroy": "OFF",
      "autorestart": "ON_FAILURE",
      "bindings": [],
      "container_envvars": [],
      "container_ports": [],
      "containers": [
        "/api/v1/container/6f8ee454-9dc3-4387-80c3-57aac1be3cc6/",
        "/api/v1/container/fdf9c116-7c08-4a60-b0ce-c54ca72c2f25/"
      ],
      "cpu_shares": 100,
      "current_num_containers": 2,
      "deployed_datetime": "Mon, 13 Oct 2014 11:01:43 +0000",
      "deployment_strategy": "EMPTIEST_NODE",
      "destroyed_datetime": null,
      "entrypoint": "",
      "image_name": "tutum/wordpress-stackable:latest",
      "image_tag": "/api/v1/image/tutum/wordpress-stackable/tag/latest/",
      "link_variables": {},
      "linked_from_service": [],
      "linked_to_service": [],
      "memory": 2048,
      "name": "wordpress-stackable",
      "privileged": false,
      "public_dns": "wordpress-stackable.admin.svc.tutum.io",
      "resource_uri": "/api/v1/service/09cbcf8d-a727-40d9-b420-c8e18b7fa55b/",
      "roles": ["global"],
      "run_command": "/run-wordpress.sh",
      "running_num_containers": 1,
      "sequential_deployment": false,
      "started_datetime": "Mon, 13 Oct 2014 11:01:43 +0000",
      "state": "Partly running",
      "stack": "/api/v1/stack/46aca402-2109-4a70-a378-760cfed43816/",
      "stopped_datetime": null,
      "stopped_num_containers": 0,
      "synchronized": true,
      "tags": [],
      "target_num_containers": 2,
      "uuid": "09cbcf8d-a727-40d9-b420-c8e18b7fa55b"
    }
  ],
  "state": "Running",
  "synchronized": true,
  "uuid": "09cbcf8d-a727-40d9-b420-c8e18b7fa55b"
}
```

A stack is a close related group of services.

### Attributes

Attribute | Description
--------- | -----------
uuid | A unique identifier for the stack generated automatically on creation
resource_uri | A unique API endpoint that represents the stack
name | A user provided name for the stack.
state | The state of the stack (see table `Stack states` below)
synchronized | Flag indicating if the current stack definition is synchronized with their services.
services | List of servicies belonging to the stack (the full json of each service)
deployed_datetime | The date and time of the last deployment of the stack (if applicable, `null` otherwise)
destroyed_datetime | The date and time of the `terminate` operation on the stack (if applicable, `null` otherwise)


### Stack states

State | Description
----- | -----------
Not Running | The stack has been created and has no deployed services yet. Possible actions in this state: `start`, `terminate`.
Starting | All services for the stack are either starting or already running. No actions allowed in this state.
Running | All services for the service are deployed and running. Possible actions in this state: `redeploy`, `terminate`.
Partly running | One or more services of the stack are deployed and running. Possible actions in this state: `redeploy`, `terminate`.
Stopping | All services for the stack are either stopping or already stopped. No actions allowed in this state.
Stopped | All services for the service are stopped. Possible actions in this state: `start`, `redeploy`, `terminate`.
Redeploying | The stack is redeploying all its services with the updated configuration. No actions allowed in this state.
Terminating | All services for the stack are either being terminated or already terminated. No actions allowed in this state.
Terminated | The stack and all its services have been terminated. No actions allowed in this state.


## List all stacks

```python
import tutum

stacks = tutum.Stack.list()
```

```go
import "github.com/tutumcloud/go-tutum/tutum"

stackList, err := tutum.ListStacks()

if err != nil {
  log.Println(err)
}

log.Println(stackList)
```

```http
GET /api/v1/stack/ HTTP/1.1
Host: dashboard.tutum.co
Authorization: ApiKey username:apikey
Accept: application/json
```

```shell
tutum stack list
```

Lists all current and recently terminated stacks. Returns a list of `Stack` objects.

### Endpoint Type

Available in Tutum's **REST API**

### HTTP Request

`GET /api/v1/stack/`

### Query Parameters

Parameter | Description
--------- | -----------
name | Filter by stack name


## Create a new stack

```python
import tutum

stack = tutum.Stack.create(name="my-new-stack", services=[{"name": "hello-word", "image": "tutum/hello-world", "target_num_containers": 2}])
stack.save()
```
```go
import "github.com/tutumcloud/go-tutum/tutum"

stack, err := tutum.CreateStack(`{
    "name": "my-new-stack",
    "services": [
        {
            "name": "hello-word",
            "image": "tutum/hello-world",
            "target_num_containers": 2,
            "linked_to_service": [
                {
                    "to_service": "database",
                    "name": "DB"
                }
            ]
        },
        {
            "name": "database",
            "image": "tutum/mysql"
        }
    ]
}`)

if err != nil {
  log.Println(err)
}

log.Println(stack)
```

```http
POST /api/v1/stack/ HTTP/1.1
Host: dashboard.tutum.co
Authorization: ApiKey username:apikey
Accept: application/json
Content-Type: application/json

{
    "name": "my-new-stack",
    "services": [
        {
            "name": "hello-word",
            "image": "tutum/hello-world",
            "target_num_containers": 2,
            "linked_to_service": [
                {
                    "to_service": "database",
                    "name": "DB"
                }
            ]
        },
        {
            "name": "database",
            "image": "tutum/mysql"
        }
    ]
}
```

```shell
tutum stack create --name hello-world -f tutum.yml
```

Creates a new stack without starting it. Note that the JSON syntax is abstracted by both, the Tutum CLI and our UI, in order to use [Stack YAML files](https://support.tutum.co/support/solutions/articles/5000583471).

### Endpoint Type

Available in Tutum's **REST API**

### HTTP Request

`POST /api/v1/stack/`

### JSON Parameters

Parameter | Description
--------- | -----------
name | (required) A human-readable name for the stack, i.e. `my-hello-world-stack`
services | (optional) List of services belonging to the stack. Each service accepts the same parameters as a [Create new service](#create-a-new-service) operation (default: `[]`) plus the ability to refer "links" and "volumes-from" by the name of another service in the stack (see example).



## Export an existing stack

```go
import "github.com/tutumcloud/go-tutum/tutum"

stack, err := tutum.GetStack("46aca402-2109-4a70-a378-760cfed43816")

if err != nil {
  log.Println(err)
}

if err = stack.Export(); err != nil {
   log.Println(err)
}
```

```http
GET /api/v1/stack/46aca402-2109-4a70-a378-760cfed43816/export/ HTTP/1.1
Host: dashboard.tutum.co
Authorization: ApiKey username:apikey
Accept: application/json
```

Get a JSON representation of the stack following the [Stack YAML representation](https://support.tutum.co/support/solutions/articles/5000583471).

### Endpoint Type

Available in Tutum's **REST API**

### HTTP Request

`GET /api/v1/stack/(uuid)/export/`

### Query Parameters

Parameter | Description
--------- | -----------
uuid | The UUID of the stack to retrieve



## Get an existing stack

```python
import tutum

stack = tutum.Stack.fetch("46aca402-2109-4a70-a378-760cfed43816")
```

```go
import "github.com/tutumcloud/go-tutum/tutum"

stack, err := tutum.GetStack("46aca402-2109-4a70-a378-760cfed43816")

if err != nil {
  log.Println(err)
}

log.Println(stack)
```

```http
GET /api/v1/stack/46aca402-2109-4a70-a378-760cfed43816/ HTTP/1.1
Host: dashboard.tutum.co
Authorization: ApiKey username:apikey
Accept: application/json
```

```shell
tutum stack inspect 46aca402-2109-4a70-a378-760cfed43816
```

Get all the details of an specific stack

### Endpoint Type

Available in Tutum's **REST API**

### HTTP Request

`GET /api/v1/stack/(uuid)/`

### Query Parameters

Parameter | Description
--------- | -----------
uuid | The UUID of the stack to retrieve



## Update an existing stack

```python
import tutum

stack = tutum.Stack.fetch("46aca402-2109-4a70-a378-760cfed43816")
stack.services = {"services": [{"name": "hello-word", "image": "tutum/hello-world", "target_num_containers": 2}]}
stack.save()
```

```go
import "github.com/tutumcloud/go-tutum/tutum"

stack, err := tutum.GetStack("46aca402-2109-4a70-a378-760cfed43816")

if err != nil {
  log.Println(err)
}

if err = stack.Update(`{"services": [{"name": "hello-word", "image": "tutum/hello-world", "target_num_containers": 2}]}`); err != nil {
   log.Println(err)
}
```

```http
PATCH /api/v1/stack/46aca402-2109-4a70-a378-760cfed43816/ HTTP/1.1
Host: dashboard.tutum.co
Authorization: ApiKey username:apikey
Accept: application/json
Content-Type: application/json

{
    "services": [
        {
            "name": "hello-word",
            "image": "tutum/hello-world",
            "target_num_containers": 3,
            "linked_to_service": [
                {
                    "to_service": "database",
                    "name": "DB"
                }
            ]
        },
        {
            "name": "database",
            "image": "tutum/mysql"
        }
    ]
}
```

```shell
tutum stack update -f tutum.yml 46aca402-2109-4a70-a378-760cfed43816
```

Updates the details of every service in the stack.

### Endpoint Type

Available in Tutum's **REST API**

### HTTP Request

`PATCH /api/v1/stack/(uuid)/`

### Query Parameters

Parameter | Description
--------- | -----------
uuid | The UUID of the stack to update


### JSON Parameters

Parameter | Description
--------- | -----------
services | (optional) List of services belonging to the stack. Each service accepts the same parameters as a [Update an existing service](#update-an-existing-service) operation (default: `[]`) plus the ability to refer "links" and "volumes-from" by the name of another service in the stack (see example).



## Stop a stack

```python
import tutum

stack = tutum.Stack.fetch("46aca402-2109-4a70-a378-760cfed43816")
stack.stop()
```

```go
import "github.com/tutumcloud/go-tutum/tutum"

stack, err := tutum.GetStack("46aca402-2109-4a70-a378-760cfed43816")

if err != nil {
  log.Println(err)
}

if err = stack.Stop(); err != nil {
   log.Println(err)
}
```

```http
POST /api/v1/stack/46aca402-2109-4a70-a378-760cfed43816/stop/ HTTP/1.1
Host: dashboard.tutum.co
Authorization: ApiKey username:apikey
Accept: application/json
```

```shell
tutum stack stop 46aca402-2109-4a70-a378-760cfed43816
```

Stops the services in the stack.

### Endpoint Type

Available in Tutum's **REST API**

### HTTP Request

`POST /api/v1/stack/(uuid)/stop/`

### Query Parameters

Parameter | Description
--------- | -----------
uuid | The UUID of the stack to stop


## Start a stack

```python
import tutum

stack = tutum.Stack.fetch()
stack.start()
```

```go
import "github.com/tutumcloud/go-tutum/tutum"

stack, err := tutum.GetStack("46aca402-2109-4a70-a378-760cfed43816")

if err != nil {
  log.Println(err)
}

if err = stack.Start(); err != nil {
   log.Println(err)
}
```

```http
POST /api/v1/stack/46aca402-2109-4a70-a378-760cfed43816/start/ HTTP/1.1
Host: dashboard.tutum.co
Authorization: ApiKey username:apikey
Accept: application/json
```

```shell
tutum stack start 46aca402-2109-4a70-a378-760cfed43816
```

Starts the services in the stack.

### Endpoint Type

Available in Tutum's **REST API**

### HTTP Request

`POST /api/v1/stack/(uuid)/start/`

### Query Parameters

Parameter | Description
--------- | -----------
uuid | The UUID of the stack to start


## Redeploy a stack

```python
import tutum

stack = tutum.Stack.fetch("46aca402-2109-4a70-a378-760cfed43816")
stack.redeploy()
```

```go
import "github.com/tutumcloud/go-tutum/tutum"

stack, err := tutum.GetStack("46aca402-2109-4a70-a378-760cfed43816")

if err != nil {
  log.Println(err)
}

if err = stack.Redeploy(); err != nil {
   log.Println(err)
}
```

```http
POST /api/v1/stack/46aca402-2109-4a70-a378-760cfed43816/redeploy/ HTTP/1.1
Host: dashboard.tutum.co
Authorization: ApiKey username:apikey
Accept: application/json
```

```shell
tutum stack redeploy 46aca402-2109-4a70-a378-760cfed43816
```

Redeploys all the services in the stack.

### Endpoint Type

Available in Tutum's **REST API**

### HTTP Request

`POST /api/v1/stack/(uuid)/redeploy/`

### Query Parameters

Parameter | Description
--------- | -----------
uuid | The UUID of the stack to redeploy


## Terminate a stack

```python
import tutum

stack = tutum.Stack.fetch("46aca402-2109-4a70-a378-760cfed43816")
stack.terminate()
```

```go
import "github.com/tutumcloud/go-tutum/tutum"

stack, err := tutum.GetStack("46aca402-2109-4a70-a378-760cfed43816")

if err != nil {
  log.Println(err)
}

if err = stack.Terminate(); err != nil {
   log.Println(err)
}
```

```http
DELETE /api/v1/stack/46aca402-2109-4a70-a378-760cfed43816/ HTTP/1.1
Host: dashboard.tutum.co
Authorization: ApiKey username:apikey
Accept: application/json
```

```shell
tutum stack terminate 46aca402-2109-4a70-a378-760cfed43816
```

Terminate all the services in a the stack and the stack itself.

### Endpoint Type

Available in Tutum's **REST API**

### HTTP Request

`DELETE /api/v1/stack/(uuid)/`

### Query Parameters

Parameter | Description
--------- | -----------
uuid | The UUID of the stack to terminate
