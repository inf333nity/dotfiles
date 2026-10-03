 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#231a1a',
    base01 = '#3b2b2c',
    base02 = '#362627',
    base03 = '#746364',
    base04 = '#b6afaf',
    base05 = '#f3f2f2',
    base06 = '#f3f2f2',
    base07 = '#f3f2f2',
    base08 = '#7c2a35',
    base09 = '#b3b186',
    base0A = '#b49b85',
    base0B = '#c18b8d',
    base0C = '#d0ceaf',
    base0D = '#d3acad',
    base0E = '#d0beaf',
    base0F = '#e4d8cd',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  -- telescope.nvim
  hi('TelescopeNormal',         { fg = '#f3f2f2',          bg = '#231a1a' })
  hi('TelescopeBorder',         { fg = '#746364',             bg = '#231a1a' })
  hi('TelescopePromptNormal',   { fg = '#f3f2f2',          bg = '#231a1a' })
  hi('TelescopePromptBorder',   { fg = '#746364',             bg = '#231a1a' })
  hi('TelescopePromptPrefix',   { fg = '#c18b8d',             bg = '#231a1a' })
  hi('TelescopePromptCounter',  { fg = '#b6afaf',  bg = '#231a1a' })
  hi('TelescopePromptTitle',    { fg = '#231a1a',             bg = '#c18b8d' })
  hi('TelescopePreviewTitle',   { fg = '#231a1a',             bg = '#b49b85' })
  hi('TelescopeResultsTitle',   { fg = '#231a1a',             bg = '#b3b186' })
  hi('TelescopeSelection',      { fg = '#f3f2f2',          bg = '#362627' })
  hi('TelescopeSelectionCaret', { fg = '#c18b8d',             bg = '#362627' })
  hi('TelescopeMatching',       { fg = '#c18b8d',             bold = true })

  -- mini.pick
  hi('MiniPickNormal',         { fg = '#f3f2f2',          bg = '#231a1a' })
  hi('MiniPickBorder',         { fg = '#746364',             bg = '#231a1a' })
  hi('MiniPickPrompt',   { fg = '#f3f2f2',          bg = '#231a1a' })
  hi('MiniPickPromptPrefix',   { fg = '#c18b8d',             bg = '#231a1a' })
  hi('MiniPickBorderText',    { fg = '#231a1a',             bg = '#c18b8d' })
  hi('MiniPickMatchCurrent',      { fg = '#f3f2f2',          bg = '#362627' })
  hi('MiniPickPromptCaret', { fg = '#c18b8d',             bg = '#362627' })
  hi('MiniPickMatchRanges',       { fg = '#c18b8d',             bold = true })
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
