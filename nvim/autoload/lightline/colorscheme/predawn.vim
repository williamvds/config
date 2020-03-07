let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p.normal.left = [['#282828', '#f49d62', 235, 215, 'bold'], ['white', 'gray1']]
let s:p.normal.right = s:p.normal.left[1:]
let s:p.normal.middle = [['white', 'gray4']]
let s:p.normal.error = [['#282828', '#cf5340', 235, 167]]
let s:p.normal.warning = [['gray1', 'yellow']]
let s:p.inactive.left = s:p.normal.middle
let s:p.tabline.left = [['white', 'gray4']]
let s:p.tabline.tabsel = [['white', 'gray1']]
let s:p.tabline.middle = s:p.normal.middle

let g:lightline#colorscheme#predawn#palette = lightline#colorscheme#fill(s:p)
