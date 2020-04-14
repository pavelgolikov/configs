cp .vimrc ../.vimrc
cp .tmux.conf ../.tmux.conf
cp .ideavimrc ../.ideavimrc

cat bashrc_additions >> ../.bashrc

cd ~/

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

