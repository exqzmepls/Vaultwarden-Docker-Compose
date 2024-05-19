# Vaultwarden Docker Compose

This repository contains a Docker Compose configuration for setting up a self-hosted [Vaultwarden](https://github.com/dani-garcia/vaultwarden) password manager.

## Getting started

1. Clone the repository

    ```shell
    git clone https://github.com/exqzmepls/Vaultwarden-Docker-Compose.git
    ```

2. Generate a self-signed SSL certificate using given [instructions](ssl\readme.md)

3. Generate admin token using given [instructions](admin-page\readme.md)

4. Open your terminal in repository root directory

5. Spin up Docker Compose

    ```shell
    docker compose up -d
    ```

6. By default Vaultwarden server should now be running on [localhost](https://localhost)

7. You can explore [Vaultwarden Wiki](https://github.com/dani-garcia/vaultwarden/wiki) for additional details and usage examples
