local M = {}

M._fzf_delete_buffer_handler = mines.fzf:create(function(_, buffers)
  for _,v in pairs(buffers) do
    local buf = v:match('^%[([0-9]+)%]')

    if buf ~= nil then
      mines.ex.bw(buf)
    end
  end
end, { handle_all = true })

local function get_listed_buffers()
  return mines.fn.filter(vim.fn.range(1, vim.fn.bufnr('$')), function(val)
    return vim.fn.buflisted(val) == 1 and vim.fn.getbufvar(val, '&filetype') ~= 'qf'
  end)
end

local function format_buflist(buflist)
  return mines.fn.map(buflist, function(buf)
    local name = vim.fn.bufname(buf)
    local modified = vim.fn.getbufvar(buf, '&modified') == 1 and ' [+]' or ''
    local readonly = vim.fn.getbufvar(buf, '&modifiable') == 1 and '' or ' [RO]'

    name = #name == 0 and '[No Name]' or vim.fn.fnamemodify(name, ':p:~:.')

    return ('[%s] %s\t%s'):format(buf, name, modified .. readonly)
  end)
end

function M.delete_buffers_fzf()
  M._fzf_delete_buffer_handler:execute {
    source = format_buflist(get_listed_buffers()),
    options = { '--multi', '--prompt=Kill> ', '--nth=2' }
  }
end

function M.trim_trailing_whitespace()
  local saved = vim.fn.winsaveview()

  mines.command [[keeppatterns %s/\s\+$//e]]
  vim.fn.winrestview(saved)
end

return M
