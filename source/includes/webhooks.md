# Webhooks

## Service Webhooks handlers

> Example

```json
{
  "url": "/api/v1/service/82d4a246-52d8-468d-903d-9da9ef05ff28/webhook/handler/0224815a-c156-44e4-92d7-997c69354438/call/",
  "name": "docker_webhook",
  "resource_uri": "/api/v1/service/82d4a246-52d8-468d-903d-9da9ef05ff28/webhook/handler/0224815a-c156-44e4-92d7-997c69354438/"
}
```

You can assign webhooks to your services in order to execute different operations to the service.


### Attributes
Attribute | Description
--------- | -----------
url | Address to execute the webhook operation
name | A user provided name for the webhook 
resource_uri | A unique API endpoint that represents the webhook


### Operations 
Operation | Description
--------- | -----------
Redeploy | Performs a `redeploy` service operation: every container with `STOPPED` or `RUNNING` state will be redeployed.

## List all webhooks

```python
import tutum

service = tutum.Service.fetch('61a29874-9134-48f9-b460-f37d4bec4826')
webhook = tutum.WebhookHandler.fetch(sercice)
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

Lists all current webhook handlers the service has associated to. Returns a list of `ServiceWebhookHandler` objects.

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
webhook = tutum.WebhookHandler.fetch(sercice)
webhook.add("mywebhook_name")
webhook.save()
```

```http
POST /api/v1/service/61a29874-9134-48f9-b460-f37d4bec4826/webhook/handler/ HTTP/1.1
Host: dashboard.tutum.co
Authorization: ApiKey username:apikey
Accept: application/json
Content-Type: application/json

{"name": "mywebhook_name"}
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
webhook = tutum.WebhookHandler.fetch(sercice)
webhook.delete("7eaf7fff-882c-4f3d-9a8f-a22317ac00ce)
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
uuid | The UUID of the node cluster to terminate
webhook_uuid | The UUID of the webhook handler to retrieve


## Call a webhook handler

```python
import tutum

service = tutum.Service.fetch('61a29874-9134-48f9-b460-f37d4bec4826')
webhook = tutum.WebhookHandler.fetch(sercice)
webhook.call("7eaf7fff-882c-4f3d-9a8f-a22317ac00ce)
```

```http
POST /api/v1/service/61a29874-9134-48f9-b460-f37d4bec4826/webhook/handler/7eaf7fff-882c-4f3d-9a8f-a22317ac00ce/call/ HTTP/1.1
Host: dashboard.tutum.co
Authorization: ApiKey username:apikey
Accept: application/json
```

Executes webhook handler operation associated.


### HTTP Request

`POST /api/v1/service/(uuid)/webhook/handler/(webhook_uuid)/call/`

### Query Parameters

Parameter | Description
--------- | ----------- 
uuid | The UUID of the node cluster to terminate
webhook_uuid | The UUID of the webhook handler to retrieve
