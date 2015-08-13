# Triggers

## Service triggers

> Example

```json
{
  "url": "/api/v1/service/82d4a246-52d8-468d-903d-9da9ef05ff28/trigger/0224815a-c156-44e4-92d7-997c69354438/call/",
  "operation": "REDEPLOY",
  "name": "docker_trigger",
  "resource_uri": "/api/v1/service/82d4a246-52d8-468d-903d-9da9ef05ff28/trigger/0224815a-c156-44e4-92d7-997c69354438/"
}
```

Triggers are URLs that will start a redeploy of the service whenever a `POST` request is sent to them. They require no authorization headers, so they should be treated as access tokens. Triggers can be revoked if they are leaked or no longer used for security purposes. See [Triggers](https://tutum.freshdesk.com/support/solutions/articles/5000513815) for more information.


### Attributes

Attribute | Description
--------- | -----------
url | Address to be used to call the trigger with a `POST` request
name | A user provided name for the trigger
operation | The operation that the trigger call performs (see table `Operations` below)
resource_uri | A unique API endpoint that represents the trigger


### Operations

Operation | Description
--------- | -----------
REDEPLOY | Performs a `redeploy` service operation.
SCALEUP | Performs a `scale up` service operation.



## List all triggers

```python
import tutum

service = tutum.Service.fetch('61a29874-9134-48f9-b460-f37d4bec4826')
trigger = tutum.Trigger.fetch(service)
trigger.list()
```

```http
GET /api/v1/service/61a29874-9134-48f9-b460-f37d4bec4826/trigger/ HTTP/1.1
Host: dashboard.tutum.co
Authorization: ApiKey username:apikey
Accept: application/json
```

```go
import "github.com/tutumcloud/go-tutum/tutum"

service, err := tutum.GetService("61a29874-9134-48f9-b460-f37d4bec4826")

	if err != nil {
		log.Println(err)
	}

trigger, err := service.ListTriggers()

  if err != nil {
    log.Println(err)
  }

	log.Println(trigger)
```

```shell
tutum trigger list 61a29874-9134-48f9-b460-f37d4bec4826
```

Lists all current triggers the service has associated to. Returns a list of `Service Trigger` objects.

### Endpoint Type

Available in Tutum's **REST API**

### HTTP Request

`GET /api/v1/service/(uuid)/trigger/`

### Path Parameters

Parameter | Description
--------- | -----------
uuid | The UUID of the service the triggers are associated to  


## Create a new trigger

```python
import tutum

service = tutum.Service.fetch('61a29874-9134-48f9-b460-f37d4bec4826')
trigger = tutum.Trigger.fetch(service)
trigger.add(name="mytrigger_name", operation="REDEPLOY")
trigger.save()
```

```go
import "github.com/tutumcloud/go-tutum/tutum"

service, err := tutum.GetService("61a29874-9134-48f9-b460-f37d4bec4826")

if err != nil {
  log.Println(err)
}

trigger, err := service.CreateTrigger(tutum.TriggerCreateRequest{Name: "test-trigger", Operation: "REDEPLOY"})

if err != nil {
  log.Println(err)
}

log.Println(trigger)
```

```http
POST /api/v1/service/61a29874-9134-48f9-b460-f37d4bec4826/trigger/ HTTP/1.1
Host: dashboard.tutum.co
Authorization: ApiKey username:apikey
Accept: application/json
Content-Type: application/json

{"name": "mytrigger_name", "operation": "REDEPLOY"}
```

```shell
tutum trigger create --name mytrigger_name --operation REDEPLOY 61a29874-9134-48f9-b460-f37d4bec4826
```

Creates a new service trigger.

### Endpoint Type

Available in Tutum's **REST API**

### HTTP Request

`POST /api/v1/service/(uuid)/trigger/`

### JSON Parameters

Parameter | Description
--------- | -----------
name      | (optional) A user provided name for the trigger
operation | (optional) The operation to be performed by the trigger (default: "REDEPLOY")

## Get an existing trigger
```python
import tutum

service = tutum.Service.fetch('61a29874-9134-48f9-b460-f37d4bec4826')
trigger = tutum.Trigger.fetch(service)
```


```go
import "github.com/tutumcloud/go-tutum/tutum"

service, err := tutum.GetService("61a29874-9134-48f9-b460-f37d4bec4826")

if err != nil {
  log.Println(err)
}

trigger, err := service.GetTrigger("7eaf7fff-882c-4f3d-9a8f-a22317ac00ce")

if err != nil {
  log.Println(err)
}

log.Println(trigger)
```

```http
GET /api/v1/service/61a29874-9134-48f9-b460-f37d4bec4826/trigger/7eaf7fff-882c-4f3d-9a8f-a22317ac00ce/ HTTP/1.1
Host: dashboard.tutum.co
Authorization: ApiKey username:apikey
Accept: application/json
```

Get all the details of an specific trigger

### Endpoint Type

Available in Tutum's **REST API**

### HTTP Request

`GET /api/v1/service/(uuid)/trigger/(trigger_uuid)/`

### Path Parameters

Parameter | Description
--------- | -----------
uuid | The UUID of the service the triggers are associated to  
trigger_uuid | The UUID of the trigger to retrieve

## Delete a trigger

```python
import tutum

service = tutum.Service.fetch('61a29874-9134-48f9-b460-f37d4bec4826')
trigger = tutum.Trigger.fetch(service)
trigger.delete("7eaf7fff-882c-4f3d-9a8f-a22317ac00ce")
```

```go
import "github.com/tutumcloud/go-tutum/tutum"

service, err := tutum.GetService("61a29874-9134-48f9-b460-f37d4bec4826")

if err != nil {
  log.Println(err)
}

service.DeleteTrigger("7eaf7fff-882c-4f3d-9a8f-a22317ac00ce")
```

```http
DELETE /api/v1/service/61a29874-9134-48f9-b460-f37d4bec4826/trigger/7eaf7fff-882c-4f3d-9a8f-a22317ac00ce/ HTTP/1.1
Host: dashboard.tutum.co
Authorization: ApiKey username:apikey
Accept: application/json
```

```shell
tutum trigger rm 61a29874-9134-48f9-b460-f37d4bec4826 7eaf7fff-882c-4f3d-9a8f-a22317ac00ce
```

Deletes specific trigger. It will be no longer available to be called.

### Endpoint Type

Available in Tutum's **REST API**

### HTTP Request

`DELETE /api/v1/service/(uuid)/trigger/(trigger_uuid)/`

### Path Parameters

Parameter | Description
--------- | -----------
uuid | The UUID of the associated service
trigger_uuid | The UUID of the trigger to delete


## Call a trigger

```python
import tutum

service = tutum.Service.fetch('61a29874-9134-48f9-b460-f37d4bec4826')
trigger = tutum.Trigger.fetch(service)
trigger.call("7eaf7fff-882c-4f3d-9a8f-a22317ac00ce")
```

```go
import "github.com/tutumcloud/go-tutum/tutum"

service, err := tutum.GetService("61a29874-9134-48f9-b460-f37d4bec4826")

if err != nil {
  log.Println(err)
}

service.CallTrigger("7eaf7fff-882c-4f3d-9a8f-a22317ac00ce")
```

```http
POST /api/v1/service/61a29874-9134-48f9-b460-f37d4bec4826/trigger/7eaf7fff-882c-4f3d-9a8f-a22317ac00ce/call/ HTTP/1.1
Host: dashboard.tutum.co
Accept: application/json
```

Executes the trigger. For `SCALEUP` triggers, the number of containers to scale up can be passed at the end of the trigger call url, for example `/api/v1/service/61a29874-9134-48f9-b460-f37d4bec4826/trigger/7eaf7fff-882c-4f3d-9a8f-a22317ac00ce/call/3/`.

### Endpoint Type

Available in Tutum's **REST API**

### HTTP Request

`POST /api/v1/service/(uuid)/trigger/(trigger_uuid)/call/`

### Path Parameters

Parameter | Description
--------- | -----------
uuid | The UUID of the associated service
trigger_uuid | The UUID of the trigger to call
