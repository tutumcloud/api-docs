---
title: tutum API reference

language_tabs:
  - http
  - go
  - python
  - shell

toc_footers:

includes:
  - action
  - provider
  - region
  - availabilityzone
  - nodetype
  - nodecluster
  - node
  - tokens
  - registry
  - image
  - imagetag
  - buildsetting
  - stack
  - service
  - container
  - volumegroup
  - volume
  - triggers
  - tutum-events
  - errors

search: true
---

# Introduction

Tutum currently offers a **HTTP REST API** and a **Websocket Stream API** which are used by both the [Web UI](https://dashboard.tutum.co/) and the [CLI](https://github.com/tutumcloud/tutum-cli). In this document you will find all API operations currently supported in the platform and examples on how to execute them using our [Python SDK](https://github.com/tutumcloud/python-tutum) and [Go SDK](https://github.com/tutumcloud/go-tutum).

# Authentication

In order to be able to make requests to the Tutum API, you should first obtain an ApiKey for your account. For this, log into Tutum, click on the menu on the upper right corner of the screen, select **Account info** and then select **API keys**.

## REST API

```python
import tutum
tutum.user = "username"
tutum.apikey = "apikey"
```

```go
import "github.com/tutumcloud/go-tutum/tutum"

tutum.User = "username"
tutum.ApiKey = "apikey"
```

```http
GET /api/v1/service/ HTTP/1.1
Host: dashboard.tutum.co
Authorization: Basic dXNlcm5hbWU6YXBpa2V5
Accept: application/json
```

```shell
export TUTUM_USER=username
export TUTUM_APIKEY=apikey
```

> Make sure to replace `username` with your username and `apikey` with your API key.

The Tutum REST API is reachable through the following hostname:

`https://dashboard.tutum.co/`

All requests should be sent to this endpoint using `Basic` authentication using your API key as password:

`Authorization: Basic dXNlcm5hbWU6YXBpa2V5`

HTTP responses are given in JSON format, so the following `Accept` header is required for every API call:

`Accept: application/json`

## Stream API

```python
import websocket
import base64

header = "Authorization: Basic %s" % base64.b64encode("%s:%s" % (username, password))
ws = websocket.WebSocketApp('wss://stream.tutum.co/v1/events', header=[header])
```

```go
import "github.com/gorilla/websocket"

var StreamUrl = "wss://stream.tutum.co:443/v1/events"

header := http.Header{}
header.Add("Authorization", xxxx)

var Dialer websocket.Dialer
ws, _, err := Dialer.Dial(url, header)
if err != nil {
	log.Println(err)
}
```

```http
GET /v1/events HTTP/1.1
Host: stream.tutum.co
Authorization: Basic dXNlcm5hbWU6YXBpa2V5
Connection: Upgrade
Upgrade: websocket
```

```shell
export TUTUM_USER=username
export TUTUM_APIKEY=apikey
```

> Make sure to replace `username` with your username and `apikey` with your API key.

The Tutum Stream API is reachable through the following hostname:

`wss://stream.tutum.co/`

The Stream API requires the same authentication mechanism as the REST API:

`Authorization: Basic dXNlcm5hbWU6YXBpa2V5`


## API roles

> The CLI and the SDKs will detect this environment variable and automatically use it

If you give an [API role](https://support.tutum.co/support/solutions/articles/5000524639) to a container, the environment variable `TUTUM_AUTH` inside the container will have the contents of the `Authorization` header that you can use to authenticate against the REST or Stream APIs:

`curl -H "Authorization: $TUTUM_AUTH" https://dashboard.tutum.co/api/v1/service/`
