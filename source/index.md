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

In order to be able to make requests to the Tutum API, you should first obtain an ApiKey for your account. For this, log into Tutum, click on the menu on the upper right corner of the screen, select `Account info` and then select `Api Key`.

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
Authorization: ApiKey username:apikey
Accept: application/json
```

```shell
tutum login -u username -p apikey
```

> Make sure to replace `username` with your username and `apikey` with your API key.

The Tutum REST API is reachable through the following hostname:

`https://dashboard.tutum.co/`

All requests should be sent to this endpoint with the following `Authorization` header:

`Authorization: ApiKey username:apikey`

HTTP responses are given in JSON format, so the following `Accept` header is required for every API call:

`Accept: application/json`

## Stream API

```python
import websocket
ws = websocket.WebSocketApp('wss://stream.tutum.co/v1/events?user={}&token={}'.format("username", "apikey"))
```

```go
import "github.com/gorilla/websocket"

var StreamUrl = "wss://stream.tutum.co:443/v1/events?token=" + ApiKey + "&user=" + User

header := http.Header{}
header.Add("User-Agent", customUserAgent)

var Dialer websocket.Dialer
ws, _, err := Dialer.Dial(url, header)
if err != nil {
	log.Println(err)
}
```

```http
GET /v1/events?user=username&token=apikey HTTP/1.1
Host: stream.tutum.co
Connection: Upgrade
Upgrade: websocket
```

```shell
tutum login -u username -p apikey
```

> Make sure to replace `username` with your username and `apikey` with your API key.

The Tutum Stream API is reachable through the following hostname:

`wss://stream.tutum.co/`

The Stream API requires authentication details to be passed as query parameters `user` and `token`:

`wss://stream.tutum.co/v1/events?token=apikey&user=username`

If using TUTUM_AUTH from service roles, use the following url:

`wss://stream.tutum.co/v1/events?auth=TUTUM_AUTH`

where `TUTUM_AUTH` is the environment variable injected via [API roles](https://support.tutum.co/support/solutions/articles/5000524639)
