# Docker ComposeR

This project helps to easily launch stages for Remittance's microservices.

## TL;DR

Use a single command to has a ready to develop, check, and deploy environment.

```bash
# Launch containers
docker compose up -d

# Launch containers using local node_modules
docker compose -f compose.yml -f compose.local.yml up -d
```

## How to use it

In order to use this project, you should follow this steps:

1. Select the right branch based on your project. It can be one of the following:

   - Remittance: `project/remittance`.

   - Carga Bip: `project/carga-bip`.

1. Create a `.env` file using [`.env.example`](./env.example) accordingly to
   your environment.

   > Commonly, you just need to change the `TARGET_STAGE` variable _(local,
   > dev, qa, prod)_.

1. Add all microservices projects that you need to launch to this folder.

   > All projects in this folder will be ignored, so you can just execute
   > `git clone YOUR_REPO` inside this folder and they will work well
   > without any\* further action over your actual project.
   >
   > You can run `sh setup.sh -g` in order to do it automatically.

1. :exclamation: **REMEMBER**:

   - Checkout to the proper `development` or `feature` branch.

   - Setup your required files like a `.env` or any other specific one to the
     project itself.

1. Put the [`.dockerignore`](./shared/.dockerignore) and [`Dockerfile`](./shared/Dockerfile)
   in the **root folder of every project** that will be launch
   in [`compose.yml`](./compose.yml).

   > You can run `sh setup.sh -d` in order to do it automatically.

1. _(Optional)_ If your will develop new features, is **mandatory** install Node
   dependencies locally.

   > You can run `sh setup.sh -n` in order to do it automatically.

1. :rocket: Launch your projects with
   `docker compose up -d` (`dev`, `prod` or `qa`) or
   `docker compose -f compose.yml -f compose.local.yml up -d` (`local`)
   (add `--build`, in case you need it)

---

**\*** _Perhaps you will need to modify only the Docker related files of your project._

## Setup script

It is provided a useful [`setup.sh`](./setup.sh) script that will help you to
add all repositories right from Bitbucket and setup all the required files.

Script works as follows:

```bash
# Get all used repositories
sh setup.sh -g

# Add all required Docker files to repositories
sh setup.sh -d

# Install dependencies on all projects
sh setup.sh -n

# Show script help
sh setup.sh -h
```

> **DISCLAIMER**: This process has a drawback due the usage of non-standard\* Git
> branches names. In order to properly setup the repositories, you will need to run
> `sh setup.sh -g`, then go into each created Git folder and checkout the proper
> branch.
>
> After that, you can safely run `sh setup.sh -d` and then add the required
> `.env` files.

---

**\*** _Currently, used branch can be `development` or some random `feature` branch,
there is no way to know it programatically._

## Dev Containers

When copying the Docker related files using the [setup script](#setup-script), a
`.devcontainer` folder is created inside of each microservice. This folder create
the specifications defined in [devcontainers](https://containers.dev/), allowing
you to launch instances of apps like VSCode inside the container as they were in
your machine. This is handy for development purposes like **debugging**, easily setting
the **environment setup**, etc.

To get this using VSCode, you must install the
[Dev Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)
extension.

Think this as a way to properly develop any project without install anything but
Docker and VSCode in your machine.

### Debug

In order to debug your running container, you simply must to enter to the Dev Container
using VSCode, then go to the `Run and Debug` section and run the `Attach to Server`
predefined configuration.

Also, if you want to debug in your local machine, you simply need to run the
`Debug Server` configuration. This will launch the project and open an attachable
port that will be used by the attach process.

## Useful commands

```bash
# Launch services creating images
docker compose up -d <service_name>

# Launch services rebuilding images (i.e., when you change the `TARGET_STAGE`)
docker compose up -d --build <service_name>

# Launch services in Local context
docker compose -f compose.yml -f compose.local.yml up -d [--build] <service_name>

# Delete composed services
docker compose down

# Stop composed services
docker compose stop <service_name>

# Remove stopped composed services
docker compose rm <service_name>

# Start stoped composed services
docker compose start <service_name>

# Restart composed services
docker compose restart <service_name>

# View logs of all services
docker compose logs -f <service_name>

# View all your launched services (running or not running)
docker ps -a
```

**\*** _The `-d` flag in `up` means `detached`. It will not lock your terminal
to the Docker logs. When you detached it, containers will be stoped._

**\*** _The `-f` flag in `logs` means `follow`. It will lock your terminal to the
Docker logs. When you detached it, containers will continue working._

**\*** _The `<service_name>` means that you can use the command for a single service
instead of the entire stack. The service name will be the one located in the
[`compose.yml`](./compose.yml) file._
