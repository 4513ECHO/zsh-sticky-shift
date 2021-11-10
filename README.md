# zsh-sticky-shift

Sticky shift for Zsh

## How to Install

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

## How to Configure

For example:

```sh
export STICKY_SHIFT_KEY="@"
export STICKY_DELAY=0.3
```

* `STICKY_SHIFT_KEY`

default: `;`

* `STICKY_TABLE`

default: `jis`

`jis` or `us`

* `STICKY_DELAY`

default: 1 (second)
