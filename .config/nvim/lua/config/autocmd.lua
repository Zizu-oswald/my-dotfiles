
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    -- выключаем inlay hints ТОЛЬКО после attach
    vim.lsp.inlay_hint.enable(false, { bufnr = args.buf })
  end,
})
