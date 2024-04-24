call ale#Set('python_python_executable', 'python')

let s:base_path = expand('<sfile>:p:h', 1)
let s:compile_path = ale#path#GetAbsPath(s:base_path, 'compile.py')

function! ale_linters#python#python#GetExecutable(buffer) abort
  let python_executable = ale#Var(a:buffer, 'python_python_executable')
  if !executable(python_executable) || empty(glob(s:compile_path))
    return ''
  endif
  return python_executable
endfunction

function! ale_linters#python#python#GetCommand(buffer) abort
  return '%e '.s:compile_path.' %s'
endfunction

call ale#linter#Define('python', {
\   'name': 'python',
\   'executable': function('ale_linters#python#python#GetExecutable'),
\   'command': function('ale_linters#python#python#GetCommand'),
\   'callback': 'ale#handlers#unix#HandleAsError',
\})