return {
  {
    "olimorris/persisted.nvim",
    config = function()
      local save_dir = vim.fn.stdpath("data") .. "/sessions/"
      -- Ensure sessions directory exists
      if vim.fn.isdirectory(save_dir) == 0 then
        vim.fn.mkdir(save_dir, "p")
      end
      require("persisted").setup({
        save_dir = save_dir,
        use_git_branch = true,
        autoload = true,
      })
    end,
  },
}
