# Docker ComposeR

This project helps to easily launch stages for Remittance's microservices.

## TL;DR

Use a single command to create networks, volumes, images, and containers.

```bash
# Launch containers
docker compose up -d
```

## How to use it

In order to use this project, you should follow this steps:

1. Change [`.env`](./env) file accordingly to your environment.

   > Ussually, you just need to change the `TARGET_STAGE` variable _(dev, qa,
   > prod)_.

1. Add all microservices projects that you need to launch to this folder.

   > All files in this folder will be ignored, so you can just execute
   > `git clone YOUR_REPO` inside this folder and all will work well
   > without any\* further action over your actual project.

1. Put the [`.dockerignore`](./.dockerignore) and [`Dockerfile`](./Dockerfile)
   in the **root folder of every project** that will be launch
   in [`compose.yml`](./compose.yml).

1. Remember to setup your project required files like a `.env` or any other
   specific one.

1. _(Optional)_ If your will develop new features, is mandatory install Node
   dependencies locally.

---

**\*** _You will need to modify only the Docker related files of your project._

## Useful commands

```bash
# Launch services creating images
docker compose up -d

# Launch services rebuilding images (i.e., when you change the `TARGET_STAGE`)
docker compose up -d --build

# Delete composed services
docker compose down

# Stop composed services
docker compose stop

# Start stoped composed services
docker compose start

# View logs of all services
docker compose logs -f

# View logs of single service
docker compose logs -f <SERVICE_NAME>

# View all your launched services (running or not running)
docker ps -a
```

**\*** _The `-d` flag in `up` means `detached`. It will not lock your terminal
to the Docker logs. When you detached it, containers will be stoped._

**\*** _The `-f` flag in `logs` means `follow`. It will lock your terminal to the
Docker logs. When you detached it, containers will continue working._
