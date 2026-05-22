---@module 'lz.n'
---@type lz.n.PluginSpec
return {
  'blink.cmp',
  event = { 'InsertEnter', 'CmdlineEnter' },
  before = function()
    require('lz.n').trigger_load('lazydev.nvim')
  end,
  after = function()
    require('blink-cmp').setup({
      appearance = {
        nerd_font_variant = 'normal',
        kind_icons = {
          Text = '',
          Method = '',
          Function = '',
          Constructor = '',

          Field = '',
          Variable = '',
          Property = '',

          Class = '',
          Interface = '',
          Struct = '',
          Module = '󰅩',

          Unit = '',
          Value = '',
          Enum = '',
          EnumMember = '',

          Keyword = '',
          Constant = '',

          Snippet = '',
          Color = '',
          File = '',
          Reference = '',
          Folder = '',
          Event = '',
          Operator = '',
          TypeParameter = '',
        },
      },

      completion = {
        list = {
          selection = {
            preselect = false,
            auto_insert = false,
          },
        },

        trigger = {
          show_on_trigger_character = false,
        },

        documentation = {
          auto_show = true,
        },

        ghost_text = {
          enabled = true,
          show_with_menu = true,
        },

        menu = {
          draw = {
            columns = { { 'kind_icon' }, { 'kind' }, { 'label', 'label_description', gap = 1 } },
          },
        },
      },

      cmdline = {
        keymap = { preset = 'inherit' },

        completion = {
          menu = { auto_show = true },
          list = { selection = { preselect = false, auto_insert = false } },
        },
      },

      sources = {
        default = {
          'lazydev',
          'lsp',
          'path',
          'snippets',
          'buffer',
        },

        providers = {
          lazydev = {
            name = 'LazyDev',
            module = 'lazydev.integrations.blink',
            score_offset = 100,
          },

          snippets = {
            opts = {
              friendly_snippets = false, -- friendly snippet is included in the search paths below
              search_paths = vim.api.nvim_get_runtime_file('snippets', true),
            },
          },
        },
      },

      fuzzy = { implementation = 'rust' },

      keymap = {
        preset = 'enter',

        ['<c-space>'] = { 'show', 'show_documentation', 'show_signature' },
        ['<s-tab>'] = { 'select_prev', 'fallback' },
        ['<tab>'] = { 'select_next', 'fallback' },
      },
    })
  end,
}
