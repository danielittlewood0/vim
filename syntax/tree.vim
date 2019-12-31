syn match Menu '\v^[  ├└│─]*'
syn match Directory '\v[^  ├└│─]*\/$'
nnoremap yy /\v[^  ├└│─]/<Enter>"+y$
