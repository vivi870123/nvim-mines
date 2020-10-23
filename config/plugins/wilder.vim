set wildcharm=<Tab>
cmap <expr> <Tab> wilder#in_context() ? wilder#next() : "\<Tab>"
cmap <expr> <S-Tab> wilder#in_context() ? wilder#previous() : "\<S-Tab>"

call wilder#set_option('modes', ['/', '?'])

" for lightline.vim
let s:hl = 'LightlineMiddle_active'
let s:mode_hl = 'LightlineLeft_active_0'
let s:index_hl = 'LightlineRight_active_0'


call wilder#set_option('renderer', wilder#wildmenu_renderer({
      \ 'highlights': {
      \   'default': s:hl,
      \ },
      \ 'apply_highlights': wilder#query_common_subsequence_spans(),
      \ 'separator': ' · ',
      \ 'left': [{'value': [
      \    wilder#condition(
      \      {-> getcmdtype() ==# ':'},
      \      ' COMMAND ',
      \      ' SEARCH ',
      \    ),
      \    wilder#condition(
      \      {ctx, x -> has_key(ctx, 'error')},
      \      '!',
      \      wilder#spinner({
      \        'frames': '-\|/',
      \        'done': '·',
      \      }),
      \    ), ' ',
      \ ], 'hl': s:mode_hl,},
      \ wilder#separator('', s:mode_hl, s:hl, 'left'), ' ',
      \ ],
      \ 'right': [
      \    ' ', wilder#separator('', s:index_hl, s:hl, 'right'),
      \    wilder#index({'hl': s:index_hl}),
      \ ],
      \ }))
