" Automatically install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/pl$    autocmd!
    autocmd VimEnter * PlugInstall
endif

" Bootstrap vim-plug
call plug#begin('~/.config/nvim/plugged')
" your plugins will go here
call plug#end()
