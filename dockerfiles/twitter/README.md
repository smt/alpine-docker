# smtudor/twitter

The **[t]** Twitter CLI client on Alpine Linux.

1. Run the client interactively (with the `help` command):

    ```shell
    docker run -it --rm \
        -v ~/.trc:/root/.trc \
        smtudor/twitter help
    ```

2. For ease of use, I recommend adding an alias function to your shell environment.

    ```shell
    twitter() {
        docker run -it --rm \
            -v "$HOME/.trc:/root/.trc" \
            smtudor/twitter $@
    }
    ```

[t]: http://sferik.github.io/t/
