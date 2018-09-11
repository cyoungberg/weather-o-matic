# Weather-O-Matic

Get the weather for any city right in your browser!

## Development Environment Setup

### Add Rails Master Key

Sensitive credentials are encrypted, so you'll need the master key to use them. Once you are given
it, create a new file named `config/master.key`:

```sh
echo "THEMASTERKEY" >> config/master.key
```

### Install Gems

```sh
bundle install
```

### Start Your Dev Server

```sh
rails s
```

