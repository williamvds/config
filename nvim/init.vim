let mapleader = "\<space>"

source ~/.config/nvim/colors/predawn.vim

set rtp+=/usr/share/vim/vimfiles
if $_OS_MACOS
	\|set rtp+=$DEIN_DIR/repos/github.com/Shougo/dein.vim
	\|endif

if dein#load_state($DEIN_DIR)
	call dein#begin($DEIN_DIR)

	call dein#add('Shougo/neosnippet')
	call dein#add('Shougo/neosnippet-snippets')
	call dein#add('airblade/vim-gitgutter')
	call dein#add('blindFS/vim-taskwarrior')
	call dein#add('itchyny/lightline.vim')
	call dein#add('mileszs/ack.vim')
	call dein#add('plasticboy/vim-markdown')
	call dein#add('tpope/vim-commentary')
	call dein#add('tpope/vim-fugitive')
	call dein#add('tpope/vim-sleuth')
	call dein#add('tpope/vim-vinegar')
	call dein#add('neoclide/coc.nvim', {'rev': 'release'})
	call dein#add('alvan/vim-closetag', {'on_ft': ['html', 'xml', 'php']})
	call dein#add('tmhedberg/matchit', {'on_ft': ['html', 'xml', 'php']})
	call dein#add('godlygeek/tabular')

	if $_USE_PERSONAL
		call dein#add('chrisbra/unicode.vim', {'on_ft': ['markdown', 'text']})
		call dein#add('lervag/vimtex')
	endif

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

" Neosnippet
let g:neosnippet#snippets_directory='$XDG_CONFIG_HOME/nvim/snippets'

" Coc
inoremap <silent><expr> <TAB>
	\ pumvisible() ? coc#_select_confirm() :
	\ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
	\ <SID>check_back_space() ? "\<TAB>" :
	\ coc#refresh()

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> <leader>rn <Plug>(coc-rename)
nmap <leader>qf  <Plug>(coc-fix-current)

hi! default link CompletePlaceHolder Comment
hi! default link CompletePlaceHolderEnds Comment

au FileType tex setl makeprg="xelatex %"

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
\		 'cocstatus': 'coc#status'
\	},
\	'active': {
\		 'left':	[['mode', 'spell'], ['readonly'], ['relativepath', 'modified']],
\		 'right':	[['filetype', 'lineinfo'], ['gitbranch', 'cocstatus']],
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

au User CocStatusChange,CocDiagnosticChange call lightline#update()

" ack.vim
if executable("ag") |let g:ackprg = "ag --vimgrep" |endif

syntax enable

set pa=.,*,** mouse=a ar lz ffs=unix,dos,mac spr sb secure ex fdm=syntax ut=1000
	\ icm=nosplit " behaviour
set noeb novb " sounds
set dir=~/.local/share/nvim/swap | let &udir=&dir | let &bdir=&dir
set swf udf " hist
set sm nu cul cole=2 cc=80 fdc=0 so=5 rnu cocu=ncv lcs=tab:»\ ,space:·,eol:¬ list " visual
set ic scs hls is magic " searching
set wmnu wic " wildmenu
set ts=4 sw=4 ai si noet sta " indent
set wrap ww+=<,> bs=indent,eol,start " movement

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

map <silent> ]e <Plug>(ale_next_wrap)
map <silent> [e <Plug>(ale_previous_wrap)

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
