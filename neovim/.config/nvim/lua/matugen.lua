 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#1a1c23',
    base01 = '#2b2e3b',
    base02 = '#262936',
    base03 = '#636773',
    base04 = '#afb0b6',
    base05 = '#f2f2f3',
    base06 = '#f2f2f3',
    base07 = '#f2f2f3',
    base08 = '#fd4663',
    base09 = '#a785ad',
    base0A = '#8d7cb6',
    base0B = '#8b96c1',
    base0C = '#cbafd0',
    base0D = '#acb4d3',
    base0E = '#b8add1',
    base0F = '#d4cde4',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  -- telescope.nvim
  hi('TelescopeNormal',         { fg = '#f2f2f3',          bg = '#1a1c23' })
  hi('TelescopeBorder',         { fg = '#636773',             bg = '#1a1c23' })
  hi('TelescopePromptNormal',   { fg = '#f2f2f3',          bg = '#1a1c23' })
  hi('TelescopePromptBorder',   { fg = '#636773',             bg = '#1a1c23' })
  hi('TelescopePromptPrefix',   { fg = '#8b96c1',             bg = '#1a1c23' })
  hi('TelescopePromptCounter',  { fg = '#afb0b6',  bg = '#1a1c23' })
  hi('TelescopePromptTitle',    { fg = '#1a1c23',             bg = '#8b96c1' })
  hi('TelescopePreviewTitle',   { fg = '#1a1c23',             bg = '#8d7cb6' })
  hi('TelescopeResultsTitle',   { fg = '#1a1c23',             bg = '#a785ad' })
  hi('TelescopeSelection',      { fg = '#f2f2f3',          bg = '#262936' })
  hi('TelescopeSelectionCaret', { fg = '#8b96c1',             bg = '#262936' })
  hi('TelescopeMatching',       { fg = '#8b96c1',             bold = true })

  -- mini.pick
  hi('MiniPickNormal',         { fg = '#f2f2f3',          bg = '#1a1c23' })
  hi('MiniPickBorder',         { fg = '#636773',             bg = '#1a1c23' })
  hi('MiniPickPrompt',   { fg = '#f2f2f3',          bg = '#1a1c23' })
  hi('MiniPickPromptPrefix',   { fg = '#8b96c1',             bg = '#1a1c23' })
  hi('MiniPickBorderText',    { fg = '#1a1c23',             bg = '#8b96c1' })
  hi('MiniPickMatchCurrent',      { fg = '#f2f2f3',          bg = '#262936' })
  hi('MiniPickPromptCaret', { fg = '#8b96c1',             bg = '#262936' })
  hi('MiniPickMatchRanges',       { fg = '#8b96c1',             bold = true })
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
