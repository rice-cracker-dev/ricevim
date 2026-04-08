---@module 'lazy'
---@module 'blink.cmp'
---@type LazySpec
return {
  'saghen/blink.cmp',

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

    fuzzy = { implementation = 'prefer_rust_with_warning' },

    keymap = {
      preset = 'enter',

      ['<c-space>'] = { 'show', 'show_documentation', 'show_signature' },
      ['<s-tab>'] = { 'select_prev', 'fallback' },
      ['<tab>'] = { 'select_next', 'fallback' },
    },
  },
}
