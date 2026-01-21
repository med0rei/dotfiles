return {
  -- Common Lisp
  { "vlime/vlime", rtp = "vim" },

  -- Clojure
  { "tpope/vim-fireplace", ft = "clojure" },

  -- Rust
  { "rust-lang/rust.vim" },
  {
    "cordx56/rustowl",
    version = "*",
    build = "cargo binstall rustowl",
    opts = {
      client = {
        on_attach = function(_, buffer)
          vim.keymap.set("n", "<leader>o", function()
            require("rustowl").toggle(buffer)
          end, { buffer = buffer, desc = "Toggle RustOwl" })
        end,
      },
    },
  },

  -- Go
  { "ray-x/go.nvim" },
  { "ray-x/guihua.lua" },
}
