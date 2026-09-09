local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
local lazy_commit = "bef521ac89c8d423f9d092e37b58e8af0c099309"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
  vim.fn.system({ "git", "-C", lazypath, "checkout", "--detach", lazy_commit })
elseif vim.fn.isdirectory(lazypath .. "/.git") == 1 then
  local installed_commit = vim.fn.system({ "git", "-C", lazypath, "rev-parse", "HEAD" }):gsub("%s+$", "")
  if installed_commit ~= lazy_commit then
    vim.fn.system({ "git", "-C", lazypath, "fetch", "--quiet", "--depth=1", "origin", lazy_commit })
    vim.fn.system({ "git", "-C", lazypath, "checkout", "--quiet", "--detach", lazy_commit })
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({ { import = "fusionhs.plugins" }, { import = "fusionhs.plugins.lsp" } }, {
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    notify = false,
  },
})
