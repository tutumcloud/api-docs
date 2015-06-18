# Availability Zones

## Availability Zone

> Example

```json
{
    "available": true,
    "name": "ap-northeast-1a",
    "region": "/api/v1/region/az/ap-northeast-1/",
    "resource_uri": "/api/v1/az/aws/ap-northeast-1/ap-northeast-1a/"
}
```

An Availability Zone is an isolated location inside a region. Providers that support availability zones: AWS


### Attributes

Attribute | Description
--------- | -----------
available | Whether the availability zone is currently available for new node deployments
name | An identifier for the availability zone
region | The resource URI of the region where the availability zone is allocated
resource_uri | A unique API endpoint that represents the region


## List all availability zones

```python
# TODO
```

```http
GET /api/v1/az/ HTTP/1.1
Host: dashboard.tutum.co
Authorization: ApiKey username:apikey
Accept: application/json
```

```go
# TODO
```

```shell
tutum nodecluster az
```

Lists all availability zones from all regions of all supported cloud providers. Returns a list of `Availability Zone` objects.

### Endpoint Type

Available in Tutum's **REST API**

### HTTP Request

`GET /api/v1/az/`

### Query Parameters

Parameter | Description
--------- | -----------
name | Filter by availability zone name
region | Filter by region (resource URI)



## Get an individual availability zone

```python
# TODO
```

```go
# TODO
```

```http
GET /api/v1/az/aws/sa-east-1/sa-east-1a/ HTTP/1.1
Host: dashboard.tutum.co
Authorization: ApiKey username:apikey
Accept: application/json
```


Get all the details of a specific availability zone

### Endpoint Type

Available in Tutum's **REST API**

### HTTP Request

`GET /api/v1/az/(provider.name)/(region.name)/(name)/`

### Query Parameters

Parameter | Description
--------- | -----------
name | The name of the availability zone to retrieve
provider | The name of the provider
region | The name of the region
