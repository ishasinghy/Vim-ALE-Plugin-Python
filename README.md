# Vim ALE Plugin Python

Vim plugin for python seyntax highlighting, linting and error detection

Created by: Isha Singh

Prerequisites:
dense-analysis/ale
port from https://github.com/vim-syntastic/syntastic

Installation
(Run the following in vim:)
Plug ['ishasinghy/ale-python-linter']
(edit \_vimrc:)
add following code:
`        let g:ale_linters = {
            \   'python': ['python'],
            \}
   `
