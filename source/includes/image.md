# Images

## Image

> Example

```json
{
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

### Attributes

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


## List all images

```python
import tutum

images = tutum.Image.list()
```

```http
GET /api/v1/image/ HTTP/1.1
Host: dashboard.tutum.co
Authorization: Basic dXNlcm5hbWU6YXBpa2V5
Accept: application/json
```

```go
import "github.com/tutumcloud/go-tutum/tutum"

imagesList, err := tutum.ListImages()

if err != nil {
    log.Println(err)
}

log.Pringln(imagesList)
```

```shell
tutum image list
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
is_user_image | Filter by whether the image has been added as user repository or not
registry | Filter by resource URI of the target image registry
categories | Filter by the name of the image category, HTML quoted. Example: `/api/v1/image/?categories__name=Database%20Servers`


## Creates a new image.

```python
import tutum

image = tutum.Image.create(name=repository, username=username, password=password, description=description)
image.save()
```

```http
POST /api/v1/image/ HTTP/1.1
Host: dashboard.tutum.co
Authorization: Basic dXNlcm5hbWU6YXBpa2V5
Accept: application/json
Content-Type: application/json

{"name": "registry.local/user1/image1"}
```

```go
import "github.com/tutumcloud/go-tutum/tutum"

image, err := tutum.CreateImage(tutum.ImageCreateRequest{
	Name:        "registry.local/user1/image1",
	Description: "Image1",
})

if err != nil {
	log.Println(err)
}

log.Println(image)
```

```shell
tutum image register -u username -p password registry.local/user1/image1
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
description | (optional) Description of the image


## Get an existing image

```python
import tutum

image = tutum.Image.fetch("registry.local/user1/image1")
```

```http
GET /api/v1/image/registry.local/user1/image1/ HTTP/1.1
Host: dashboard.tutum.co
Authorization: Basic dXNlcm5hbWU6YXBpa2V5
Accept: application/json
```

```go
import "github.com/tutumcloud/go-tutum/tutum"

image, err = tutum.GetImage("registry.local/user1/image1")

if err != nil {
    log.Println(err)
}

log.Println(image)
```

```shell
tutum image inspect registry.local/user1/image1
```

Gets all the details of an specific image

### Endpoint Type

Available in Tutum's **REST API**

### HTTP Request

`GET /api/v1/image/(name)/`

### Path Parameters

Parameter | Description
--------- | -----------
name | The name of the image to retrieve


## Update an existing image

```python
import tutum

image = tutum.Image.fetch("registry.local/user1/image1")
image.description = "New image description"
image.save()
```

```http
PATCH /api/v1/image/registry.local/user1/image1/ HTTP/1.1
Host: dashboard.tutum.co
Authorization: Basic dXNlcm5hbWU6YXBpa2V5
Accept: application/json
Content-Type: application/json

{"description": "New image description"}
```

```shell
tutum image update -d "New image description" registry.local/user1/image1
```

Updates the image details.

### Endpoint Type

Available in Tutum's **REST API**

### HTTP Request

`PATCH /api/v1/image/(name)/`

### Path Parameters

Parameter | Description
--------- | -----------
name | The name of the image to update


### JSON Parameters

Parameter | Description
--------- | -----------
username | (optional) Username to authenticate with the private registry (not needed for Tutum private registry)
password | (optional) Password to authenticate with the private registry (not needed for Tutum private registry)
description | Description of the image


## Delete an image

```python
import tutum

image = tutum.Image.fetch("registry.local/user1/image1")
image.delete()
```

```http
DELETE /api/v1/image/registry.local/user1/image1/ HTTP/1.1
Host: dashboard.tutum.co
Authorization: Basic dXNlcm5hbWU6YXBpa2V5
Accept: application/json
```

```go
import "github.com/tutumcloud/go-tutum/tutum"

image, err = tutum.GetImage("registry.local/user1/image1")

if err != nil {
    log.Println(err)
}

image.Remove()
```

```shell
tutum image rm registry.local/user1/image1
```

Deletes the image from Tutum.

### Endpoint Type

Available in Tutum's **REST API**

### HTTP Request

`DELETE /api/v1/image/registry.local/user1/image1/`

### Path Parameters

Parameter | Description
--------- | -----------
name | The name of the image to delete
