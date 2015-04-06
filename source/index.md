---
title: tutum API reference

language_tabs:
  - http
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
  - webhooks
  - tutum-events
  - errors

search: true
---

# Introduction

Tutum currently offers an HTTP REST API and a WEBSOCKET STEAM API which is used by both the Web UI and the [CLI](https://github.com/tutumcloud/tutum-cli). In this document you will find all API operations currently supported in the platform and examples on how to execute them using our [Python SDK](https://github.com/tutumcloud/python-tutum).

# Authentication

```python
import tutum
tutum.user = "username"
tutum.apikey = "apikey"
```

```http
GET /api_endpoint_here HTTP/1.1
Host: dashboard.tutum.co
Authorization: ApiKey username:apikey
Accept: application/json
```

```shell
tutum login
Username:
Password:
Email:
```

> Make sure to replace `username` with your username and `apikey` with your API key.

In order to be able to make requests to the API, you should first obtain an ApiKey for your account. For this, log into Tutum, click on the menu on the upper right corner of the screen, select `Account info` and then select `Api Key`.

### REST API

The Tutum REST API is reachable through the following hostname:

`https://dashboard.tutum.co/`

All requests should be sent to this endpoint with the following `Authorization` header:

`Authorization: ApiKey username:apikey`

HTTP responses are given in JSON format, so the following `Accept` header is required for every API call:

`Accept: application/json`

### STREAM API

The Tutum STREAM API is reachable through the following hostnames:

`wss://stream.tutum.co/`

The stream api requires to have the endpoint added to the request and then add the user and token as query params to end up with a url like this:

`wss://stream.tutum.co/v1/events?token=apikey&user=username`




