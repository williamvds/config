let mapleader = "\<space>"

let vim_home=expand("<sfile>:h")
exec 'source' vim_home.'/colors/predawn.vim'

set rtp+=/usr/share/vim/vimfiles
if $_OS_MACOS
	set rtp+=$DEIN_DIR/repos/github.com/Shougo/dein.vim
elseif ! $_OS_GNU_LINUX
	" Assume Windows
	let $DEIN_DIR=expand("$HOME/AppData/Local/nvim-data/dein")
	set rtp+=$DEIN_DIR/repos/github.com/Shougo/dein.vim
endif

if dein#load_state($DEIN_DIR)
	call dein#begin($DEIN_DIR)

	call dein#add('Shougo/deoplete.nvim', {'build': ':UpdateRemotePlugins'})
	call dein#add('airblade/vim-gitgutter')
	call dein#add('alvan/vim-closetag', {'on_ft': ['html', 'xml', 'php']})
	call dein#add('blindFS/vim-taskwarrior')
	call dein#add('dense-analysis/ale')
	call dein#add('godlygeek/tabular')
	call dein#add('itchyny/lightline.vim')
	call dein#add('plasticboy/vim-markdown')
	call dein#add('tmhedberg/matchit', {'on_ft': ['html', 'xml', 'php']})
	call dein#add('tpope/vim-commentary')
	call dein#add('tpope/vim-fugitive')
	call dein#add('tpope/vim-sleuth')
	call dein#add('tpope/vim-vinegar')

	call dein#end()
	if dein#check_install()
		call dein#install()
	endif
	call dein#save_state()
endif

let g:task_highlight_field = 0
let g:task_default_prompt  = ['project', 'tag', 'description']
au FileType taskreport set fdm=manual

let g:sleuth_automatic = 0

" Deoplete
let g:deoplete#enable_at_startup = 1

call deoplete#custom#option('sources', {
\ '_': ['ale'],
\})

" Neosnippet
let g:neosnippet#snippets_directory='$XDG_CONFIG_HOME/nvim/snippets'

imap <C-k> <Plug>(neosnippet_expand_or_jump)
imap <expr><tab>
	\ pumvisible() ? "\<C-n>" :
	\ neosnippet#expandable_or_jumpable() ?
	\ "\<Plug>(neosnippet_expand_or_jump)" : "\<tab>"
smap <expr><tab> neosnippet#expandable_or_jumpable() ?
	\ "\<Plug>(neosnippet_expand_or_jump)" : "\<tab>"
ino <expr>) ")\<C-o>:silent! pc\<cr>"

" ALE
let g:ale_c_build_dir = 'build/'
let g:ale_sign_error = '󰀧'
let g:ale_sign_warning = '󰀦'
let g:ale_sign_info = '󰋼'
let g:ale_echo_msg_on_ftmat = '%s [%severity%/%linter%]'
let g:ale_lsp_show_message_format = '%s [%severity%/%linter%]'
let g:ale_linters_explicit = 1
let g:ale_fixers = {
	\ 'cpp': ['clang-format', 'clangtidy']
\}
let g:ale_linters = {
	\ 'bash': ['shellcheck'],
	\ 'c': ['clangd', 'clangtidy'],
	\ 'cpp': ['clangd', 'clangtidy'],
	\ 'sh': ['shellcheck'],
\}

au ColorScheme *
	\ hi ALEErrorSign ctermfg=167
	\|hi ALEError ctermfg=167 cterm=underline
	\|hi ALEWarningSign ctermfg=228
	\|hi ALEWarning ctermfg=228 cterm=underline

nmap <silent> ]e :ALENext -error<cr>
nmap <silent> [e :ALEPrevious -error<cr>
nmap <silent> ]E <Plug>(ale_next_wrap)
nmap <silent> [E <Plug>(ale_previous_wrap)
nmap <silent> gd <Plug>(ale_go_to_definition)
nmap <silent> gr <Plug>(ale_find_references)
nmap <silent> <leader>rn <Plug>(ale_rename)

" vim-gitgutter
let g:gitgutter_sign_added = '┃'
let g:gitgutter_sign_modified = '┃'
let g:gitgutter_sign_removed = '┃'
let g:gitgutter_sign_modified_removed = '┃'
au ColorScheme *
	\ hi GitGutterAdd ctermfg=2
	\|hi GitGutterDelete ctermfg=9
	\|hi GitGutterChange ctermfg=11

" vim-markdown
let g:vim_markdown_follow_anchor = 1
let g:vim_markdown_math = 1

" lightline
let g:lightline = {
\	'colorscheme': 'predawn',
\	'mode_map': {
\		 'n':		'N ',
\		 'c':		'N ',
\		 'i':		'I ',
\		 'R':		'R ',
\		 'v':		'V ',
\		 'V':		'VL',
\		 "\<C-v>":	'VB',
\		 's':		'S ',
\		 'S':		'SL',
\		 "\<C-s>":	'SB',
\		 't':		'T ',
\		},
\  'component' : {
\		 'lineinfo': '%-2v/%L',
\		 'readonly': '%{&readonly||!&modifiable?"":""}',
\		 'modified': '%{&modified?"+":""}',
\	},
\	'component_function' : {
\		 'gitbranch': 'LightlineGitBranch',
\	},
\	'active': {
\		 'left':	[['mode', 'spell'], ['readonly'], ['relativepath', 'modified']],
\		 'right':	[['filetype', 'lineinfo'], ['gitbranch']],
\	},
\	'inactive': {
\		 'left':	[['relativepath']],
\		 'right': [],
\  },
\ 'separator': { 'left': '', 'right': '' },
\ 'subseparator': { 'left': '', 'right': '' },
\ 'tabline': {
\		'right': [],
\	},
\}

fu! LightlineGitBranch()
	if !exists('*fugitive#head') |return '' |endif

	let branch = fugitive#head()
	let diffcount = execute('echon ' . join(GitGutterGetHunkSummary(), '+'))
	return branch !=# '' ? ' '. branch
		\ . (diffcount > 0 ? ' ±' . diffcount : '')
		\ : ''
endfu

syntax enable

set pa=.,*,** mouse=a ar lz ffs=unix,dos,mac spr sb secure ex fdm=syntax ut=1000
	\ icm=nosplit " behaviour
set noeb novb " sounds
set dir=~/.local/share/nvim/swap | let &udir=&dir | let &bdir=&dir
set swf udf " hist
set sm nu cul cole=2 cc=80 fdc=0 so=5 rnu cocu=ncv lcs=tab:»\ ,trail:· list " visual
set ic scs hls is magic " searching
set wmnu wic " wildmenu
set ts=4 sw=4 ai si noet sta " indent
set wrap ww+=<,> bs=indent,eol,start " movement

if executable("ag") |let &grepprg = "ag --vimgrep" |endif

let g:netrw_list_hide='\.(o|pyc|class|hi|png|jpg|gif|svg|pdf)$,__pycache__,\.git,build'
set wig=*.o,*.pyc,*.class,*.hi,*.png,*.jpg,*.gif,*.svg,*.pdf,*.tga,**/__pycache__/**,**/.git/,**/node_modules/,**/build/**

com! W w !sudo tee % >/dev/null
com! Rel so ~/.config/nvim/init.vim

let s:dirmap = {
	\ 'h': 'L',
	\ 'j': 'D',
	\ 'k': 'U',
	\ 'l': 'R',
\}
fu! Focus(dir)
	let nr = winnr()
	exec 'winc '. a:dir
	if nr != winnr() |return |endif
	call system('tmux selectp -'. s:dirmap[a:dir])
endfu

map Q <nop>
map <silent> <M-h> :call Focus("h")<cr>
map <silent> <M-j> :call Focus("j")<cr>
map <silent> <M-k> :call Focus("k")<cr>
map <silent> <M-l> :call Focus("l")<cr>

nno <C-f> <C-i>
nno <C-b> <C-o>
vno <silent> . :normal .<cr>

nmap <silent> <leader>w :w!<cr>
nmap <silent> <leader>Q :q!<cr>
map <silent> <leader>/ :noh<cr>
map <silent> <leader>ss :setlocal spell!<cr>
map <silent> <leader>m :make<cr>
map <silent> <leader>c :Commentary<cr>
map <leader>y "+y
map <leader>p "+p

nmap <silent> <C-n> :tabnext<cr>
nmap <silent> <C-p> :tabprevious<cr>
map <silent> <leader>tn :tabnew<cr>
map <silent> <leader>to :tabonly<cr>
map <silent> <leader>tc :tabclose<cr>
map <silent> <leader>tm :tabmove

map <silent> g= :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
	\. synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
	\. synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<cr>

map <silent> ]q :cn!<cr>
map <silent> [q :cp!<cr>

nno <silent> [c :if !&diff \|GitGutterPrevHunk \|endif<cr>
nno <silent> ]c :if !&diff \|GitGutterNextHunk \|endif<cr>

au SwapExists * let v:swapchoice = expand('%:t') == 'COMMIT_EDITMSG'? 'd' : 'e'

au FileType crontab setl nobk nowb
au FileType taskreport setl nolist
au BufNewFile,BufRead *.plist set ft=xml
au BufNewFile,BufRead *.pch set ft=cpp

au BufReadPost * nested
	\ if &ft != "git" && !exists('b:reload_dos') && !&binary && &ff=='unix' && (0 < search('\r$', 'nc'))
	\ |noa e ++ff=dos
	\ |endif

au FileType * if index(['markdown', 'text', 'gitcommit', 'svn'], &ft) >= 0
	\ |:setl spell
	\ |:setl tw=80
	\ |else |:setl nospell |endif

au BufNewFile,BufRead *.plist set ft=xml
au BufNewFile,BufRead *.pch set ft=cpp
au FileType crontab setl nobk nowb
au FileType taskreport setl nolist

let g:taskwarrior_notes_dir="$HOME/tasknotes"
let g:taskwarrior_notes_extension=".md"
fu! OpenTaskNotes()
	let uuid = substitute(system('task '.taskwarrior#data#get_uuid().' _uuids'), '\n', '', '')
	execute 'sp '.g:taskwarrior_notes_dir.'/'.uuid.g:taskwarrior_notes_extension
endfu
au FileType taskreport
	\ nmap <silent> <buffer> n :call OpenTaskNotes()<cr>

fu! TrimWhiteSpace()
	if &ft == "markdown" || &ro || !&mod |return |endif
	let view = winsaveview()
	keepjumps '[,']s/\s\+$//e
	call winrestview(view)
endfu

aug TrimWhiteSpace
	au!
	au InsertLeave * call TrimWhiteSpace()
aug end

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$")
	\ && index(['gitcommit', 'svn'], &ft) < 0
	\ |exe "normal! g'\"" |endif
