# MyPi

This is a toy project to explore Nerves(-hub), and the vast world of Raspberry Pi.

## First Things First

1. Export Environment Variables (use a file in ./tmp/ or your bash profile)
```bash
#!/usr/bin/env bash

export MIX_TARGET=rpi3
export NERVES_NETWORK_SSID=wifi_network_name
export NERVES_NETWORK_PSK=wifi_network_password
```

## Updating Firmware Remotely

1. Install dependencies
```bash
mix deps.get
```

2. Publish some firmware
```bash
mix firmware
mix nerves_hub.firmware publish --key devkey
```

3. Create a deployment
```bash
mix nerves_hub.deployment create
mix nerves_hub.deployment update deployment_name is_active true
```

## Adding a New Device

Coming soon...

## Further Reading

  * Official docs: https://hexdocs.pm/nerves/getting-started.html
  * Official website: https://nerves-project.org/
  * Forum: https://elixirforum.com/c/nerves-forum
  * Discussion Slack elixir-lang #nerves ([Invite](https://elixir-slackin.herokuapp.com/))
  * Source: https://github.com/nerves-project/nerves
