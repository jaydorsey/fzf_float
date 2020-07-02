-- original source: https://gabrielpoca.com/2019-11-13-a-bit-more-lua-in-your-vim/
function NavigationFloatingWin()
  -- get the editor's max width and height
  local width = vim.api.nvim_get_option("columns")
  local height = vim.api.nvim_get_option("lines")

  -- create a new, scratch buffer, for fzf
  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_option(buf, 'buftype', 'nofile')

  -- if the editor is big enough
  if (width > 150 or height > 35) then
    -- fzf's window height is 3/4 of the max height, but not more than 30
    local win_height = math.min(math.ceil(height * 3 / 4), 30)
    local win_width

    -- if the width is small
    if (width < 150) then
      -- just subtract 8 from the editor's width
      win_width = math.ceil(width - 8)
    else
      -- use 90% of the editor's width
      win_width = math.ceil(width * 0.9)
    end

    -- settings for the fzf window
    local opts = {
      relative = "editor",
      width = win_width,
      height = win_height,
      -- row = math.ceil((height - win_height) / 2),
      row = 1,
      col = math.ceil((width - win_width) / 2),
    }

    -- create a new floating window, centered in the editor
    local win = vim.api.nvim_open_win(buf, true, opts)
  end
end
-- " let g:fzf_layout = { 'window': 'call FloatingFZF()' }
-- " function! FloatingFZF()
-- "   let buf = nvim_create_buf(v:false, v:true)
-- "   call setbufvar(buf, '&signcolumn', 'no')
-- "
-- "   let height = float2nr(&lines * 0.5)
-- "   let width = float2nr(&columns * 0.8)
-- "   let horizontal = float2nr((&columns - width) / 2)
-- "   let vertical = 1
-- "
-- "   let opts = {
-- "         \ 'relative': 'editor',
-- "         \ 'row': vertical,
-- "         \ 'col': horizontal,
-- "         \ 'width': width,
-- "         \ 'height': height
-- "         \ }
-- "
-- "   call nvim_open_win(buf, v:true, opts)
-- " endfunction
