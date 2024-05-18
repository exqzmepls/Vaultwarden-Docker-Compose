# How to generate self-signed SSL certificate

1. Open your terminal in the `ssl` directory

2. Run following command to create Docker image

    ```shell
    docker build -t certificate-generator .
    ```

3. Create `.env` file from `.env.sample` and overwrite default values

    ```shell
    cp .env.sample .env
    ```

4. Run Docker container to generate SSL certificate

    ```shell
    docker run --rm --env-file .env -v ${pwd}/.self-signed:/ssl certificate-generator
    ```

Generated SSL certificates (CA and domain) can be found in `.self-signed` subdirectory.

Specify `./ssl/.self-signed` as value of `SERVER_SSL_PATH` variable in [`.env`](../.env) file to use generated certificate.
