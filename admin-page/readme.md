# How to generate admin token

1. Open your terminal in the `admin-page` directory

2. Run following command to create Docker image

    ```shell
    docker build -t token-generator .
    ```

3. Run Docker container to generate admin token

    ```shell
    docker run --rm -v ${pwd}/.token:/token token-generator
    ```

Generated token and it's hash can be found in `.token` subdirectory.

Paste token hash as value of `SERVER_ADMIN_TOKEN` variable in [`.env`](../.env) file. Make sure you use single quotes.

```text
SERVER_ADMIN_TOKEN='$argon2id$v=19$m=65540,t=3,p=4$MmeK.....'
```
