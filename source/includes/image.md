# Images

## Image

> Example

```json
{
  "build_source": {
    "autotests": "OFF",
    "build_settings": [
      {
        "autobuild": false,
        "branch": "master",
        "dockerfile": "/",
        "tag": "/api/v1/image/registry.local/user1/image1/tag/latest/"
      },
      {
        "autobuild": true,
        "branch": "staging",
        "dockerfile": "/",
        "tag": "/api/v1/image/registry.local/user1/image1/tag/staging/"
      }
    ],
    "owner": "tutumcloud",
    "repository": "test-private-repo",
    "type": "GITHUB"
  },
  "categories": [
    {
      "name": "test"
    }
  ],
  "description": "Test image",
  "registry": "/api/v1/registry/registry.local/",
  "icon_url": "/_static/assets/images/dockerimages/docker-64.png",
  "in_use": false,
  "is_private_image": true,
  "last_build_date": "Fri, 8 Nov 2013 00:22:26 +0000",
  "name": "registry.local/user1/image1",
  "public_url": "",
  "resource_uri": "/api/v1/image/registry.local/user1/image1/",
  "star_count": 0,
  "state": "SUCCESS",
  "jumpstart": false,
  "tags": [
    "/api/v1/image/registry.local/user1/image1/tag/latest/",
    "/api/v1/image/registry.local/user1/image1/tag/staging/"
  ]
}
```

An image is a repository from a registry.  Public DockerHub images are created when inspected. Private images must be added to Tutum before using them. For Tutum private registry images, they are also automatically added when pushing the image to the Tutum private registry.

### Attributes

Attribute | Description
--------- | -----------
resource_uri | A unique API endpoint that represents the image
name | Name of the image with docker format, i.e. 'ubuntu' or 'tutum/hello-world'
description | Description of the image
icon_url | URL of the image icon
state | The state of the image (see table `Image states` below)
star_count | How many people starred the image
jumpstart | Whether the image is a jumpstart or not
in_use | If the image is being used by any of your services
categories | List of categories associated with this image (see table `Image Category attributes` below)
is_private_image | Whether this image is hosted in a private registry or not
public_url | URL of the detailed information page in the public docker index
registry | Resource URI of the registry where this image is hosted
last_build_data | Date of the last successfully build on any of the image tags
build_source | The build source for this image (see table `Image Build Source attributes` below)
tags | List of resource URIs of the tags associated with this docker image


### Image States

State | Description
----- | -----------
Empty | The image has no built tags available yet.
Success | All image tags are successfully built.
Building | Any of the images tags is being built.
Failed | There is at least an image tag whose last build failed.


### Image Category attributes

Attribute | Description
--------- | -----------
name | Name of the category


### Image Build Source attributes

Attribute | Description
--------- | -----------
type | Type of the build source
repository | The repository where images are built from
owner | The owner of the repository
autotests | Whether to execute tests for new commits or external pull requests (see table `Image Build Source Autotests values` below)
build_settings | List of associations between image tags and repository branches to do builds (see table `Image Build Setting attributes` below)


### Image Build Source Autotests values

Value | Description
----- | -----------
OFF | Ignore tests for repository commits or external pull requests.
SOURCE_ONLY | Execute tests for commits in this source repository.
SOURCE_AND_FORKS | Execute tests for commits in this repository and for external pull requests.


### Image Build Setting attributes

Attribute | Description
--------- | -----------
tag | The name of the tag to be built
branch | The Github repository branch where the image is build from
dockerfile | The path of the Dockerfile file in the branch
autobuild | Whether to build the image tag on new commits on this branch

## List all images

```http
GET /api/v1/image/ HTTP/1.1
Host: dashboard.tutum.co
Authorization: ApiKey username:apikey
Accept: application/json
```

Lists all current images. Returns a list of `Image` objects.

### Endpoint Type

Available in Tutum's **REST API**

### HTTP Request

`GET /api/v1/image/`

### Query Parameters

Parameter | Description
--------- | -----------
name | Filter by image name
jumpstart | Filter by whether the image is a jumpstart or not
is_private_image | Filter by whether the image is private or not
registry | Filter by the image registry
categories | Filter by the image categories


## Creates a new image.

```http
POST /api/v1/image/ HTTP/1.1
Host: dashboard.tutum.co
Authorization: ApiKey username:apikey
Accept: application/json
Content-Type: application/json

{"name": "registry.local/user1/image1"}
```

Creates a new private image.

### Endpoint Type

Available in Tutum's **REST API**

### HTTP Request

`POST /api/v1/image/`

### JSON Parameters

Parameter | Description
--------- | -----------
name | Name of the image with docker format, i.e. 'ubuntu' or 'tutum/hello-world'
username | (optional) Username to authenticate with the private registry (not needed for Tutum private registry)
password | (optional) Password to authenticate with the private registry (not needed for Tutum private registry)
description | Description of the image
build_source | The build source for this image (see table `Related Build Source attributes` below)


### Related Build Source attributes

Attribute | Description
--------- | -----------
type | (optional) Type of the build source (currently only `GITHUB` is supported)
repository | The repository where images are built from
owner | (optional) The owner of the repository (default: the owner of the linked Github account)
autotests | (optional) Whether to execute tests for new commits (default: `OFF`)
build_settings | List of associations between image tags and repository branches to do builds (see table `Related Build Setting attributes` below)


### Related Build Setting attributes

Attribute | Description
--------- | -----------
tag | The name of the tag to be built
branch | The Github repository branch where the image is build from
dockerfile | The path of the Dockerfile file in the branch
autobuild | (optional) Whether to build the image tag on new commits on this branch (default: `false`)


## Get an existing image

```http
GET /api/v1/image/registry.local/user1/image1/ HTTP/1.1
Host: dashboard.tutum.co
Authorization: ApiKey username:apikey
Accept: application/json
```

Gets all the details of an specific image

### Endpoint Type

Available in Tutum's **REST API**

### HTTP Request

`GET /api/v1/image/(name)/`

### Query Parameters

Parameter | Description
--------- | -----------
name | The name of the image to retrieve


## Update an existing image

```http
PATCH /api/v1/service/registry.local/user1/image1/ HTTP/1.1
Host: dashboard.tutum.co
Authorization: ApiKey username:apikey
Accept: application/json
Content-Type: application/json

{"description": "New image description"}
```

Updates the image details.

### Endpoint Type

Available in Tutum's **REST API**

### HTTP Request

`PATCH /api/v1/image/(name)/`

### Query Parameters

Parameter | Description
--------- | -----------
name | The name of the image to update


### JSON Parameters

Parameter | Description
--------- | -----------
username | (optional) Username to authenticate with the private registry (not needed for Tutum private registry)
password | (optional) Password to authenticate with the private registry (not needed for Tutum private registry)
description | Description of the image
build_source | The build source for this image (see table `Image Build Source attributes` below)


## Delete an image

```http
DELETE /api/v1/image/registry.local/user1/image1/ HTTP/1.1
Host: dashboard.tutum.co
Authorization: ApiKey username:apikey
Accept: application/json
```

Deletes the image from Tutum.

### Endpoint Type

Available in Tutum's **REST API**

### HTTP Request

`DELETE /api/v1/image/registry.local/user1/image1/`

### Query Parameters

Parameter | Description
--------- | -----------
name | The name of the image to delete
