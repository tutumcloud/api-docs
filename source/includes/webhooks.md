# Webhook handlers

## Service Webhooks handlers

> Example

```json
{
  "url": "/api/v1/service/82d4a246-52d8-468d-903d-9da9ef05ff28/webhook/handler/0224815a-c156-44e4-92d7-997c69354438/call/",
  "operation": "REDEPLOY",
  "name": "docker_webhook",
  "resource_uri": "/api/v1/service/82d4a246-52d8-468d-903d-9da9ef05ff28/webhook/handler/0224815a-c156-44e4-92d7-997c69354438/"
}
```

Webhook handlers are URLs that will perform operations in a service whenever a `POST` request is sent to them. They require no authorization headers, so they should be treated as access tokens. Webhook handlers can be revoked if they are leaked or no longer used for security purposes. See [Webhook Handlers](https://tutum.freshdesk.com/support/solutions/articles/5000513815) for more information.


### Attributes

Attribute | Description
--------- | -----------
url | Address to be used to call the webhook handler with a `POST` request
name | A user provided name for the webhook handler
operation | The operation that the webhook call performs (see table `Operations` below)
resource_uri | A unique API endpoint that represents the webhook handler


### Operations

Operation | Description
--------- | -----------
REDEPLOY | Performs a `redeploy` service operation.
SCALEUP | Performs a `scale up` service operation.



## List all webhooks

```python
import tutum

service = tutum.Service.fetch('61a29874-9134-48f9-b460-f37d4bec4826')
webhook = tutum.WebhookHandler.fetch(service)
webhook.list()
```

```http
GET /api/v1/service/61a29874-9134-48f9-b460-f37d4bec4826/webhook/handler/ HTTP/1.1
Host: dashboard.tutum.co
Authorization: ApiKey username:apikey
Accept: application/json
```

```shell
tutum webhook-handler list 61a29874-9134-48f9-b460-f37d4bec4826
```

Lists all current webhook handlers the service has associated to. Returns a list of `Service Webhook Handler` objects.

### HTTP Request

`GET /api/v1/service/(uuid)/webhook/handler/`

### Query Parameters

Parameter | Description
--------- | ----------- 
uuid | The UUID of the service the webhooks are associated to  


## Create a new webhook handler

```python
import tutum

service = tutum.Service.fetch('61a29874-9134-48f9-b460-f37d4bec4826')
webhook = tutum.WebhookHandler.fetch(service)
webhook.add("mywebhook_name")
webhook.save()
```

```http
POST /api/v1/service/61a29874-9134-48f9-b460-f37d4bec4826/webhook/handler/ HTTP/1.1
Host: dashboard.tutum.co
Authorization: ApiKey username:apikey
Accept: application/json
Content-Type: application/json

{"name": "mywebhook_name", "operation": "REDEPLOY"}
```

```shell
tutum webhook-handler create --name mywebhook_name 61a29874-9134-48f9-b460-f37d4bec4826
```

Creates a new service webhook handler.

### HTTP Request

`POST /api/v1/service/(uuid)/webhook/handler/`

### JSON Parameters

Parameter | Description
--------- | -----------
name | (optional) A user provided name for the webhook handler
operation | (optional) The operation to be performed by the webhook (default: "REDEPLOY")

## Get an existing webhook handler


```http
GET /api/v1/service/61a29874-9134-48f9-b460-f37d4bec4826/webhook/handler/7eaf7fff-882c-4f3d-9a8f-a22317ac00ce/ HTTP/1.1
Host: dashboard.tutum.co
Authorization: ApiKey username:apikey
Accept: application/json
```

Get all the details of an specific webhook handler 

### HTTP Request

`GET /api/v1/service/(uuid)/webhook/handler/(webhook_uuid)/`

### Query Parameters

Parameter | Description
--------- | ----------- 
uuid | The UUID of the service the webhooks are associated to  
webhook_uuid | The UUID of the webhook handler to retrieve

## Delete a webhook handler

```python
import tutum

service = tutum.Service.fetch('61a29874-9134-48f9-b460-f37d4bec4826')
webhook = tutum.WebhookHandler.fetch(service)
webhook.delete("7eaf7fff-882c-4f3d-9a8f-a22317ac00ce")
```

```http
DELETE /api/v1/service/61a29874-9134-48f9-b460-f37d4bec4826/webhook/handler/7eaf7fff-882c-4f3d-9a8f-a22317ac00ce/ HTTP/1.1
Host: dashboard.tutum.co
Authorization: ApiKey username:apikey
Accept: application/json
```

```shell
tutum webhook-handler rm 61a29874-9134-48f9-b460-f37d4bec4826 7eaf7fff-882c-4f3d-9a8f-a22317ac00ce
```

Deletes specific webhook handler. It will be no longer available to be called.

### HTTP Request

`DELETE /api/v1/service/(uuid)/webhook/handler/(webhook_uuid)/`

### Query Parameters

Parameter | Description
--------- | ----------- 
uuid | The UUID of the associated service
webhook_uuid | The UUID of the webhook handler to delete


## Call a webhook handler

```python
import tutum

service = tutum.Service.fetch('61a29874-9134-48f9-b460-f37d4bec4826')
webhook = tutum.WebhookHandler.fetch(service)
webhook.call("7eaf7fff-882c-4f3d-9a8f-a22317ac00ce")
```

```http
POST /api/v1/service/61a29874-9134-48f9-b460-f37d4bec4826/webhook/handler/7eaf7fff-882c-4f3d-9a8f-a22317ac00ce/call/ HTTP/1.1
Host: dashboard.tutum.co
Accept: application/json
```

Executes the webhook. For `SCALEUP` webhooks, the number of containers to scale up can be passed at the end of the webhook call url, for example `/api/v1/service/61a29874-9134-48f9-b460-f37d4bec4826/webhook/handler/7eaf7fff-882c-4f3d-9a8f-a22317ac00ce/call/3/`.


### HTTP Request

`POST /api/v1/service/(uuid)/webhook/handler/(webhook_uuid)/call/`

### Query Parameters

Parameter | Description
--------- | ----------- 
uuid | The UUID of the associated service
webhook_uuid | The UUID of the webhook handler to call
