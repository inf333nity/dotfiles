 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#1a1d23',
    base01 = '#2b303b',
    base02 = '#262b36',
    base03 = '#636873',
    base04 = '#afb1b6',
    base05 = '#f2f2f3',
    base06 = '#f2f2f3',
    base07 = '#f2f2f3',
    base08 = '#fd4663',
    base09 = '#aa70c2',
    base0A = '#7d6dc5',
    base0B = '#7f96cd',
    base0C = '#caa6d9',
    base0D = '#a3b4db',
    base0E = '#aea4db',
    base0F = '#cec8e9',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  -- telescope.nvim
  hi('TelescopeNormal',         { fg = '#f2f2f3',          bg = '#1a1d23' })
  hi('TelescopeBorder',         { fg = '#636873',             bg = '#1a1d23' })
  hi('TelescopePromptNormal',   { fg = '#f2f2f3',          bg = '#1a1d23' })
  hi('TelescopePromptBorder',   { fg = '#636873',             bg = '#1a1d23' })
  hi('TelescopePromptPrefix',   { fg = '#7f96cd',             bg = '#1a1d23' })
  hi('TelescopePromptCounter',  { fg = '#afb1b6',  bg = '#1a1d23' })
  hi('TelescopePromptTitle',    { fg = '#1a1d23',             bg = '#7f96cd' })
  hi('TelescopePreviewTitle',   { fg = '#1a1d23',             bg = '#7d6dc5' })
  hi('TelescopeResultsTitle',   { fg = '#1a1d23',             bg = '#aa70c2' })
  hi('TelescopeSelection',      { fg = '#f2f2f3',          bg = '#262b36' })
  hi('TelescopeSelectionCaret', { fg = '#7f96cd',             bg = '#262b36' })
  hi('TelescopeMatching',       { fg = '#7f96cd',             bold = true })

  -- mini.pick
  hi('MiniPickNormal',         { fg = '#f2f2f3',          bg = '#1a1d23' })
  hi('MiniPickBorder',         { fg = '#636873',             bg = '#1a1d23' })
  hi('MiniPickPrompt',   { fg = '#f2f2f3',          bg = '#1a1d23' })
  hi('MiniPickPromptPrefix',   { fg = '#7f96cd',             bg = '#1a1d23' })
  hi('MiniPickBorderText',    { fg = '#1a1d23',             bg = '#7f96cd' })
  hi('MiniPickMatchCurrent',      { fg = '#f2f2f3',          bg = '#262b36' })
  hi('MiniPickPromptCaret', { fg = '#7f96cd',             bg = '#262b36' })
  hi('MiniPickMatchRanges',       { fg = '#7f96cd',             bold = true })
end

-- Register a signal handler for SIGUSR1 (matugen updates).
-- The handler re-requires this module, which re-runs the code below, so the
-- previous handle is stopped first; otherwise handlers double on every signal.
if _G.__matugen_signal then
  _G.__matugen_signal:stop()
  _G.__matugen_signal:close()
end

local signal = vim.uv.new_signal()
_G.__matugen_signal = signal
signal:start(
  'sigusr1',
  vim.schedule_wrap(function()
    package.loaded['matugen'] = nil
    require('matugen').setup()
  end)
)

return M
