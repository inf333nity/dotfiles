---@type LazySpec
return {
  {
    "AstroNvim/astroui",
    opts = function(_, opts)
      opts.highlights = opts.highlights or {}
      opts.highlights.init = opts.highlights.init or {}

      local function color(n) return vim.g["base16_gui" .. n] end

      local function apply_colors()
        if not color "00" or not color "05" then return end

        local function hl(group, spec) vim.api.nvim_set_hl(0, group, spec) end

        -- Основные цвета
        hl("Normal", { fg = color "05", bg = color "00" })
        hl("NormalFloat", { fg = color "05", bg = color "00" })
        hl("FloatBorder", { fg = color "03", bg = color "00" })

        hl("CursorLine", { bg = color "02" })
        hl("Visual", { fg = color "05", bg = color "02" })

        hl("LineNr", { fg = color "03", bg = color "00" })
        hl("CursorLineNr", {
          fg = color "0D",
          bg = color "02",
          bold = true,
        })

        -- Statusline / tabline / winbar
        hl("StatusLine", {
          fg = color "05",
          bg = color "01",
        })

        hl("StatusLineNC", {
          fg = color "03",
          bg = color "01",
        })

        hl("TabLine", {
          fg = color "04",
          bg = color "01",
        })

        hl("TabLineFill", {
          fg = color "03",
          bg = color "01",
        })

        hl("TabLineSel", {
          fg = color "05",
          bg = color "02",
          bold = true,
        })

        hl("WinBar", {
          fg = color "05",
          bg = color "00",
        })

        hl("WinBarNC", {
          fg = color "03",
          bg = color "00",
        })

        -- Neo-tree
        hl("NeoTreeNormal", {
          fg = color "05",
          bg = color "00",
        })

        hl("NeoTreeNormalNC", {
          fg = color "04",
          bg = color "00",
        })

        hl("NeoTreeEndOfBuffer", {
          fg = color "00",
          bg = color "00",
        })

        hl("NeoTreeWinSeparator", {
          fg = color "02",
          bg = color "00",
        })

        hl("NeoTreeDirectoryName", {
          fg = color "0D",
          bold = true,
        })

        hl("NeoTreeDirectoryIcon", {
          fg = color "0B",
        })

        hl("NeoTreeFileName", {
          fg = color "05",
        })

        hl("NeoTreeFileNameOpened", {
          fg = color "0D",
          bold = true,
        })

        hl("NeoTreeRootName", {
          fg = color "0C",
          bold = true,
        })

        hl("NeoTreeIndentMarker", {
          fg = color "02",
        })

        hl("NeoTreeExpander", {
          fg = color "03",
        })

        hl("NeoTreeCursorLine", {
          bg = color "02",
        })

        -- Neo-tree Git
        hl("NeoTreeGitAdded", {
          fg = color "0B",
        })

        hl("NeoTreeGitModified", {
          fg = color "0A",
        })

        hl("NeoTreeGitDeleted", {
          fg = color "08",
        })

        hl("NeoTreeGitConflict", {
          fg = color "08",
          bold = true,
        })

        hl("NeoTreeGitUntracked", {
          fg = color "0C",
        })

        hl("NeoTreeGitIgnored", {
          fg = color "03",
        })
        -- Neo-tree source tabs: File / Buffers / Git
        hl("NeoTreeTabActive", {
          fg = color "00",
          bg = color "0B",
          bold = true,
        })

        hl("NeoTreeTabInactive", {
          fg = color "04",
          bg = color "01",
        })

        hl("NeoTreeTabSeparatorActive", {
          fg = color "0B",
          bg = color "01",
        })

        hl("NeoTreeTabSeparatorInactive", {
          fg = color "01",
          bg = color "01",
        })
        -- Обновляем цвета AstroUI / Heirline
        local ok, status = pcall(require, "astroui.status")

        if ok and status.heirline and status.heirline.refresh_colors then status.heirline.refresh_colors() end
      end

      -- Применяем после загрузки AstroUI
      vim.schedule(apply_colors)

      -- Повторно применяем после SIGUSR1,
      -- который используется твоим matugen.lua
      if _G.__matugen_user_signal then
        _G.__matugen_user_signal:stop()
        _G.__matugen_user_signal:close()
      end

      local signal = vim.uv.new_signal()
      _G.__matugen_user_signal = signal

      signal:start(
        "sigusr1",
        vim.schedule_wrap(function()
          vim.schedule(function() vim.schedule(apply_colors) end)
        end)
      )
    end,
  },
}
