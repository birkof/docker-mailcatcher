Docker: Mailcatcher
===================

Dockerize Mailcatcher to catch emails during development

Usage
-----

```sh
# Run a daemon container with mailcatcher started
sudo docker run \
    -d \ # Daemon mode
    --name mailcatcher \ # Give a name to your container, so you can start/stop or link it later
    birkof/docker-mailcatcher
```

Now you can access to the mailcatcher smtp throught the `25` port and the web interface via `http://localhost`
Feel free to map ports differently.

Development
-----------

```sh
# Build manually the image
make build # sudo docker build -t birkof/docker-mailcatcher .

# Test the image by running a container that launch nginx
make run # sudo docker run --rm=true -t -i -p 80:80 birkof/docker-mailcatcher
# Then check http://localhost:80

# Remove the image
make clear # sudo docker rmi -f birkof/docker-mailcatcher
```