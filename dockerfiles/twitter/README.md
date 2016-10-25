# smtudor/twitter

The **[t]** Twitter CLI client on Alpine Linux.

## Example Usage

Run the client interactively (with the `help` subcommand), optionally mounting the location of the `.trc` file.

```shell
$ docker run -it --rm -v ~/.trc:/root/.trc smtudor/twitter help
```

You'll need to [create an API token and authorize app access][t].

For ease of use, I recommend adding an alias function to your shell environment.

```shell
twitter() {
    docker run -it --rm \
        -v "$HOME/.trc:/root/.trc" \
        smtudor/twitter $@
}
```

[t]: http://sferik.github.io/t/
