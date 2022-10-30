local status_ok, autopair = pcall(require, "nvim-autopairs")
if not status_ok then
    return
end

autopair.setup({
    check_ts = true,
    disable_filetype = { "TelescopePrompt" , "vim" },
})

local cmp_autopairs = require "nvim-autopairs.completion.cmp"

local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
    return
end
-- autopairs
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)
