---@module 'lazy'
---@module 'snacks'
---@type LazySpec
return {
  {
    'sudo-tee/opencode.nvim',

    dependencies = {
      'MeanderingProgrammer/render-markdown.nvim',
      'saghen/blink.cmp',
      'folke/snacks.nvim',
    },

    config = function()
      require('opencode').setup({})
    end,
  },
  {
    'folke/snacks.nvim',

    ---@type snacks.Config
    opts = {
      picker = {
        actions = {
          opencode_send = function(picker)
            local selected = picker:selected({ fallback = true })
            if selected and #selected > 0 then
              local files = {}
              for _, item in ipairs(selected) do
                if item.file then
                  table.insert(files, item.file)
                end
              end
              picker:close()

              require('opencode.core').open({
                new_session = false,
                focus = 'input',
                start_insert = true,
              })

              local context = require('opencode.context')
              for _, file in ipairs(files) do
                context.add_file(file)
              end
            end
          end,
        },
        win = {
          input = {
            keys = {
              -- Use <localleader>o or any preferred key to send files to opencode
              ['<localleader>o'] = { 'opencode_send', mode = { 'n', 'i' } },
            },
          },
        },
      },
    },
  },
}
