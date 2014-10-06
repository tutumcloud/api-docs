---
title: tutum API reference

language_tabs:
  - shell
  - python
  - cli

toc_footers:

includes:
  - action
  - provider
  - region
  - availabilityzone
  - nodetype
  - nodecluster
  - node
  - service
  - container
  - errors

search: true
---

# Introduction

Tutum currently offers an HTTP REST API which is used by both the Web UI and the [CLI](https://github.com/tutumcloud/tutum-cli). In this document you will find all the operations currently supported in the platform and examples on how to execute them by using `curl` and our [Python SDK](https://github.com/tutumcloud/python-tutum).

# Authentication

> To authorize, use this code:

```cli
tutum login
Username: username
Password:
Login succeeded!
```

```python
import tutum
tutum.user = "username"
tutum.apikey = "apikey"
```

```shell
# With shell, you can just pass the correct header with each request
curl https://dashboard.tutum.co/api_endpoint_here
  -H "Authorization: ApiKey username:apikey"
```

> Make sure to replace `username` with your username and `apikey` with your API key.

In order to be able to make requests to the API, you should first obtain an ApiKey for your account. For this, log into Tutum, click on the menu on the upper right corner of the screen, select `Account info` and then select `Api Key`.

The Tutum HTTP API is reachable through the following hostname:

`https://dashboard.tutum.co/`

All requests should be sent to this endpoint with the following `Authorization` header:

`Authorization: ApiKey username:apikey`


