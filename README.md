# dotfiles

- [bash で fzf を使い history の重複を排除して選択する](https://tottoto.net/fzf-history-on-bash/)
- [ubuntu 20.04 にfzf(command-line fuzzy finder)をインストール | やましなぶろぐ](https://ryamashina.com/itml/fzf_install/)
- [linux - Shell script to check ubuntu version and then copy files - Stack Overflow](https://stackoverflow.com/questions/12545066/shell-script-to-check-ubuntu-version-and-then-copy-files)

## Ubuntu 19.04 以上

```
$ sudo apt-get install rcm
$ sudo apt-get install fzf
```

- [junegunn/fzf: A command-line fuzzy finder](https://github.com/junegunn/fzf#using-linux-package-managers)

## Ubuntu 18.10 以下

```
$ sudo apt-get install software-properties-common
$ sudo add-apt-repository ppa:martin-frost/thoughtbot-rcm
$ sudo add-apt-repository ppa:ultradvorka/ppa
$ sudo apt-get update
$ sudo apt-get install rcm
$ sudo apt-get install hstr
```

- [thoughtbot/rcm: rc file (dotfile) management](https://github.com/thoughtbot/rcm)
- [hstr/INSTALLATION.md at master · dvorka/hstr](https://github.com/dvorka/hstr/blob/master/INSTALLATION.md#ubuntu)
