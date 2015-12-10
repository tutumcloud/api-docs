# Build Settings

## Build Setting

> Example

```json
{
  "resource_uri": "/api/v1/image/registry.local/user1/image1/buildsetting/latest/",
  "image": "/api/v1/image/registry.local/user1/image1/",
  "tag": "latest",
  "state": "SUCCESS",
  "dockerfile": "/",
  "branch": "master",
  "autobuild": false
}
```

A build setting to customize automated builds.


### Image Build Setting attributes

Attribute | Description
--------- | -----------
resource_uri | A unique API endpoint that represents the image build setting
image | The resource URI of the image to which this build setting belongs to
tag | The name of the tag to be built
state | The state of the build setting (see table `Build Setting states` below)
branch | The git repository branch where the image is build from
dockerfile | The path of the Dockerfile file in the branch
autobuild | Whether to build the build setting tag on new commits on this branch


### Build Setting States

State | Description
----- | -----------
Empty | The build setting tag has not been built yet.
Success | The last build on this build setting tag finished successfully.
Building | The build setting tag is being built.
Failed | The last build on this build setting tag failed.


## Get an existing build setting

```http
GET /api/v1/image/registry.local/user1/image1/buildsetting/latest/ HTTP/1.1
Host: dashboard.tutum.co
Authorization: Basic dXNlcm5hbWU6YXBpa2V5
Accept: application/json
```

## Build an existing build setting tag


```http
POST /api/v1/service/registry.local/user1/image1/buildsetting/latest/build/ HTTP/1.1
Host: dashboard.tutum.co
Authorization: Basic dXNlcm5hbWU6YXBpa2V5
Accept: application/json
Content-Type: application/json

```

Builds the build setting tag from its associated git repository branch.

### Endpoint Type

Available in Tutum's **REST API**

### HTTP Request

`POST /api/v1/image/(name)/buildsetting/(tag)/build/`

### Path Parameters

Parameter | Description
--------- | -----------
name | The name of the image to build
tag | The name of the tag to build
