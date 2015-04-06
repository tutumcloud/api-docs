# Tutum Events

> Example event

```json
{
  "type":"action",
  "action":"update",
  "parents":["/api/v1/container/0b0e3538-88df-4f07-9aed-3a3cc4175076/"],
  "resource_uri":"/api/v1/action/49f0efe8-a704-4a10-b02f-f96344fabadd/"
}
```

__Available only on the stream api__

### API endpoint

`GET /v1/events`

### Tutum events

Tutum events are the messages sent every time a main Tutum object(Containers, Services, Nodes, Node Clusters and Actions) is created, updated or deleted.

By using this API endpoint you can get a stream of all the changes on your Tutum account objects and avoid polling to the REST API.

Once you are connected to the stream endpoint, you need to have a listener to the web socket on message, getting a string message every time an object is modified. This message will contain a JSON object that need to be parsed to get an object or a dictionary with the following attributes:

Attribute | Description
--------- | -----------
type | Type of object that was modify. For possible values check the [events types](#event-types).
action | Action type that was executed to the object. Posible values: `create`, `update` and `delete`.
parents | Parents of the object, it's useful to filter containers per service, stack or node. Services in a stack and nodes in a node cluster.
resource_uri | REST endpoint of the object so you can request all information of a object that you are interested in.
state | The currect state of the object

### Events types

Attribute | Description
--------- | -----------
auth | Sent after the websocket was connected successfully
containter | Sent on all messages notifying a change in a container on your account
service | Sent on all messages notifying a change in a service on your account
node | Sent on all messages notifying a change in a node on your account
nodecluster | Sent on all messages notifying a change in a node cluster on your account
action | Sent on all messages notifying a change in an action on your account
error | Sent when an error occurs on the web socket connection or as part of the authentication process.
user-notification | Send on all messages notifying a error on a process on the account.
user-notifications | After the authentication is done with all the user-notification of the last minute.