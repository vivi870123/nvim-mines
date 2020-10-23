" Color Tweaks

if !exists('g:syntax_on')
  syntax on
endif

" TODO Need to test in Windows
if has('nvim') && has('termguicolors')
  " highlight default link NormalFloat Pmenu
  highlight NormalFloat guibg=#32302f
endif

" highlighting strings inside C comments.
let c_comment_strings = 1


" Highlights: General GUI {{{
" ======================
highlight VertSplit guifg=#212C32

highlight HighlightedyankRegion term=bold ctermbg=0 guibg=#13354A

highlight SignColumn ctermfg=187 ctermbg=NONE guifg=#ebdbb2 guibg=NONE guisp=NONE cterm=NONE gui=NONE
highlight CursorLine cterm=NONE ctermbg=233
highlight CursorLineNr guibg=NONE
highlight clear LineNr

hi Normal ctermbg=NONE ctermfg=NONE
hi LineNr ctermbg=NONE ctermfg=grey
hi StatusLine ctermbg=NONE
hi TabLine ctermbg=NONE
hi TabLineFill ctermbg=NONE

highlight! link jsFutureKeys PreProc
highlight! WarningMsg  ctermfg=100 guifg=#CCC566
highlight EasyMotionTargetDefault guifg=#ffb400

" Matchparens
highlight! MatchParen  ctermfg=NONE guifg=NONE ctermbg=236 guibg=#2d3c42
highlight! ParenMatch  ctermfg=NONE guifg=NONE ctermbg=236 guibg=#494d2a

" Cursorword plugin:
highlight! CursorWord0 ctermfg=NONE guifg=NONE ctermbg=236 guibg=#2b2a22

" " Pmenu Colors
" hi PMenuSel ctermfg=252 ctermbg=106 guifg=#d0d0d0 guibg=#ba8baf guisp=#ba8baf cterm=NONE gui=NONE
hi Pmenu ctermfg=103 ctermbg=236 guifg=#9a9aba guibg=#34323e guisp=NONE cterm=NONE gui=NONE
hi PmenuSbar ctermfg=NONE ctermbg=234 guifg=NONE guibg=#212026 guisp=NONE cterm=NONE gui=NONE
hi PmenuSel ctermfg=NONE ctermbg=60 guifg=NONE guibg=#5e5079 guisp=NONE cterm=NONE gui=NONE
hi PmenuThumb ctermfg=NONE ctermbg=60 guifg=NONE guibg=#5d4d7a guisp=NONE cterm=NONE gui=NONE

" }}}
" Plugin: vim-bookmarks {{{
" ---------------------
highlight! BookmarkSign            ctermfg=12 guifg=#4EA9D7
highlight! BookmarkAnnotationSign  ctermfg=11 guifg=#EACF49

" }}}
" Plugin: Magit highlight {{{
" -----------------------
highlight  gitInfoRepotitle    guibg=NONE guisp=NONE gui=bold cterm=bold
highlight  gitInfoHeadtitle   guibg=NONE guisp=NONE gui=bold cterm=bold
highlight  gitInfoUpstreamtitle  guibg=NONE guisp=NONE gui=bold cterm=bold
highlight  gitInfoPushtitle   guibg=NONE guisp=NONE gui=bold cterm=bold
highlight  gitCommitModetitle  guibg=NONE guisp=NONE gui=bold cterm=bold

highlight  gitSectionsStaged guifg=#0087d7 guibg=NONE guisp=NONE gui=bold cterm=bold
highlight  gitSectionsUnstaged guifg=#0087d7 guibg=NONE guisp=NONE gui=bold cterm=bold
highlight  gitSectionsCommitMsg guifg=#0087d7 guibg=NONE guisp=NONE gui=bold cterm=bold
highlight  gitSectionsCommitStash  guifg=#0087d7 guibg=NONE guisp=NONE gui=bold cterm=bold
highlight  gitSectionsRecentCommit guifg=#0087d7 guibg=NONE guisp=NONE gui=bold cterm=bold

" }}}

" TSX highlight {{{
" -------------
" dark red
hi tsxTagName guifg=#E06C75

" orange
hi tsxCloseString guifg=#F99575
hi tsxCloseTag guifg=#F99575
hi tsxAttributeBraces guifg=#F99575
hi tsxEqual guifg=#F99575
" light-grey
hi tsxTypeBraces guifg=#999999
" dark-grey
hi tsxTypes guifg=#666666
hi ReactState guifg=#C176A7
hi ReactProps guifg=#D19A66
hi ApolloGraphQL guifg=#CB886B
hi Events ctermfg=204 guifg=#56B6C2
hi ReduxKeywords ctermfg=204 guifg=#C678DD
hi ReduxHooksKeywords ctermfg=204 guifg=#C176A7
hi WebBrowser ctermfg=204 guifg=#56B6C2
hi ReactLifeCycleMethods ctermfg=204 guifg=#D19A66
" yellow
hi tsxAttrib guifg=#F8BD7F cterm=italic

" }}}

" Wrong spell words have black text.
highlight SpellBad ctermfg=0
highlight SpellLocal ctermfg=0
highlight SpellCap ctermfg=0
highlight SpellRare ctermfg=0

hi! ALEError guifg=#ff727b ctermfg=NONE guibg=NONE ctermbg=NONE gui=undercurl cterm=undercurl guisp=#9d0006
hi! ALEWarning guifg=#fabd2f ctermfg=NONE guibg=NONE ctermbg=NONE gui=undercurl cterm=undercurl guisp=#b57614
hi! ALEInfo guifg=#83a598 ctermfg=NONE guibg=NONE ctermbg=NONE gui=undercurl cterm=undercurl

hi! link CocErrorHighlight ALEError
hi! link CocWarningHighlight ALEWarning
hi! link CocErrorFloat ALEError
hi! link CocWarningFloat ALEWarning


" Plugin: vim-choosewin {{{
" ---
let g:choosewin_color_label = {
			\ 'cterm': [  75, 233 ], 'gui': [ '#7f99cd', '#000000' ] }
let g:choosewin_color_label_current = {
			\ 'cterm': [ 228, 233 ], 'gui': [ '#D7D17C', '#000000' ] }
let g:choosewin_color_other = {
			\ 'cterm': [ 235, 235 ], 'gui': [ '#232323', '#000000' ] }
" }}}

" vim: set foldmethod=marker ts=2 sw=0 tw=80 noet :
