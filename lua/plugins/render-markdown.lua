return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown", "rmd", "quarto" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-mini/mini.icons",
    },
    opts = {
      file_types = { "markdown", "rmd", "quarto" },
      -- 插入模式保持源码，普通/命令/终端模式渲染（编辑更顺手）
      render_modes = { "n", "c", "t" },
    },
    keys = {
      {
        "<leader>mp",
        "<cmd>RenderMarkdown preview<cr>",
        desc = "Markdown 侧边预览",
        ft = { "markdown", "rmd", "quarto" },
      },
      {
        "<leader>mt",
        "<cmd>RenderMarkdown toggle<cr>",
        desc = "Markdown 渲染开关",
        ft = { "markdown", "rmd", "quarto" },
      },
    },
  },
}
