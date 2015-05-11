# Tutum Events

## Tutum Event

> Example

```json
{
	"type": "action",
	"action": "update",
	"parents": [
		"/api/v1/container/0b0e3538-88df-4f07-9aed-3a3cc4175076/"
	],
	"resource_uri": "/api/v1/action/49f0efe8-a704-4a10-b02f-f96344fabadd/",
	"state": "Success"
}
```

__Available only on the Stream API__

Tutum events are generated every time any of the following objects is created or changes state:

* Stack
* Service
* Container
* Node Cluster
* Node
* Action


### Attributes

Attribute | Description
--------- | -----------
type | Type of object that was created or updated. For possible values check the [events types](#event-types) table below.
action | Type of action that was executed on the object. Posible values: `create`, `update` or `delete`
parents | List of resource URIs (REST API) of the parents of the object, according to the "Parent-child hierarchy" table below
resource_uri | Resource URI (REST API) of the object that was created or updated. You can do a `GET` operation on this URL to fetch its details
state | The current state of the object


### Event types

Type | Description
---- | -----------
stack | Whenever a `Stack` is created or updated
service | Whenever a `Service` is created or updated
container | Whenever a `Container` is created or updated
nodecluster | Whenever a `Node Cluster` is created or updated
node | Whenever a `Node` is created or updated
action | Whenever a `Action` is created or updated
auth | Sent after the websocket is connected successfully
error | Sent when an error occurs on the websocket connection or as part of the authentication process


### Parent-child hierarchy

Object type | Parent types
----------- | ------------
Stack | (None)
Service | Stack
Container | Service, Stack, Node, Node Cluster
Node Cluster | (None)
Node | Node Cluster
Action | (object to which the action applies to)


## Listen to new Tutum Events

```python
import tutum

def process_event(event):
    print event

events = tutum.TutumEvents()
events.on_message(process_event)
events.run_forever()
```
```go
import "github.com/tutumcloud/go-tutum/tutum"

c := make(chan tutum.Event)
e := make(chan error)

go tutum.TutumEvents(c, e)

for {
	select {
		case event := <-c:
			log.Println(event)
		case err := <-e:
			log.Println(err)
	}
}
```
```http
GET /v1/events?user=username&token=apikey HTTP/1.1
Host: stream.tutum.co
Connection: Upgrade
Upgrade: websocket
```

```shell
tutum event
```


### Websocket Request

`GET /v1/events`

Listens for new Tutum Events

### Query Parameters

Parameter | Description
--------- | -----------
user | The username to authenticate as
token | The API Key to authenticate with
