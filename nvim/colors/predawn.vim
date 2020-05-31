set background=dark
if version > 580
	hi clear
	if exists("syntax_on")
		syntax reset
	endif
endif

let g:colors_name = "predawn"

hi Normal guifg=#f1f1f1 guibg=#282828 guisp=#282828 gui=NONE ctermfg=255 ctermbg=235 cterm=NONE

hi Boolean guifg=#ecec89 guibg=NONE guisp=NONE gui=NONE ctermfg=228 ctermbg=NONE cterm=NONE
hi Character guifg=#ecec89 guibg=NONE guisp=NONE gui=NONE ctermfg=228 ctermbg=NONE cterm=NONE
hi Comment guifg=#777777 guibg=NONE guisp=NONE gui=NONE ctermfg=243 ctermbg=NONE cterm=NONE
hi Conceal guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE
hi Conditional guifg=#f49d62 guibg=NONE guisp=NONE gui=NONE ctermfg=215 ctermbg=NONE cterm=NONE
hi Constant guifg=#ecec89 guibg=NONE guisp=NONE gui=NONE ctermfg=228 ctermbg=NONE cterm=NONE
hi Cursor guifg=#282828 guibg=#f18260 guisp=#f18260 gui=NONE ctermfg=235 ctermbg=209 cterm=NONE
hi CursorColumn guifg=NONE guibg=#3c3c3c guisp=#3c3c3c gui=NONE ctermfg=NONE ctermbg=237 cterm=NONE
hi CursorLine guifg=NONE guibg=#3c3c3c guisp=#3c3c3c gui=NONE ctermfg=NONE ctermbg=237 cterm=NONE
hi Debug guifg=#f1f1f1 guibg=NONE guisp=NONE gui=NONE ctermfg=255 ctermbg=NONE cterm=NONE
hi Define guifg=#f49d62 guibg=NONE guisp=NONE gui=NONE ctermfg=215 ctermbg=NONE cterm=NONE
hi Delimiter guifg=#f1f1f1 guibg=NONE guisp=NONE gui=NONE ctermfg=255 ctermbg=NONE cterm=NONE
hi DiffAdd ctermbg=238 cterm=NONE
hi DiffChange ctermbg=238 cterm=NONE
hi DiffDelete ctermbg=52 ctermfg=52 cterm=NONE
hi DiffText ctermbg=28 cterm=NONE
hi Directory guifg=#ecec89 guibg=NONE guisp=NONE gui=NONE ctermfg=228 ctermbg=NONE cterm=NONE
hi ErrorMsg guifg=#cf5340 guibg=NONE guisp=NONE gui=NONE ctermfg=167 ctermbg=NONE cterm=NONE
hi Exception guifg=#92bfbf guibg=NONE guisp=NONE gui=NONE ctermfg=109 ctermbg=NONE cterm=NONE
hi Float guifg=#ecec89 guibg=NONE guisp=NONE gui=NONE ctermfg=228 ctermbg=NONE cterm=NONE
hi Folded guifg=#777777 guibg=#282828 guisp=#282828 gui=NONE ctermfg=243 ctermbg=235 cterm=NONE
hi Function guifg=#92bfbf guibg=NONE guisp=NONE gui=NONE ctermfg=109 ctermbg=NONE cterm=NONE
hi Identifier guifg=#ecec89 guibg=NONE guisp=NONE gui=NONE ctermfg=228 ctermbg=NONE cterm=NONE
hi IncSearch guifg=#282828 guibg=#bddcdc guisp=#bddcdc gui=NONE ctermfg=235 ctermbg=152 cterm=NONE
hi Include guifg=#f49d62 guibg=NONE guisp=NONE gui=NONE ctermfg=215 ctermbg=NONE cterm=NONE
hi Keyword guifg=#f49d62 guibg=NONE guisp=NONE gui=NONE ctermfg=215 ctermbg=NONE cterm=NONE
hi Label guifg=#bddcdc guibg=NONE guisp=NONE gui=NONE ctermfg=152 ctermbg=NONE cterm=NONE
hi LineNr guifg=#8d8d8d guibg=#282828 guisp=#282828 gui=NONE ctermfg=245 ctermbg=235 cterm=NONE
hi Macro guifg=#f49d62 guibg=NONE guisp=NONE gui=NONE ctermfg=215 ctermbg=NONE cterm=NONE
hi MatchParen guifg=#f49d62 guibg=NONE guisp=NONE gui=underline ctermfg=215 ctermbg=NONE cterm=underline
hi NonText ctermfg=240 ctermbg=NONE cterm=NONE
hi Number guifg=#ecec89 guibg=NONE guisp=NONE gui=NONE ctermfg=228 ctermbg=NONE cterm=NONE
hi Operator guifg=#f49d62 guibg=NONE guisp=NONE gui=NONE ctermfg=215 ctermbg=NONE cterm=NONE
hi PMenu guifg=#92bfbf guibg=NONE guisp=NONE gui=NONE ctermfg=109 ctermbg=NONE cterm=NONE
hi PMenuSbar guifg=NONE guibg=#282828 guisp=#282828 gui=NONE ctermfg=NONE ctermbg=235 cterm=NONE
hi PMenuSel guifg=NONE guibg=#4c4c4c guisp=#4c4c4c gui=NONE ctermfg=NONE ctermbg=239 cterm=NONE
hi PMenuThumb guifg=NONE guibg=#8d8d8d guisp=#8d8d8d gui=NONE ctermfg=NONE ctermbg=245 cterm=NONE
hi PreCondit guifg=#f49d62 guibg=NONE guisp=NONE gui=NONE ctermfg=215 ctermbg=NONE cterm=NONE
hi PreProc guifg=#f49d62 guibg=NONE guisp=NONE gui=NONE ctermfg=215 ctermbg=NONE cterm=NONE
hi Repeat guifg=#92bfbf guibg=NONE guisp=NONE gui=NONE ctermfg=109 ctermbg=NONE cterm=NONE
hi Search guifg=NONE guibg=#626262 guisp=#626262 gui=NONE ctermfg=NONE ctermbg=241 cterm=NONE
hi SignColumn ctermbg=235 ctermfg=255
hi Special guifg=#f1f1f1 guibg=NONE guisp=NONE gui=NONE ctermfg=255 ctermbg=NONE cterm=NONE
hi SpecialChar guifg=#f1f1f1 guibg=NONE guisp=NONE gui=NONE ctermfg=255 ctermbg=NONE cterm=NONE
hi SpecialComment guifg=#f1f1f1 guibg=NONE guisp=NONE gui=NONE ctermfg=255 ctermbg=NONE cterm=NONE
hi SpecialKey guifg=#f18260 guibg=#3c3c3c guisp=#3c3c3c gui=NONE ctermfg=209 ctermbg=237 cterm=NONE
hi SpellBad ctermbg=160
hi Statement guifg=#f49d62 guibg=NONE guisp=NONE gui=NONE ctermfg=215 ctermbg=NONE cterm=NONE
hi StatusLine guifg=#f1f1f1 guibg=#626262 guisp=#626262 gui=bold ctermfg=255 ctermbg=240 cterm=bold
hi StatusLineNC guifg=#f1f1f1 guibg=#626262 guisp=#626262 gui=NONE ctermfg=255 ctermbg=240 cterm=NONE
hi StorageClass guifg=#ecec89 guibg=NONE guisp=NONE gui=NONE ctermfg=228 ctermbg=NONE cterm=NONE
hi String guifg=#bddcdc guibg=NONE guisp=NONE gui=NONE ctermfg=152 ctermbg=NONE cterm=NONE
hi Structure guifg=#92bfbf guibg=NONE guisp=NONE gui=NONE ctermfg=109 ctermbg=NONE cterm=NONE
hi TabLine guifg=NONE guibg=#1f1f1f guisp=#1f1f1f gui=NONE ctermfg=NONE ctermbg=234 cterm=NONE
hi TabLineFill guifg=NONE guibg=#1f1f1f guisp=#1f1f1f gui=NONE ctermfg=NONE ctermbg=234 cterm=NONE
hi Tag guifg=#92bfbf guibg=NONE guisp=NONE gui=NONE ctermfg=109 ctermbg=NONE cterm=NONE
hi Title guifg=#f1f1f1 guibg=NONE guisp=NONE gui=bold ctermfg=255 ctermbg=NONE cterm=bold
hi Todo guifg=#777777 guibg=NONE guisp=NONE gui=bold ctermfg=243 ctermbg=NONE cterm=bold
hi Type guifg=#92bfbf guibg=NONE guisp=NONE gui=NONE ctermfg=109 ctermbg=NONE cterm=NONE
hi Typedef guifg=#92bfbf guibg=NONE guisp=NONE gui=NONE ctermfg=109 ctermbg=NONE cterm=NONE
hi Underlined guifg=NONE guibg=NONE guisp=NONE gui=underline ctermfg=NONE ctermbg=NONE cterm=underline
hi VertSplit guifg=#626262 guibg=#626262 guisp=#626262 gui=NONE ctermfg=240 ctermbg=240 cterm=NONE
hi Visual guifg=NONE guibg=#4c4c4c guisp=#4c4c4c gui=NONE ctermfg=NONE ctermbg=239 cterm=NONE
hi WarningMsg guifg=#cf5340 guibg=NONE guisp=NONE gui=NONE ctermfg=167 ctermbg=NONE cterm=NONE
hi colorcolumn guifg=NONE guibg=#3c3c3c guisp=#3c3c3c gui=NONE ctermfg=NONE ctermbg=237 cterm=NONE
hi cssclassname guifg=#92bfbf guibg=NONE guisp=NONE gui=NONE ctermfg=109 ctermbg=NONE cterm=NONE
hi csscolor guifg=#ecec89 guibg=NONE guisp=NONE gui=NONE ctermfg=228 ctermbg=NONE cterm=NONE
hi csscommonattr guifg=#b4d388 guibg=NONE guisp=NONE gui=NONE ctermfg=150 ctermbg=NONE cterm=NONE
hi cssfunctionname guifg=#f49d62 guibg=NONE guisp=NONE gui=NONE ctermfg=215 ctermbg=NONE cterm=NONE
hi csspseudoclassid guifg=#92bfbf guibg=NONE guisp=NONE gui=NONE ctermfg=109 ctermbg=NONE cterm=NONE
hi cssurl guifg=#f49d62 guibg=NONE guisp=NONE gui=NONE ctermfg=215 ctermbg=NONE cterm=NONE
hi cssvaluelength guifg=#ecec89 guibg=NONE guisp=NONE gui=NONE ctermfg=228 ctermbg=NONE cterm=NONE
hi erubycomment guifg=#777777 guibg=NONE guisp=NONE gui=NONE ctermfg=243 ctermbg=NONE cterm=NONE
hi erubyrailsmethod guifg=#f49d62 guibg=NONE guisp=NONE gui=NONE ctermfg=215 ctermbg=NONE cterm=NONE
hi htmlarg guifg=#b4d388 guibg=NONE guisp=NONE gui=NONE ctermfg=150 ctermbg=NONE cterm=NONE
hi htmlendtag guifg=#b4d388 guibg=NONE guisp=NONE gui=NONE ctermfg=150 ctermbg=NONE cterm=NONE
hi htmlspecialchar guifg=#f18260 guibg=NONE guisp=NONE gui=NONE ctermfg=209 ctermbg=NONE cterm=NONE
hi htmltag guifg=#b4d388 guibg=NONE guisp=NONE gui=NONE ctermfg=150 ctermbg=NONE cterm=NONE
hi htmltagname guifg=#b4d388 guibg=NONE guisp=NONE gui=NONE ctermfg=150 ctermbg=NONE cterm=NONE
hi javascriptfunction guifg=#ecec89 guibg=NONE guisp=NONE gui=NONE ctermfg=228 ctermbg=NONE cterm=NONE
hi javascriptrailsfunction guifg=#f49d62 guibg=NONE guisp=NONE gui=NONE ctermfg=215 ctermbg=NONE cterm=NONE
hi normal guifg=#f1f1f1 guibg=#282828 guisp=#282828 gui=NONE ctermfg=255 ctermbg=235 cterm=NONE
hi rubyblockparameter guifg=#f49d62 guibg=NONE guisp=NONE gui=NONE ctermfg=215 ctermbg=NONE cterm=NONE
hi rubyclass guifg=#f49d62 guibg=NONE guisp=NONE gui=NONE ctermfg=215 ctermbg=NONE cterm=NONE
hi rubyclassvariable guifg=#f49d62 guibg=NONE guisp=NONE gui=NONE ctermfg=215 ctermbg=NONE cterm=NONE
hi rubyconstant guifg=#92bfbf guibg=NONE guisp=NONE gui=NONE ctermfg=109 ctermbg=NONE cterm=NONE
hi rubycontrol guifg=#f49d62 guibg=NONE guisp=NONE gui=NONE ctermfg=215 ctermbg=NONE cterm=NONE
hi rubyescape guifg=#ecec89 guibg=NONE guisp=NONE gui=NONE ctermfg=228 ctermbg=NONE cterm=NONE
hi rubyexception guifg=#f49d62 guibg=NONE guisp=NONE gui=NONE ctermfg=215 ctermbg=NONE cterm=NONE
hi rubyfunction guifg=#92bfbf guibg=NONE guisp=NONE gui=NONE ctermfg=109 ctermbg=NONE cterm=NONE
hi rubyglobalvariable guifg=#f49d62 guibg=NONE guisp=NONE gui=NONE ctermfg=215 ctermbg=NONE cterm=NONE
hi rubyinclude guifg=#f49d62 guibg=NONE guisp=NONE gui=NONE ctermfg=215 ctermbg=NONE cterm=NONE
hi rubyinstancevariable guifg=#f49d62 guibg=NONE guisp=NONE gui=NONE ctermfg=215 ctermbg=NONE cterm=NONE
hi rubyoperator guifg=#f49d62 guibg=NONE guisp=NONE gui=NONE ctermfg=215 ctermbg=NONE cterm=NONE
hi rubypseudovariable guifg=#f49d62 guibg=NONE guisp=NONE gui=NONE ctermfg=215 ctermbg=NONE cterm=NONE
hi rubyrailsarassociationmethod guifg=#f49d62 guibg=NONE guisp=NONE gui=NONE ctermfg=215 ctermbg=NONE cterm=NONE
hi rubyrailsarmethod guifg=#f49d62 guibg=NONE guisp=NONE gui=NONE ctermfg=215 ctermbg=NONE cterm=NONE
hi rubyrailsmethod guifg=#f49d62 guibg=NONE guisp=NONE gui=NONE ctermfg=215 ctermbg=NONE cterm=NONE
hi rubyrailsrendermethod guifg=#f49d62 guibg=NONE guisp=NONE gui=NONE ctermfg=215 ctermbg=NONE cterm=NONE
hi rubyrailsuserclass guifg=#92bfbf guibg=NONE guisp=NONE gui=NONE ctermfg=109 ctermbg=NONE cterm=NONE
hi rubyregexp guifg=#f49d62 guibg=NONE guisp=NONE gui=NONE ctermfg=215 ctermbg=NONE cterm=NONE
hi rubyregexpdelimiter guifg=#f49d62 guibg=NONE guisp=NONE gui=NONE ctermfg=215 ctermbg=NONE cterm=NONE
hi rubystringdelimiter guifg=#bddcdc guibg=NONE guisp=NONE gui=NONE ctermfg=152 ctermbg=NONE cterm=NONE
hi rubysymbol guifg=#ecec89 guibg=NONE guisp=NONE gui=NONE ctermfg=228 ctermbg=NONE cterm=NONE
hi yamlalias guifg=#f49d62 guibg=NONE guisp=NONE gui=NONE ctermfg=215 ctermbg=NONE cterm=NONE
hi yamlanchor guifg=#f49d62 guibg=NONE guisp=NONE gui=NONE ctermfg=215 ctermbg=NONE cterm=NONE
hi yamldocumentheader guifg=#bddcdc guibg=NONE guisp=NONE gui=NONE ctermfg=152 ctermbg=NONE cterm=NONE
hi yamlkey guifg=#92bfbf guibg=NONE guisp=NONE gui=NONE ctermfg=109 ctermbg=NONE cterm=NONE

hi link Whitespace NonText
