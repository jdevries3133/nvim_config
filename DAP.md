# Debugger Adapter Protocol

Holy frick I actually got DAP to work with JavaScript / Typescript and I could
not be more elated.

Most of the setup happens on `:PlugInstall`, but some additional assembly is
required:

```bash
# you need to peek in ./lua/dap_conf.lua if you want to use a different local
# path for your DAP server
mkdir ~/repos
cd ~/repos

# This is the debugger adapter for node, you need to build it from source
git clone https://github.com/microsoft/vscode-js-debug.git
cd vscode-js-debug

# At time of writing, there are bugs on the main branch, so stick with a stable
# version; I've had luck with 1.68
git checkout v1.68.0

npm install --legacy-peer-deps
npm run compile
```

You're then good to go! You'll notice that the [dap config](./lua/dap_conf.lua)
references the path to `~/repos/vscode-js-debug`, and you can launch the
debugger with `<space>c`. All of my debugger shortcuts are prefixed by
`<space>`:

- `<space>c`: Continue (also starts a session, also can end a session if a
  session is active)
- `<space>C`: Close nvim-dap UI (but does not stop debugging session!)
- `<space>O`: Open nvim-dap UI
- `<space>s`: Step
- `<space>b`: Set breakpoint
- `<space>B`: Set conditional breakpoint

## DAP Configurations

You will see a lot of talk of DAP configurations in DAP project documentation;
for example: https://github.com/mxsdev/nvim-dap-vscode-js#configurations.

Indeed, you do usually need to tell the debugger adapter how to start your
project, where to find source-maps, etc. Instead of doing this in neovim
config, I think it's usually better to create a `launch.json` file for your
project. By VS Code convention, this file should live in `.vscode/launch.json`.
[nvim-dap](https://github.com/mfussenegger/nvim-dap) includes a plugin to load
these files, and my config (see `./lua/dap_conf.lua:94`) will always load them
when neovim starts up, just like VS Code.

One obvious advantage here is that the config stays with your project, so it
can be shared between contributors.

Another is that it's sort of a fools errand to write a general-purpose DAP
launch config. It might work for trivial learning purposes, like running a
single file with `node` or `python`, but for anything more, you'll quickly
become overwhelmed with edge-cases, and your config will become convoluted and
bloated.

Lastly, and maybe most importantly, `launch.json` files can transparently work
for VS Code users the same way they work for you. If you have a lot of peers
that use VS Code, this is a huge win, because you can maintain a debugging
setup for your project(s) that work for everyone.

Nonetheless for languages that are not convoluted (aka, not JavaScript), a
general-purpose DAP config can work. For example, you'll notice that my own
config has a general-purpose config for python!
