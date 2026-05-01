# Neovim Config

> A small, focused Neovim setup for Python, Lua and JavaScript.

Configuracion personal de Neovim enfocada en Python, Lua y JavaScript, con una base simple en Lua, menos plugins situacionales y un stack moderno basado en `ruff`, `oil.nvim` y `lazy.nvim`.

## ✨ Que incluye

- Gestor de plugins con `lazy.nvim`
- Tema `catppuccin` y dashboard de inicio con `alpha-nvim`
- Busqueda con `telescope` y explorador de archivos con `oil.nvim`
- Barra de buffers con `barbar` y statusline con `lualine`
- LSP con `mason`, `mason-lspconfig` y `nvim-lspconfig`
- Autocompletado con `blink.cmp`
- Formateo con `conform.nvim`
- Linting con `nvim-lint`
- Integracion con Git mediante `gitsigns`
- UI mejorada para mensajes, notificaciones y cmdline con `noice.nvim`

## 🗂️ Estructura

```text
.
|-- init.lua
|-- lazy-lock.json
`-- lua/
    `-- cat/
        |-- base/
        |   |-- init.lua
        |   |-- keymaps.lua
        |   `-- options.lua
        |-- lazy.lua
        `-- plugins/
            |-- init.lua
            |-- git/
            |-- lsp/
            |-- python/
            |-- style/
            `-- utils/
```

## 🧰 Requisitos

Antes de usar esta configuracion necesitas tener instalado:

- `nvim` 0.12+
- `git`
- `make` para compilar `telescope-fzf-native`
- `ripgrep` para `Telescope live_grep`
- `node` para herramientas instaladas por Mason y parte del ecosistema JS
- `python3`

## 🚀 Instalacion

### 1. 🍺 Instalar dependencias con Homebrew

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install neovim git make ripgrep node python
```

Herramientas como `stylua`, `prettierd`, `eslint_d` y `ruff` se instalan automaticamente con Mason al abrir Neovim.

Si prefieres tener algunas herramientas tambien fuera de Neovim:

```sh
npm install -g prettier prettierd eslint_d
```

### 2. 📥 Clonar la configuracion

Neovim busca su configuracion en `~/.config/nvim`, asi que este repositorio debe vivir ahi:

```sh
git clone https://github.com/tyr-lab/nvim ~/.config/nvim
```

### 3. ▶️ Abrir Neovim

```sh
nvim
```

En el primer arranque `lazy.nvim` se instala automaticamente y despues descarga el resto de plugins.

## 🧪 Lenguajes y herramientas configuradas

### LSP instalados automaticamente con Mason

- `bashls`
- `cssls`
- `html`
- `ts_ls`
- `lua_ls`
- `jsonls`
- `pyright`
- `ruff`

### Formateadores

- Lua: `stylua`
- Python: `ruff_fix`, `ruff_format`
- JavaScript y JSON: `prettierd`, `prettier`

### Linters

- JavaScript, TypeScript, React y Svelte: `eslint_d`
- Python: `ruff`

### Treesitter

Lenguajes asegurados por defecto:

- `lua`
- `python`
- `javascript`

## 🧩 Plugins por categoria

### Base

- `lazy.nvim`: gestor de plugins
- `plenary.nvim`: utilidades Lua para plugins
- `nvim-web-devicons`: iconos

### Interfaz y aspecto

- `catppuccin`: tema principal (`macchiato`)
- `alpha-nvim`: pantalla de inicio
- `lualine.nvim`: statusline
- `barbar.nvim`: buffers en pestañas
- `which-key.nvim`: ayuda de atajos
- `indent-blankline.nvim`: guias de indentacion
- `vim-illuminate`: resalta simbolos relacionados
- `rainbow-delimiters.nvim`: delimitadores coloreados
- `beacon.nvim`: resalta el cursor tras saltos
- `noice.nvim`: mejora mensajes y UI de Neovim
- `nvim-notify`: notificaciones
- `nvzone/minty`: utilidades visuales (`:Shades`, `:Huefy`)

### Navegacion y archivos

- `telescope.nvim`: busqueda difusa
- `telescope-fzf-native.nvim`: mejora de rendimiento para Telescope
- `oil.nvim`: explorador de archivos estilo buffer

### Edicion

- `nvim-treesitter`: resaltado y soporte estructural
- `nvim-surround`: manipular pares y envolturas
- `nvim-autopairs`: cierre automatico de pares
- `Comment.nvim`: comentarios con atajos
- `bigfile.nvim`: mejora rendimiento en archivos grandes

### Git

- `gitsigns.nvim`: hunks, blame y diff inline

### LSP, formato y lint

- `mason.nvim`: instalacion de herramientas
- `mason-lspconfig.nvim`: puente entre Mason y LSP
- `mason-nvim-lint`: soporte para linters
- `mason-conform.nvim`: soporte para formateadores
- `nvim-lspconfig`: configuracion de LSP
- `blink.cmp`: autocompletado
- `conform.nvim`: formateo
- `nvim-lint`: linting
- `fidget.nvim`: estado de LSP
- `lazydev.nvim`: soporte extra para Lua en Neovim

## ⌨️ Atajos principales

La tecla leader es `Espacio`.

### Generales

- `<C-s>`: guardar archivo
- `<Esc>`: limpiar highlights de busqueda
- `<leader>fm`: formatear archivo
- `<leader>tn`: activar o desactivar numeros de linea
- `<leader>tr`: activar o desactivar numeros relativos
- `<leader>/`: comentar linea o seleccion

### Ventanas

- `<C-h>` `<C-j>` `<C-k>` `<C-l>`: moverse entre ventanas

### Telescope

- `<leader>ff`: buscar archivos
- `<leader>fa`: buscar todos los archivos, incluidos ocultos
- `<leader>fw`: buscar texto con `live_grep`
- `<leader>fb`: listar buffers
- `<leader>fh`: ayuda
- `<leader>fo`: archivos recientes
- `<leader>fz`: busqueda en el buffer actual
- `<leader>cm`: commits Git
- `<leader>gt`: estado Git
- `<leader>pt`: listado de pickers de Telescope

### LSP

- `K`: hover
- `gd`: ir a definicion
- `gD`: ir a declaracion
- `gi`: ir a implementacion
- `gr`: referencias
- `<leader>rn`: renombrar simbolo
- `<leader>ca`: code actions
- `<leader>fd`: diagnostico flotante
- `[d` / `]d`: diagnostico anterior o siguiente

### Explorador y buffers

- `<C-n>`: abrir `oil`
- `<leader>e`: abrir `oil`
- `-`: abrir el directorio padre con `oil`
- `<Tab>`: siguiente buffer
- `<S-Tab>`: buffer anterior
- `<leader>x`: cerrar buffer

### Git

- `]h` / `[h`: siguiente o anterior hunk
- `<leader>hs`: stage hunk
- `<leader>hr`: reset hunk
- `<leader>hS`: stage buffer
- `<leader>hR`: reset buffer
- `<leader>hu`: deshacer stage del hunk
- `<leader>hp`: previsualizar hunk
- `<leader>hb`: blame de linea
- `<leader>hB`: activar o desactivar blame inline
- `<leader>hd`: diff actual

### Noice

- `<leader>nh`: historial de mensajes
- `<leader>nd`: cerrar notificaciones visibles

## 🛠️ Comandos utiles

- `:Lazy`: gestionar plugins
- `:Mason`: gestionar LSPs, linters y formateadores
- `:checkhealth`: comprobar estado general de Neovim
- `:Noice`: abrir historial de mensajes y utilidades de Noice
- `:Oil`: abrir el explorador de archivos

## ⚙️ Opciones base de la configuracion

Esta configuracion activa por defecto:

- portapapeles del sistema con `unnamedplus`
- indentacion de 4 espacios
- numeros de linea
- `splitbelow` y `splitright`
- `cursorline`
- soporte para colores verdaderos
- `undofile`

## 📌 Notas

- El foco principal actual de esta configuracion esta en Python, Lua y JavaScript.
- La configuracion usa `ruff` como base moderna para Python y `oil.nvim` como explorador principal.
- Algunas herramientas se instalan via Mason y otras pueden existir en tu sistema si prefieres reutilizarlas fuera de Neovim.
- Si algo no funciona, ejecuta `:checkhealth`, `:Lazy` y `:Mason` para localizar rapido la dependencia que falta.

## 🧭 Mejoras futuras razonables

- Añadir capturas o GIFs del dashboard, Telescope y flujo Python.
- Incluir una seccion de troubleshooting para errores comunes de Mason, Blink y Treesitter.
