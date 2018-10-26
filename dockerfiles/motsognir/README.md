# motsognir-alpine

Usage:

```
docker run --name=motsognir \
    -p 127.0.0.1:7070:70 \
    -v $(pwd)/motsognir.conf:/srv/motsognir.conf \
    -v $(pwd)/gopher_content:/var/gopher \
    -d smtudor/motsognir:latest
```
