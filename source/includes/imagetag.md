# Image Tags

## Image Tag

> Example

```json
{
  "full_name": "registry.local/user1/image1:latest",
  "layer": {
    "author": "Fernando Mayo <fernando@tutum.co>",
    "creation": "Fri, 8 Nov 2013 00:22:26 +0000",
    "docker_id": "bca93ea41953afd3e0bea21625636526d6ac743297886a3520069544a00e3a70",
    "entrypoint": "",
    "envvars": [
      {
        "key": "HOME",
        "value": "/"
      },
      {
        "key": "PATH",
        "value": "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
      }
    ],
    "labels": [
      {
        "key": "Tutum",
        "value" "Pure awesomeness"
      }
    ],
    "ports": [
      {
        "port": 80,
        "protocol": "'tcp"
      }
    ],
    "resource_uri": "/api/v1/layer/bca93ea41953afd3e0bea21625636526d6ac743297886a3520069544a00e3a70/",
    "run_command": "/run.sh",
    "volumes": [
      {
        "container_path": "/app"
      }
    ]
  },
  "image": "/api/v1/image/registry.local/user1/image1/",
  "name": "latest",
  "resource_uri": "/api/v1/image/registry.local/user1/image1/tag/latest/"
}
```

An image tag from a registry.

### Attributes

Attribute | Description
--------- | -----------
resource_uri | A unique API endpoint that represents the image tag
name | Name of the tag
full_name | Full name of the image tag with docker format, i.e. 'ubuntu:latest' or 'tutum/hello-world:staging'
layer | Specification of the current layer associated to this image tag (see table `Image Tag Layer attributes` below)


### Image Tag Layer attributes

Attribute | Description
--------- | -----------
author | The author of this image layer
creation | The date and time of this image layer creation
docker_id | The docker id of this image layer
entrypoint | Entrypoint used on launch for containers using this image layer
run_command | Run command used on launch for containers using this image layer
envvars | List of image-defined environment variables (see table `Image Tag Layer Environment Variable attributes` below)
labels | List of image-defined labels (see table `Image Tag Layer Label attributes` below)
ports | List of image-defined ports (see table `Image Tag Layer Port attributes` below)
volumes | List of image-defined volumes (see table `Image Tag Layer Volume attributes` below)


### Image Tag Layer Environment Variable

Attribute | Description
--------- | -----------
key | The name of the environment variable
value | The value of the environment variable


### Image Tag Layer Label Variable

Attribute | Description
--------- | -----------
key | The name of the label
value | The value of the label


### Image Tag Layer Port attributes

Attribute | Description
--------- | -----------
protocol | The protocol of the port, either `tcp` or `udp`
port | The port number inside the container


### Image Tag Layer Volume attributes

Attribute | Description
--------- | -----------
container_path | The container path where the volume is mounted


## Get an existing image tag

```python
import tutum

image_tag = tutum.ImageTag.fetch("registry.local/user1/image1", "latest")
```

```http
GET /api/v1/image/registry.local/user1/image1/tag/latest/ HTTP/1.1
Host: dashboard.tutum.co
Authorization: ApiKey username:apikey
Accept: application/json
```

```go
import "github.com/tutumcloud/go-tutum/tutum"

imageTag, err := tutum.GetImageTag("registry.local/user1/image1", "latest")

if err != nil {
	log.Println(err)
}

log.Println(imageTag)
```

```shell
tutum image tag inspect registry.local/user1/image1:latest
```

Gets all the details of an specific image tag

### Endpoint Type

Available in Tutum's **REST API**

### HTTP Request

`GET /api/v1/image/(name)/tag/(tag)/`

### Path Parameters

Parameter | Description
--------- | -----------
name | The name of the image to retrieve the tag
tag | The name of the tag

