return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "williamboman/mason.nvim",
    "jay-babu/mason-nvim-dap.nvim",
    "nvim-neotest/nvim-nio",
    "folke/which-key.nvim",
  },
  config = function()
    local dap = require("dap")

    dap.adapters.codelldb = {
      type = "server",
      port = "${port}",
      executable = {
        command = vim.fn.exepath("codelldb"),
        args = { "--port", "${port}" },
      },
    }

    dap.configurations.cpp = {
      {
        name = "Launch file",
        type = "codelldb",
        request = "launch",
        program = function()
          return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
      },
    }

    local dapui = require("dapui")
    dapui.setup()

    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end

    -- Updated Which-key integration to follow the new format
    local wk = require("which-key")

    wk.add({
      -- Defining a group for debugging mappings
      { "<leader>d", group = "Debug" }, -- group

      -- Adding individual mappings
      {
        "<leader>db",
        function()
          dap.toggle_breakpoint()
        end,
        desc = "Toggle Breakpoint",
      },
      {
        "<leader>dc",
        function()
          dap.continue()
        end,
        desc = "Continue",
      },
      {
        "<leader>di",
        function()
          dap.step_into()
        end,
        desc = "Step Into",
      },
      {
        "<leader>do",
        function()
          dap.step_over()
        end,
        desc = "Step Over",
      },
      {
        "<leader>dr",
        function()
          dap.repl.open()
        end,
        desc = "Open REPL",
      },

      -- Additional features can be added, such as hidden mappings
      { "<leader>dd", hidden = true }, -- example of a hidden keymap
    })
  end,
}
