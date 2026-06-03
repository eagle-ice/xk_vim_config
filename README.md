# Neovim 配置（LazyVim）

基于 [LazyVim](https://lazyvim.github.io/) 的 Neovim 配置。

**LazyVim 配置本身跨平台**（WSL、原生 Linux、Windows 均可使用）。本文档主要按 **WSL2 + tmux + Cursor** 编写，其他平台见 [多平台说明](#多平台说明)。

---

## 环境要求

| 组件 | 说明 |
|------|------|
| Neovim | >= 0.11.2（当前推荐 0.12.x） |
| Git | 插件管理 |
| ripgrep (`rg`) | 全文搜索 |
| fd (`fdfind`) | 文件搜索 / Explorer |
| lazygit | Git TUI |
| tree-sitter CLI | 通过 Mason 安装，见下方 PATH 说明 |
| 终端字体 | **Nerd Font**（如 CaskaydiaMono Nerd Font），否则图标显示为方框 |

### 推荐：Mason 工具加入 PATH

在 `~/.bashrc` 中添加：

```bash
export PATH="$HOME/.local/share/nvim/mason/bin:$PATH"
```

### 推荐：终端 Nerd Font（WSL / Cursor）

WSL 下字体由 **Windows 终端**渲染，需在 Cursor / Windows Terminal 中指定 Nerd Font：

```json
"terminal.integrated.fontFamily": "'CaskaydiaMono Nerd Font', 'CaskaydiaMono NF', monospace"
```

修改字体后需 **完全重启 Cursor**，若使用 tmux 则执行 `tmux kill-server` 后重开。

### 推荐：tmux 配置（WSL / Linux）

```tmux
set-option -g focus-events on
set-option -a terminal-features 'xterm-256color:RGB'
```

---

## 多平台说明

### 总览

| | WSL2 | 原生 Linux | Windows 原生 |
|---|:---:|:---:|:---:|
| LazyVim 配置（`lua/`） | ✅ | ✅ | ✅ |
| 配置目录 | `~/.config/nvim` | `~/.config/nvim` | `%LOCALAPPDATA%\nvim` |
| Neovim / Mason / LSP | WSL 内独立安装 | 本机独立安装 | 本机独立安装 |
| 系统工具（rg、fd 等） | WSL 内安装 | 本机安装 | 本机安装 |
| Nerd Font | Windows 终端设置 | Linux 终端设置 | Windows 字体设置 |
| tmux | ✅ 常用 | ✅ 常用 | ❌ 一般不用 |
| 剪贴板与 Windows 互通 | ✅ `win32yank` | ❌ | ✅ 内置 |

> **同一份 Git 仓库可以同步到各平台**，但 Neovim、Mason 工具、Treesitter parser 需要在**每个环境分别安装**，不能共用。

---

### 各平台通用部分

以下内容在 WSL / Linux / Windows 上**完全一致**，无需修改：

- `init.lua`、`lua/config/`、`lua/plugins/` 中的配置
- 快捷键、插件、LSP、补全、Treesitter 逻辑
- `:Lazy`、`:Mason`、`:LazyExtras`、`:checkhealth` 等命令

---

### WSL2（当前主要环境）

**配置路径**：`~/.config/nvim`（WSL 文件系统内）

**安装 Neovim**：

```bash
# 官方预编译包或发行版源，需 >= 0.11.2
nvim --version
```

**安装系统工具**（Ubuntu / Debian）：

```bash
sudo apt update
sudo apt install git ripgrep fd-find lazygit curl unzip tar
# Ubuntu 上 fd 命令为 fdfind，LazyVim 已兼容
```

**Mason PATH**（`~/.bashrc`）：

```bash
export PATH="$HOME/.local/share/nvim/mason/bin:$PATH"
```

**Nerd Font**：在 Windows 安装字体，于 **Cursor / Windows Terminal** 中设置（见上方 [环境要求](#环境要求)）。WSL 本身不渲染字体。

**剪贴板**：LazyVim 自动使用 `win32yank`，与 Windows 剪贴板互通（`:checkhealth vim.provider` 中应显示 OK）。

**首次使用**：

```bash
nvim
# 等待插件安装完成
:Lazy
:Mason
:checkhealth
```

---

### 原生 Linux

**配置路径**：`~/.config/nvim`

**安装 Neovim**（按发行版选择）：

```bash
# Arch
sudo pacman -S neovim

# Fedora
sudo dnf install neovim

# Ubuntu（若版本过旧，建议用官方 AppImage 或源码）
sudo apt install neovim
```

**安装系统工具**：

```bash
# Arch
sudo pacman -S git ripgrep fd lazygit

# Fedora
sudo dnf install git ripgrep fd lazygit

# Ubuntu / Debian
sudo apt install git ripgrep fd-find lazygit
```

**Mason PATH**（`~/.bashrc` 或 `~/.zshrc`）：

```bash
export PATH="$HOME/.local/share/nvim/mason/bin:$PATH"
```

**Nerd Font**：在 Linux 桌面环境中安装并设置，例如：

```bash
# 示例：下载并安装到用户字体目录
mkdir -p ~/.local/share/fonts
# 将 Nerd Font .ttf 放入上述目录后
fc-cache -fv
```

然后在终端模拟器（Alacritty、Kitty、GNOME Terminal 等）中将字体设为 `JetBrainsMono Nerd Font` 或 `CaskaydiaMono Nerd Font`。

**剪贴板**：需安装 `xclip` 或 `wl-clipboard`（Wayland）：

```bash
# X11
sudo apt install xclip          # Debian / Ubuntu
sudo pacman -S xclip            # Arch

# Wayland
sudo apt install wl-clipboard   # Debian / Ubuntu
```

**与 WSL 的差异**：忽略 README 中 Cursor/Windows 字体、tmux（若不用）相关说明；其余快捷键和配置用法相同。

---

### Windows 原生 Neovim

**配置路径**：`%LOCALAPPDATA%\nvim`（通常为 `C:\Users\<用户名>\AppData\Local\nvim`）

> 若已在 WSL 有配置，Windows 原生 Neovim **不会自动读取** WSL 的 `~/.config/nvim`，需单独 clone 或符号链接。

**安装 Neovim**：

- [Neovim Windows 发布页](https://github.com/neovim/neovim/releases) 下载 `nvim-win64.msi` 或 zip
- 或使用 `winget install Neovim.Neovim`

**安装系统工具**（推荐 [Scoop](https://scoop.sh/) 或 [Chocolatey](https://chocolatey.org/)）：

```powershell
# Scoop
scoop install git ripgrep fd lazygit

# Chocolatey
choco install git ripgrep fd lazygit
```

**Mason PATH**：将 `%LOCALAPPDATA%\nvim-data\mason\bin` 加入 Windows 用户环境变量 PATH。

**Nerd Font**：在 Windows 安装 Nerd Font，于 **Windows Terminal** 或 **Neovim 所用终端** 中设置字体。

**与 WSL 的差异**：

| 项目 | 说明 |
|------|------|
| 路径分隔符 | Mason、插件数据在 Windows 路径下，与 WSL 互不影响 |
| 浮动终端 | LazyVim 终端功能使用 PowerShell / cmd |
| lazygit | 直接调用 Windows 版 lazygit |
| tmux | 通常不使用，可忽略 tmux 相关说明 |
| fd | Windows 上命令通常为 `fd`，不是 `fdfind` |

**PowerShell 中启动**：

```powershell
nvim
nvim .
```

---

### 跨平台同步配置

推荐用 Git 管理 `nvim` 配置目录，在各平台 clone 到对应路径：

```bash
# WSL / Linux
git clone <repo-url> ~/.config/nvim

# Windows（PowerShell）
git clone <repo-url> $env:LOCALAPPDATA\nvim
```

**每个环境首次 clone 后需分别执行**：

1. 安装 Neovim 及系统工具（rg、fd、lazygit 等）
2. 配置终端 Nerd Font
3. 打开 Neovim → 等待 `:Lazy` 自动安装插件
4. `:Mason` 安装所需 LSP / Formatter
5. `:checkhealth` 确认无 ERROR

**不要同步 / 不要跨平台共用的内容**（已在 `.gitignore` 或不应入库）：

| 路径 | 说明 |
|------|------|
| `~/.local/share/nvim/lazy/` | 插件本体，各平台自动生成 |
| `~/.local/share/nvim/mason/` | Mason 工具，各平台分别安装 |
| `~/.local/share/nvim/site/` | Treesitter parser，各平台分别编译 |
| `lazy-lock.json` | 可入库，用于锁定插件版本 |

---

## 快速开始

```bash
nvim              # 启动，显示 Dashboard
nvim .            # 打开当前目录
nvim foo.py       # 打开指定文件
```

**Leader 键**：空格 `Space`（LazyVim 默认）

不确定快捷键时，按 `<Space>` 稍等，底部会弹出 **which-key** 菜单。

---

## 必记快捷键

### 文件与搜索

| 按键 | 功能 |
|------|------|
| `<Space>ff` | 查找文件（项目根目录） |
| `<Space>fF` | 查找文件（当前目录） |
| `<Space>fr` | 最近打开的文件 |
| `<Space>fb` | 切换已打开的 Buffer |
| `<Space>/` | 项目内 grep 搜索 |
| `<Space>sg` | 项目内 live grep |
| `<Space>e` | 文件树（项目根） |
| `<Space>E` | 文件树（当前目录） |

Picker 内：`j/k` 移动，`Enter` 打开，`Esc` 关闭。

### 窗口与 Buffer

| 按键 | 功能 |
|------|------|
| `Ctrl-h/j/k/l` | 窗口间切换 |
| `<Space>\|` | 垂直分屏 |
| `<Space>-` | 水平分屏 |
| `<Space>wd` | 关闭当前窗口 |
| `Shift-h` / `Shift-l` | 上一个 / 下一个 Buffer |
| `<Space>bd` | 关闭当前 Buffer |
| `Ctrl-s` | 保存 |

### 编辑

| 按键 | 功能 |
|------|------|
| `gcc` | 注释 / 取消注释当前行 |
| `gc` + 动作 | 注释选中区域（可视模式） |
| `Alt-j` / `Alt-k` | 上下移动当前行 |
| `u` | 撤销 |

### LSP（打开代码文件后）

| 按键 | 功能 |
|------|------|
| `gd` | 跳转到定义 |
| `gr` | 查看引用 |
| `K` | 悬停文档 |
| `<Space>ca` | 代码动作（修复、导入等） |
| `<Space>cr` | 重命名符号 |
| `<Space>cf` | 格式化 |
| `]d` / `[d` | 下一个 / 上一个诊断 |

### Git

| 按键 | 功能 |
|------|------|
| `<Space>gg` | Lazygit（项目根） |
| `<Space>gG` | Lazygit（当前目录） |
| `<Space>gl` | Git 提交历史 |
| `<Space>gb` | 当前行 Blame |

### 终端

| 按键 | 功能 |
|------|------|
| `<Space>ft` | 浮动终端（项目根） |
| `<Space>fT` | 浮动终端（当前目录） |
| `Ctrl-/` | 聚焦 / 切换终端 |

### 补全（插入模式）

输入时自动弹出补全菜单（blink.cmp）：

| 按键 | 功能 |
|------|------|
| `Enter` | 确认补全 |
| `Ctrl-y` | 选中并确认 |
| `Tab` | Snippet 跳转 / 补全相关 |
| `:` 命令行 | 同样支持补全 |

### 其他常用

| 按键 | 功能 |
|------|------|
| `<Space>l` | 打开 Lazy 插件管理 |
| `<Space>cm` | 打开 Mason（LSP / 工具安装） |
| `<Space>sk` | 搜索所有快捷键 |
| `<Space>qq` | 退出 Neovim |
| `<Space>ur` | 清除搜索高亮并重绘 |
| `\r` | 运行 Lua 代码（仅在 `.lua` 文件中，localleader） |

---

## 常用命令

```vim
:Lazy              " 插件管理（安装 / 更新 / 禁用）
:LazyExtras        " 按语言启用扩展（Python、TypeScript 等）
:Mason             " 安装 LSP、Formatter、Linter
:TSInstall <lang>  " 安装 Treesitter 语法解析器
:TSUpdate          " 更新所有 Treesitter 解析器
:checkhealth       " 环境健康检查
:LazyHealth        " 插件健康检查
```

维护：

```vim
:Lazy update       " 更新所有插件
:MasonUpdate       " 更新 Mason 工具注册表
```

---

## 按语言上手

1. 打开 Neovim，执行 `:LazyExtras`
2. 搜索并启用对应语言，例如：
   - `lang.python` — Python
   - `lang.typescript` — TypeScript / TSX
   - `lang.json` — JSON
3. 执行 `:Mason`，确认相关 LSP 已安装（如 `pyright`、`lua-language-server`）
4. 打开对应文件，等待 LSP 自动 attach

**示例：Python 项目**

```bash
cd ~/myproject && nvim .
```

打开 `.py` 文件 → 补全、`K` 看文档、`gd` 跳转、`<Space>cf` 格式化。

---

## 配置目录结构

```
~/.config/nvim/
├── init.lua                 # 入口
├── lazy-lock.json           # 插件版本锁定
├── lazyvim.json             # LazyVim extras 状态
├── stylua.toml              # Lua 代码格式化规则
└── lua/
    ├── config/
    │   ├── lazy.lua         # lazy.nvim 启动配置
    │   ├── options.lua      # Vim 选项（缩进、leader 等）
    │   ├── keymaps.lua      # 自定义快捷键
    │   └── autocmds.lua     # 自动命令
    └── plugins/
        └── example.lua      # 插件配置示例（当前未启用）
```

### 自定义入口

| 文件 | 用途 |
|------|------|
| `lua/config/options.lua` | 修改 leader、行号、缩进等 |
| `lua/config/keymaps.lua` | 添加个人快捷键 |
| `lua/config/autocmds.lua` | 自动命令 |
| `lua/plugins/*.lua` | 新增或覆盖插件配置 |

### 示例：修改 Leader 键

编辑 `lua/config/options.lua`：

```lua
vim.g.mapleader = "\\"
vim.g.maplocalleader = " "
```

修改后重启 Neovim。Leader 与 localleader 不能设为同一按键。

### 示例：添加插件

新建 `lua/plugins/theme.lua`：

```lua
return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
  },
}
```

保存后执行 `:Lazy sync` 或重启 Neovim。

> `lua/plugins/example.lua` 内含更多示例（禁用插件、覆盖 LazyVim 配置等），默认可忽略。

---

## 本配置特点

- **发行版**：[LazyVim](https://github.com/LazyVim/LazyVim) starter 模板
- **主题**：tokyonight（默认）
- **文件搜索**：Snacks Picker（非 Telescope）
- **补全**：blink.cmp
- **文件树**：Snacks Explorer
- **通知 / UI**：noice.nvim + snacks.nvim
- **Extras**：未额外启用（`lazyvim.json` 中 `extras` 为空）

---

## 故障排查

### 图标显示为方框 / 问号

终端未使用 Nerd Font。按平台处理：

| 平台 | 做法 |
|------|------|
| WSL | Windows 安装字体 → Cursor / Windows Terminal 设置字体 → 重启 Cursor 和 tmux |
| Linux | 安装字体到 `~/.local/share/fonts` → `fc-cache -fv` → 终端设置 Nerd Font |
| Windows | 安装字体 → Windows Terminal 设置字体 → 重启终端 |

验证：

```bash
echo -e "\ue712 \uf023"
```

应显示图标而非方框。

### `:checkhealth` 报 tree-sitter-cli 未找到

Mason 已安装但 PATH 未生效。确保 `~/.bashrc` 中有 Mason bin 路径，或先执行 `:Mason` 再 `:checkhealth`。

### 主题颜色偏淡

tmux 未开启真彩色。在 `~/.tmux.conf` 添加：

```tmux
set-option -a terminal-features 'xterm-256color:RGB'
```

### LSP 不工作

1. `:Mason` 确认语言服务器已安装
2. `:LazyExtras` 确认对应语言扩展已启用
3. `:checkhealth vim.lsp` 查看详情
4. 打开对应类型文件（LSP 在打开文件后 attach）

### 插件更新后异常

```vim
:Lazy sync
:TSUpdate
:MasonUpdate
```

仍有问题可删除 `~/.local/share/nvim/lazy` 后重启 Neovim 重新拉取插件。

---

## 学习资源

- [LazyVim 官方文档](https://lazyvim.github.io/)
- [LazyVim 快捷键说明](https://lazyvim.github.io/keymaps)
- [Neovim 官方文档](https://neovim.io/doc/)
- 配置内搜索快捷键：`<Space>sk`
- **个人自定义快捷键**：[KEYMAPS.md](./KEYMAPS.md)

---

## 许可

见 [LICENSE](./LICENSE)。
