local function createIssue(title, body)

  -- Read title
  vim.fn.inputsave()
  local title = vim.fn.input('Enter the title> ')
  vim.fn.inputrestore()

  -- Read body
  vim.fn.inputsave()
  local body = vim.fn.input('Enter the body> ')
  vim.fn.inputrestore()

  -- Call gh CLI
  local t = {title=title, body=body}
  -- String interpolation
  local cmdstring = string.gsub("gh issue create -t \"$title\" -b \"$body\"", "%$(%w+)", t)
  local result = vim.fn.systemlist(cmdstring)
  for k, v in ipairs(result) do
    result[k] = '  '..result[k]
  end

  -- Update UI
  local stats = vim.api.nvim_list_uis()[1]
  local bufHandle = vim.fn.nvim_create_buf(false, true)
  local winId = vim.api.nvim_open_win(bufHandle, true, {
    relative='editor', 
    width = stats.width - 6, 
    height = stats.height - 10,
    col = 4,
    row = 4,
  })
  vim.api.nvim_buf_set_lines(bufHandle, 0, -1, false, result)
end

return {
  createIssue = createIssue
}
