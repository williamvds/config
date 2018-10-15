let mapleader = "\<space>"

source ~/.config/nvim/colors/predawn.vim

set rtp+=/usr/share/vim/vimfiles
if dein#load_state('~/.local/share/nvim/dein')
	call dein#begin('~/.local/share/nvim/dein')

	call dein#add('Shougo/deoplete.nvim')
	call dein#add('Shougo/neosnippet')
	call dein#add('Shougo/neosnippet-snippets')
	call dein#add('airblade/vim-gitgutter')
	call dein#add('blindFS/vim-taskwarrior')
	call dein#add('itchyny/lightline.vim')
	call dein#add('lervag/vimtex')
	call dein#add('mileszs/ack.vim')
	call dein#add('plasticboy/vim-markdown')
	call dein#add('tpope/vim-commentary')
	call dein#add('tpope/vim-fugitive')
	call dein#add('tpope/vim-sleuth')
	call dein#add('tpope/vim-vinegar')
	call dein#add('w0rp/ale')
	call dein#add('alvan/vim-closetag', {'on_ft': ['html', 'xml', 'php']})
	call dein#add('artur-shaik/vim-javacomplete2', {'on_ft': 'java'})
	call dein#add('chrisbra/unicode.vim', {'on_ft': ['markdown', 'text']})
	call dein#add('davidhalter/jedi', {'on_ft': 'python'})
	call dein#add('derekwyatt/vim-scala', {'on_ft': 'scala'})
	call dein#add('digitaltoad/vim-pug', {'on_ft': ['jade', 'pug']})
	call dein#add('shawncplus/phpcomplete.vim', {'on_ft': 'php'})
	call dein#add('tmhedberg/matchit', {'on_ft': ['html', 'xml', 'php']})
	call dein#add('tobyS/pdv', {'on_ft': 'php'})
	call dein#add('tobyS/vmustache', {'on_ft': 'php'})
	call dein#add('tweekmonster/deoplete-clang2', {'on_ft': ['c', 'cpp']})
	call dein#add('xolox/vim-lua-ftplugin', {'on_ft': 'lua'})
	call dein#add('xolox/vim-misc', {'on_ft': 'lua'})
	call dein#add('zchee/deoplete-jedi', {'on_ft': 'python'})
	call dein#add('jsfaint/gen_tags.vim')
	call dein#add('udalov/kotlin-vim')

	call dein#end()
	call dein#save_state()
endif


let g:task_highlight_field = 0
let g:task_default_prompt  = ['project', 'tag', 'description']
au FileType taskreport set fdm=manual

let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1

let g:neosnippet#snippets_directory='$XDG_CONFIG_HOME/nvim/snippets'

imap <C-k> <Plug>(neosnippet_expand_or_jump)
imap <expr><tab>
	\ pumvisible() ? "\<C-n>" :
	\ neosnippet#expandable_or_jumpable() ?
	\ "\<Plug>(neosnippet_expand_or_jump)" : "\<tab>"
smap <expr><tab> neosnippet#expandable_or_jumpable() ?
	\ "\<Plug>(neosnippet_expand_or_jump)" : "\<tab>"
ino <expr>) ")\<C-o>:silent! pc\<cr>"

let g:lua_check_syntax = 0
let g:lua_complete_dynamic = 0
let g:lua_complete_omni = 1

hi! default link CompletePlaceHolder Comment
hi! default link CompletePlaceHolderEnds Comment

au FileType java
	\ let g:ale_java_javac_classpath=$CLASSPATH
	\|let g:JavaComplete_UsePython3 = 1
	\|setl makeprg="mvn package"
	\|setl ofu=javacomplete#Complete

au FileType tex setl makeprg="xelatex %"

au FileType php
	\setl ofu=phpcomplete#Complete
	\|map <leader>d :call pdv#DocumentWithSnip()<cr>

let g:ale_c_build_dir = '~/.local/share/nvim/swap'
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
au ColorScheme * hi ALEErrorSign ctermfg=167
au ColorScheme * hi ALEError ctermfg=167 cterm=underline
au ColorScheme * hi ALEWarningSign ctermfg=228
au ColorScheme * hi ALEWarning ctermfg=228 cterm=underline
let g:ale_echo_msg_on_ftmat = '%s [%linter%]'
let g:ale_fixers = {
	\ 'cpp': ['clang-on_ftmat']
\}
let g:ale_cpp_clangtidy_checks = ['*',
	\ '-misc-unused-parameters',
	\ '-fuchsia-default-arguments',
	\ '-fuchsia-overloaded-operator',]

map <leader>c :Commentary<cr>

let g:gitgutter_sign_added = '┃'
let g:gitgutter_sign_modified = '┃'
let g:gitgutter_sign_removed = '┃'
let g:gitgutter_sign_modified_removed = '┃'

let g:lightline = {
	\  'colorscheme': 'predawn',
	\  'mode_map': {
	\		 'n':			 'N ',
	\		 'c':			 'N ',
	\		 'i':			 'I ',
	\		 'R':			 'R ',
	\		 'v':			 'V ',
	\		 'V':			 'VL',
	\		 "\<C-v>": 'VB',
	\		 's':			 'S ',
	\		 'S':			 'SL',
	\		 "\<C-s>": 'SB',
	\		 't':			 'T ',
	\		},
	\  'component' : {
	\		 'lineinfo': '%-2v/%L',
	\		 'readonly': '%{&readonly||!&modifiable?"":""}',
	\		 'modified': '%{&modified?"+":""}',
	\  },
	\  'component_function' : {
	\		 'gitbranch': 'LightlineGitBranch',
	\  },
	\  'active': {
	\		 'left':	[['mode', 'spell'], ['readonly'], ['relativepath', 'modified']],
	\		 'right': [['filetype', 'lineinfo'], ['gitbranch']],
	\  },
	\  'inactive': {
	\		 'left':	[['relativepath']],
	\		 'right': [],
	\  },
	\ 'separator': { 'left': '', 'right': '' },
	\ 'subseparator': { 'left': '', 'right': '' },
	\ 'tabline': {
	\		'right': [],
	\ },
	\}

fu! LightlineGitBranch()
	if exists('*fugitive#head')
		let branch = fugitive#head()
		let diffcount = execute('echon ' . join(GitGutterGetHunkSummary(), '+'))
		return branch !=# '' ? ' '. branch
			\ . (diffcount > 0 ? ' ±' . diffcount : '')
			\ : ''
	endif
	return ''
endfu

let g:gen_tags#ctags_opts='--exclude=build'

syntax enable

set pa=.,*,** mouse=a ar lz hid ffs=unix,dos,mac spr sb secure ex fdm=indent ut=1000 " behaviour
set noeb novb " sounds
set dir=~/.local/share/nvim/swap | let &udir=&dir | let &bdir=&dir
set swf udf " hist
set sm nu cul cole=2 cc=80 fdc=0 so=5 rnu cocu=ncv " visual
set ic scs hls is magic " searching
set wmnu wic " wildmenu
set ts=2 sw=2 ai si noet sta " indent
set wrap ww+=<,> bs=indent,eol,start " movement

let g:netrw_list_hide='\.(o|plist|pyc|class|png|jpg|gif|svg)$,__pycache__,\.git,build'
set wig=*.o,*.plist,*.pyc,*.class,*.png,*.jpg,*.gif,*.svg,**/__pycache__/**,**/.git/**,**/node_modules/**,**/build/**

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
vno <silent> . :normal .<CR>

nmap <silent> <leader>w :w!<cr>
nmap <silent> <leader>Q :q!<cr>
map <silent> <leader>/ :noh<cr>
map <silent> <leader>ss :setlocal spell!<cr>
map <silent> <leader>m :make<cr>
map <leader>y "+y
map <leader>p "+p

nmap <silent> <tab> :tabnext<cr>
nmap <silent> <S-tab> :tabprevious<cr>
map <silent> <leader>tn :tabnew<cr>
map <silent> <leader>to :tabonly<cr>
map <silent> <leader>tc :tabclose<cr>
map <silent> <leader>tm :tabmove

map <silent> g= :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
	\. synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
	\. synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

map <silent> ]q :cn!<cr>
map <silent> [q :cp!<cr>

map <silent> ]e <Plug>(ale_next_wrap)
map <silent> [e <Plug>(ale_previous_wrap)

map <silent> [h :GitGutterPrevHunk<cr>
map <silent> ]h :GitGutterNextHunk<cr>

au SwapExists * let v:swapchoice = expand('%:t') == 'COMMIT_EDITMSG'? 'd' : 'e'
au FileType gitcommit startinsert
" set shortmess

au FileType * if index(['markdown', 'text', 'gitcommit'], &ft) >= 0
	\ |:setl spell
	\ |else |:setl nospell |endif

fu! TrimWhiteSpace()
	if &ft == "markdown" |return |endif
	%s/\s\+$//e
endfu
au FileWritePre,FileAppendPre,FilterWritePre,BufWritePre * :call TrimWhiteSpace()
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") |exe "normal! g'\"" |endif
