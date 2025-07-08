# vm-preper
simple script list to configure newly configured vm for quick deployment

## usage

### run everything
to run the whole setup you can use 
```sh
source <(curl -sSf "https://raw.githubusercontent.com/onixldlc/vm-preper/refs/heads/main/init.sh")
```
or run preconfigured setup like so:
```sh
source <(curl -sSf "https://raw.githubusercontent.com/onixldlc/vm-preper/refs/heads/main/install-all.sh")
```
or bypass the ubuntu check:
```sh
source <(curl -sSf "https://raw.githubusercontent.com/onixldlc/vm-preper/refs/heads/main/script/setup/ubuntu/install-tools.sh")
```

### language installer
to run just the programing language installer, you can use
```sh
source <(curl -sSf "https://raw.githubusercontent.com/onixldlc/vm-preper/refs/heads/main/script/setup/ubuntu/install-language-tools.sh") 
```

### containerization installer
to run just the containerization installer, you can use
```sh
source <(curl -sSf "https://raw.githubusercontent.com/onixldlc/vm-preper/refs/heads/main/script/setup/ubuntu/install-container-tools.sh") 
```

### networking tool installer
to run just the networking tools installer, you can use
```sh
source <(curl -sSf "https://raw.githubusercontent.com/onixldlc/vm-preper/refs/heads/main/script/setup/ubuntu/install-network-tools.sh") 
```

### misc tool installer
to run just the misc tools installer, you can use
```sh
source <(curl -sSf "https://raw.githubusercontent.com/onixldlc/vm-preper/refs/heads/main/script/setup/ubuntu/install-misc-tools.sh") 
```