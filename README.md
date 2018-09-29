This image contains _rstudio-server_ (v 3.5.1)

I've created another _rstudio-server_ image because all the images I've tried had issues when stopping the docker container. The rstudio session was not correctly closed, and after a restart, the session was corrupted.

This image has the following r packages preinstalled:

- tidyverse
- ggthemes
- wesanderson

It is a very basic image, so there are no environment variables defined to _customize_ the container. It has preconfigured the lang `es_ES.UTF-8`. If someone is interested and has a proposal, I am open to improve the image.

This is an example of command that could be used to run a container:

```bash
docker run --name rstudio-server -p 8787:8787 -v rstudio-server-data:/home/rstudio -d qopuir/rstudio-server:1.0.0
```