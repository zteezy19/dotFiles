return {
  --tools
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "stylua",
        "selene",
        "luacheck",
        "shellcheck",
        "shfmt",
        "tailwindcss-language-server",
        "typescript-language-server",
        "css-lsp",
        -- Python tools
        "pyright",
        "black",
        "flake8",
        -- C++ tools
        "clangd",
        "clang-format",
        "cpptools",
        "cmake-language-server",
        "cpplint",
        -- Go tools
        "gopls", --go language server
        "golangci-lint", --Go linter
        "gofumpt", --Go formatter (stricter than go fmt)
        "delve", --Go debugger

        --General
        "codelldb", --Debugger for C++ and Rust (works well with cpptools)
      })
    end,
  },
}
