# ASDF
This repository aims to show a few examples of asdf usage from dev to prod.

The goal is to simplify managing language versions in all environments using just one file.

## Dev
### Installing `asdf`
Follow the install instructions [here](https://asdf-vm.com/guide/getting-started.html)

### Installing plugins
For this example, we are going to use the following languages

* Go: Since it's commonly used at F5
* Rust: Since it's a language of interest at F5
* Javascript: Since the above three compile down to a standalone binary, as an example of a language that needs a runtime in production.


```
asdf plugin-add golang https://github.com/kennyp/asdf-golang.git
asdf plugin-add rust https://github.com/asdf-community/asdf-rust.git
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
```

### Install language dependendencies
Some of these installations have other dependencies that you'll need to make sure to satisfy.  Let's go one by one

#### Go
Debian:
```
apt install coreutils curl
```

MacOS:
```
brew install coreutils
```

#### Rust
None noted

#### Javascript
None noted

### Usage
Now go into any project folder
```bash
cd elxir_example
asdf install
```

Now you are using exactly the version of Elixir and Erlang needed by the project.


### Updating versions
To see installed versions:
```bash
asdf list elixir
```

To see available versions:
```bash
asdf list-all elixir
```

To change the local version for your project
```bash
asdf local elixir 1.14.2
```

To change the global version (go be used if not in a directory with a local version):
```bash
asdf global elixir 1.14.2
```

### How does it work?
`asdf` looks for the closest `.tool-versions` file and uses those values.  It will error if the file specifies a version of a language that it does not have installed.

By default, for global versions, it references `$HOME/.tool-versions`
For local, it creates a `.tool-versions` file in the project directory.

A `.tool-versions` file contains specifications like this:

```
erlang 25.1
elixir 1.14.3-otp-25
nodejs 19.3.0
```

The `.tool-versions` file should be checked in with your project.

## In CI
In CI there are two approaches you can take:
1. Use the CI tooling to install the language at a version (ie, github actions)
2. Read the `.tool-versions` file and feed it into some other system like a docker container tag

## In Production
Since we assume that your CI process produces a docker container as an artifact, no changes are necessary in production.  However, the `.tool-versions` file in git for a given release SHA can be referenced to understand the runtime version/compiler version linked to the running code.