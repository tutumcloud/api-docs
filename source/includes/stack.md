# Stacks

## Stack

> Example

```json
{
  "actions": [
    "/api/v1/action/d7c53af7-b9fb-4f29-a661-bf78b4258bfd/",
    "/api/v1/action/1c2919c5-9371-4b69-baf9-bafbe9679854/"
  ], 
  "deployed_datetime": "Mon, 13 Oct 2014 11:01:43 +0000",
  "destroyed_datetime": null,
  "name": "tutum-app",
  "resource_uri": "/api/v1/stack/7fe7ec85-58be-4904-81da-de2219098d7c/",
  "services": [
    "/api/v1/service/cccd13e5-064d-449a-bf77-541986db5c4a/",
    "/api/v1/service/d612c123-11a6-4e70-8582-585abe2c116b/",
    "/api/v1/service/d5cf4613-99cb-4270-8413-5982acf37031/"
  ],
  "state": "Running",
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
services | List of resource URIs of the servicies belonging to the stack
actions | List of resource URIs of the `Action` objects that apply to the stack
deployed_datetime | The date and time of the last deployment of the stack (if applicable, `null` otherwise)
destroyed_datetime | The date and time of the `terminate` operation on the stack (if applicable, `null` otherwise)


### Stack states

State | Description
----- | -----------
Init | The stack has been created and has no deployed services yet. Possible actions in this state: `deploy`, `terminate`.
Starting | All services for the stack are either starting or already running. No actions allowed in this state.
Running | All services for the service are deployed and running. Possible actions in this state: `redeploy`, `terminate`.
Partly running | One or more services of the stack are deployed and running. Possible actions in this state: `redeploy`, `terminate`.
Stopping | All services for the stack are either stopping or already stopped. No actions allowed in this state.
Stopped | All services for the service are stopped. Possible actions in this state: `start`, `redeploy`, `terminate`.
Redeploying | The stack is redeploying all its services with the updated configuration. No actions allowed in this state.
Terminating | All services for the stack are either being terminated or already terminated. No actions allowed in this state.
Terminated | The stack and all its services have been terminated. No actions allowed in this state.


## List all stacks

```http
GET /api/v1/stack/ HTTP/1.1
Host: dashboard.tutum.co
Authorization: ApiKey username:apikey
Accept: application/json
```

Lists all current and recently terminated stacks. Returns a list of `Stack` objects.

### HTTP Request

`GET /api/v1/stack/`

### Query Parameters

Parameter | Description
--------- | ----------- 
name | Filter by stack name


## Create a new stack

```http
POST /api/v1/stack/ HTTP/1.1
Host: dashboard.tutum.co
Authorization: ApiKey username:apikey
Accept: application/json
Content-Type: application/json

{"name": "my-new-stack", "services": [{"name": "hello-word", "image": "tutum/hello-world", "target_num_containers": 2}]}
```

Creates a new stack without deploying it.

### HTTP Request

`POST /api/v1/stack/`

### JSON Parameters

Parameter | Description
--------- | ----------- 
name | (required) A human-readable name for the stack, i.e. `my-hello-world-stack`
services | (optional) List of services belonging to the stack. Each service accepts the same parameters as a [Create new service](#create-a-new-service) operation (default: `[]`)



## Get an existing stack

```http
GET /api/v1/stack/46aca402-2109-4a70-a378-760cfed43816/ HTTP/1.1
Host: dashboard.tutum.co
Authorization: ApiKey username:apikey
Accept: application/json
```

Get all the details of an specific stack

### HTTP Request

`GET /api/v1/stack/(uuid)/`

### Query Parameters

Parameter | Description
--------- | ----------- 
uuid | The UUID of the stack to retrieve


## Update an existing stack

```http
PATCH /api/v1/stack/46aca402-2109-4a70-a378-760cfed43816/ HTTP/1.1
Host: dashboard.tutum.co
Authorization: ApiKey username:apikey
Accept: application/json
Content-Type: application/json

{"services": [{"name": "hello-word", "image": "tutum/hello-world", "target_num_containers": 2}]}
```

Updates the details of every service in the stack.

### HTTP Request

`PATCH /api/v1/stack/(uuid)/`

### Query Parameters

Parameter | Description
--------- | ----------- 
uuid | The UUID of the stack to update


### JSON Parameters

Parameter | Description
--------- | -----------
services | (optional) List of services belonging to the stack. Each service accepts the same parameters as a [Update an existing service](#update-an-existing-service) operation (default: `[]`)



## Redeploy a stack

```http
POST /api/v1/stack/46aca402-2109-4a70-a378-760cfed43816/redeploy/ HTTP/1.1
Host: dashboard.tutum.co
Authorization: ApiKey username:apikey
Accept: application/json
```

Redeploys the services in the stack in order to match the current stack configuration.

### HTTP Request

`POST /api/v1/stack/(uuid)/redeploy/`

### Query Parameters

Parameter | Description
--------- | ----------- 
uuid | The UUID of the stack to redeploy


## Terminate a stack

```http
DELETE /api/v1/stack/46aca402-2109-4a70-a378-760cfed43816/ HTTP/1.1
Host: dashboard.tutum.co
Authorization: ApiKey username:apikey
Accept: application/json
```

Terminate all the services in a the stack and the stack itself.

### HTTP Request

`DELETE /api/v1/stack/(uuid)/`

### Query Parameters

Parameter | Description
--------- | ----------- 
uuid | The UUID of the stack to terminate
