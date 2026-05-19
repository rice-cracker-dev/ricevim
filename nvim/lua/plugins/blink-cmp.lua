---@module 'lazy'
---@module 'blink'
---@type LazySpec
return {
  'saghen/blink.cmp',
  dependencies = { 'nvim-mini/mini.nvim' },
  event = { 'InsertEnter', 'CmdlineEnter' },

  ---@type blink.cmp.Config
  opts = {
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

    snippets = { preset = 'mini_snippets' },

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
      },
    },

    fuzzy = { implementation = 'rust' },

    keymap = {
      preset = 'enter',

      ['<c-space>'] = { 'show', 'show_documentation', 'show_signature' },
      ['<s-tab>'] = { 'select_prev', 'fallback' },
      ['<tab>'] = { 'select_next', 'fallback' },
    },
  },
}
