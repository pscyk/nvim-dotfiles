
-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- [[ Configure LSP ]]
--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function()
  -- NOTE: Remember that lua is a real programming language, and as such it is possible
  -- to define small helper and utility functions so you don't have to repeat yourself
  -- many times.
  --
  -- In this case, we create a function that lets us more easily define mappings specific
  -- for LSP related items. It sets the mode, buffer and description for us each time.
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end
  local vmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('v', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
  vmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
  nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
  nmap('<leader>sds', require('telescope.builtin').lsp_document_symbols, '[S]earch [D]oc [S]ymbols')
  nmap('<leader>sws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[S]earch [W]orkspace [S]ymbols')
  nmap('<leader>li', vim.lsp.buf.incoming_calls, '[L]ist [I]ncoming calls')
  nmap('<leader>lo', vim.lsp.buf.outgoing_calls, '[L]ist [O]utgoing calls')

  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  -- local augroup_id = vim.api.nvim_create_augroup(
  --   "FormatModificationsDocumentFormattingGroup",
  --   { clear = false }
  -- )
  -- vim.api.nvim_clear_autocmds({ group = augroup_id, buffer = bufnr })
  --
  -- vim.api.nvim_create_autocmd(
  --   { "BufWritePre" },
  --   {
  --     group = augroup_id,
  --     buffer = bufnr,
  --     callback = function()
  --       local lsp_format_modifications = require "lsp-format-modifications"
  --       lsp_format_modifications.format_modifications(client, bufnr)
  --     end,
  --   }
  -- )
end
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = on_attach,
})
