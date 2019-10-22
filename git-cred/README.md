# pass-git-helper

https://github.com/languitar/pass-git-helper

pass: the standard unix password manager
https://www.passwordstore.org/


```
cd ~/bin/git-cred/
git clone https://github.com/languitar/pass-git-helper

# For a single user:
# if: python3 error ImportError no module 'setuptoools'
sudo apt-get install -y python3 python3-setuptools
sudo apt-get install -y pass

pass init "git store"
pass init git
gpg --gen-key
gpg --list-key
gpg --edit-key A30A60239B9EBDBD297887221D22EB89C549180A
#   trust, 5, save 
gpg --list-key
pass insert dev/github
pass show dev/github

python3 setup.py install --user

# git config credential.helper '!pass-git-helper $@'
git config credential.useHttpPath true

mkdir ~/.config
mkdir ~/.config/pass-git-helper
touch ~/.config/pass-git-helper/git-pass-mapping.ini
echo "[github.com*]"     >  ~/.config/pass-git-helper/git-pass-mapping.ini
echo "target=dev/github" >> ~/.config/pass-git-helper/git-pass-mapping.ini
cat  ~/.config/pass-git-helper/git-pass-mapping.ini
~/.local/bin/pass-git-helper 

cat ~/.gitconfig
echo "[credential]" >> ~/.gitconfig
echo "    helper=/home/$USER/.local/bin/pass-git-helper -m ~/.config/pass-git-helper/git-pass-mapping.ini" >> ~/.gitconfig
```

## Sample configs:

```
[github.com*]
target=dev/github
[*]
target=git-logins/${host}

[credential]
    helper=/home/andriusk/.local/bin/pass-git-helper -m ~/.config/pass-git-helper/git-pass-mapping.ini
```
~/.local/bin/pass-git-helper 

git config credential.helper '!pass-git-helper $@'
git config credential.helper '/home/andriusk/.local/bin/pass-git-helper -m ~/.config/pass-git-helper/git-pass-mapping.ini $@'

# Problem:
```
git push origin master 
Traceback (most recent call last):
  File "/home/andriusk/.local/bin/pass-git-helper", line 11, in <module>
    load_entry_point('pass-git-helper==1.2.0.dev0', 'console_scripts', 'pass-git-helper')()
  File "/home/andriusk/.local/lib/python3.5/site-packages/pass_git_helper-1.2.0.dev0-py3.5.egg/passgithelper.py", line 429, in main
  File "/home/andriusk/.local/lib/python3.5/site-packages/pass_git_helper-1.2.0.dev0-py3.5.egg/passgithelper.py", line 372, in get_password
  File "/usr/lib/python3.5/subprocess.py", line 316, in check_output
    **kwargs).stdout
  File "/usr/lib/python3.5/subprocess.py", line 383, in run
    with Popen(*popenargs, **kwargs) as process:
  File "/usr/lib/python3.5/subprocess.py", line 676, in __init__
    restore_signals, start_new_session)
  File "/usr/lib/python3.5/subprocess.py", line 1282, in _execute_child
    raise child_exception_type(errno_num, err_msg)
FileNotFoundError: [Errno 2] No such file or directory: 'pass'
Username for 'https://github.com': ?
```

~/.config/pass-git-helper/git-pass-mapping.ini