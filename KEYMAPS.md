# 快捷键说明

**Leader**：空格 `Space`（LazyVim 默认）

本文档分两部分：

1. **个人自定义**（`lua/config/keymaps.lua`）— LazyVim 默认没有的功能  
2. **LazyVim 自带** — 与你旧 Vim 习惯相近的功能，直接用即可，无需重复配置

按 `<Space>` 稍等可打开 which-key 菜单浏览。

---

## 一、个人自定义（已写入配置）

### 1. Text Object：`in(` / `inw`

需配合 `v` / `d` / `c` / `y` 等操作符，**不能单独按**。

| 按键 | 作用 |
|------|------|
| `vi(` `di(` `ci(` | 从当前位置找 `(`，选中/删/改括号**内**内容 |
| `viw` `diw` `ciw` | 在 `inw` 语义下：括号后的**第一个 word** |

示例：光标在 `func(a, b)` 的 `a` 附近 → `vi(` 选中 `a, b`。

> LazyVim 内置的 `vi(` / `di(` 等（Treesitter）在光标**已在括号内**时也能用；上面这套是旧配置里「在 `(` 后面找」的行为，二者可并存。

### 2. 包裹符号

LazyVim **默认没有** surround 插件，因此保留以下映射：

| 按键 | 作用 |
|------|------|
| `<Space>"` `<Space>'` | 用引号包裹 word 或选区 |
| `<Space>(` `[` `{` | 用对应括号包裹 |

- **普通模式**：光标在 word 上  
- **可视模式**：先选中再按  

若以后启用 `:LazyExtras` → `editor.mini.surround`，可改用 `gsa"` 等，再考虑删掉本节自定义。

---

## 二、LazyVim 自带（替代旧 Vim 习惯，无需改配置）

### 终端

| 按键 | 作用 |
|------|------|
| `<Space>ft` | 浮动终端（项目根） |
| `<Space>fT` | 浮动终端（当前目录） |
| `Ctrl-/` | 聚焦 / 切换终端 |

终端内 `Ctrl-\` 再 `Ctrl-n` 回到编辑。

---

### 当前文件内搜 word / 跳转

旧配置 `<Space>fw` / `<Space>fs` + Location List **已移除**，用下面方式即可：

| 需求 | LazyVim 用法 |
|------|----------------|
| 搜光标下的 word，逐条跳 | `*` 向下 / `#` 向上，再用 `n` / `N` |
| 搜任意 pattern，逐条跳 | `/pattern` `Enter`，再 `n` / `N` |
| 当前 buffer 行列表 / 过滤 | `<Space>sb`（Buffer Lines，Picker 浮窗） |
| 整个项目搜光标下的 word | `<Space>sw`（Root）/ `<Space>sW`（cwd） |
| 整个项目 live grep | `<Space>sg` / `<Space>/` |
| 查看 Location List 窗口 | `<Space>xl` 开关 / `<Space>sl`（Picker） |

**`*` 示例**：光标在 `main` 上 → 按 `*` → 按 `n` 跳到下一处 `main`。

**`<Space>sb` 示例**：打开当前文件所有行列表，输入 `main` 过滤，回车跳转。

---

### 文件 / 搜索 / Git（常用）

| 按键 | 作用 |
|------|------|
| `<Space>ff` | 找文件 |
| `<Space>fr` | 最近文件 |
| `<Space>e` | 文件树 |
| `<Space>gg` | Lazygit |
| `<Space>l` | Lazy 插件管理 |

完整列表见 [README.md](./README.md#必记快捷键) 或 [LazyVim Keymaps](https://lazyvim.github.io/keymaps)。

---

### 注释 / 格式化 / LSP

| 按键 | 作用 |
|------|------|
| `gcc` | 注释 / 取消注释行 |
| `gc` + 动作 | 注释选区 |
| `<Space>cf` | 格式化 |
| `gd` `gr` `K` | 定义 / 引用 / 文档 |
| `<Space>ca` `<Space>cr` | 代码动作 / 重命名 |

---

## 三、旧 Vim 映射 → 现在怎么做

| 旧习惯 | 现在 |
|--------|------|
| `<leader>t/l/r` 分屏终端 | `<Space>ft` / `<Space>fT` / `Ctrl-/` |
| `<leader>fw` 本文件搜 word | `*` + `n`/`N`，或 `<Space>sb` |
| `<leader>fs` 本文件搜上次 pattern | `/` 搜过以后 `n`/`N`，或 `<Space>sb` |
| `<leader>"` 等包裹 | **仍用** `<Space>"` 等（见上一节） |
| `in(` / `inw` | **仍用** `vi(` / `viw` 等（见上一节） |

---

## 四、速查

```
【自定义，在 keymaps.lua】
  vi(  di(  ci(          括号内（in(）
  viw  diw  ciw          括号后 word（inw）
  <Space>" ' ( [ {        包裹

【LazyVim 默认，不用改配置】
  <Space>ft  fT  Ctrl-/   终端
  *  #  n  N  /             本文件搜索跳转
  <Space>sb               本文件行列表
  <Space>sw  sg  /          项目搜索
  <Space>xl               Location List
  <Space>ff  e  gg         文件 / 树 / Git
```

配置变更后重启 Neovim，或：

```vim
:source ~/.config/nvim/lua/config/keymaps.lua
```
