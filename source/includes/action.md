# Actions

## Action

> Example

```json
{
    "action": "Cluster Create",
    "end_date": "Wed, 17 Sep 2014 08:26:22 +0000",
    "ip": "56.78.90.12",
    "location": "New York, USA",
    "logs": "",
    "method": "POST",
    "object": "/api/v1/cluster/eea638f4-b77a-4183-b241-22dbd7866f22/",
    "path": "/api/v1/cluster/",
    "resource_uri": "/api/v1/action/6246c558-976c-4df6-ba60-eb1a344a17af/",
    "start_date": "Wed, 17 Sep 2014 08:26:22 +0000",
    "state": "Success",
    "user_agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_4) AppleWebKit/537.78.2 (KHTML, like Gecko) Version/7.0.6 Safari/537.78.2",
    "uuid": "6246c558-976c-4df6-ba60-eb1a344a17af",
    "body": '{"image_tag": "/api/v1/image/tutum/ubuntu-quantal/tag/latest/", "name": "test_cluster"}' 
}
```

An action represents an API call by a user. Details of the API call such as timestamp, origin IP address, and user agent are logged in the action object.

Simple API calls that do not require asynchronous execution will return immediately with the appropiate HTTP error code and an action object will be created either in `Success` or `Failed` states. API calls that do require asynchronous execution will return HTTP code `202 Accepted` immediately and create an action object in `In progress` state, which will change to `Success` or `Failed` state depending on the outcome of the operation being performed.


### Attributes

Attribute | Description
--------- | -----------
resource_uri | A unique API endpoint that represents the action
uuid | A unique identifier for the action generated automatically on creation
object | The API object (resource URI) to which the action applies to
action | Name of the operation performed/being performed
method | HTTP method used to access the API
path | HTTP path of the API accessed
user_agent | The user agent provided by the client when accessing the API endpoint
start_date | Date and time when the API call was performed and the operation started processing
end_date | Date and time when the API call finished processing
state | State of the operation (see table below)
ip | IP address of the user that performed the API call
location | Geographic location of the IP address of the user that performed the API call
logs | Logs produced as a result of the operation
body | Data of the API call


### Action states

State | Description
----- | -----------
In progress | The action needed asynchronous execution and is being performed
Success | The action was executed successfully
Failed | There was an issue when the action was being performed. Check the logs for more information.


## List all actions

```python
import tutum

actions = tutum.Action.list()
```

```http
GET /api/v1/action/ HTTP/1.1
Host: dashboard.tutum.co
Authorization: ApiKey username:apikey
Accept: application/json
```


Lists all actions in chronological order. Returns a list of `Action` objects.

### HTTP Request

`GET /api/v1/action/`

### Query Parameters

Parameter | Description
--------- | -----------
state | Filter by state. Possible values: `In progress`, `Success`, `Failed`
start_date__gte | Filter by start date (after or on the date supplied)
start_date__lte | Filter by start date (before or on the date supplied)
end_date__gte | Filter by end date (after or on the date supplied)
end_date__lte | Filter by end date (before or on the date supplied)
object | Filter by related object (resource URI)


## Get an action by UUID

```python
import tutum

action = tutum.Action.fetch("7eaf7fff-882c-4f3d-9a8f-a22317ac00ce")
```

```http
GET /api/v1/action/7eaf7fff-882c-4f3d-9a8f-a22317ac00ce/ HTTP/1.1
Host: dashboard.tutum.co
Authorization: ApiKey username:apikey
Accept: application/json
```

Get all the details of an specific action

### HTTP Request

`GET /api/v1/action/(uuid)/`

### Query Parameters

Parameter | Description
--------- | ----------- 
uuid | The UUID of the action to retrieve

