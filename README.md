# zsh-sticky-shift

Sticky shift for Zsh

## Installation

1. Use your favorite plugin manager

For example:

```sh:zinit
zinit light 4513echo/zsh-sticky-shift
```

2. Manually install

For example:

```sh
git clone https://github.com/4513echo/zsh-sticky-shift.git
echo "source /path/to/sticky-shift.plugin.zsh" >> ~/.zshrc
source ~/.zshrc
```

## Configuration

You can change the behavior of this plugin using environment variables:

```sh
export STICKY_SHIFT_KEY="@"
export STICKY_DELAY=0.3
```

- `STICKY_SHIFT_KEY`

default: `;`

The key which trigger sticky shift.

- `STICKY_TABLE`

default: `jis`

The table of keyboard you use. `jis` or `us` are available.

- `STICKY_DELAY`

default: `1` (second)

Timeout for sticky shift. After that time is passed, the plugin stop reading
char and insert `STICKY_SHIFT_KEY`.
