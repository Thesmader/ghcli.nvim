fun! GhCli()
  " TODO: Comment this
  lua for k in pairs(package.loaded) do if k:match("^ghcli") then package.loaded[k] = nil end end
  lua require("ghcli").createIssue('Hello', 'World')
endfun

augroup GhCli
  autocmd!
augroup END

" command! CreateIssue lua require'ghcli'.createIssue()
"
nnoremap <leader>ghi :lua require('ghcli').createIssue()<CR>
