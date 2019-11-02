## upgrade-your-ssh-key-to-ed25519

https://medium.com/risan/upgrade-your-ssh-key-to-ed25519-c6e8d60d3c54

```
export me = ?
echo $me@gmail.com

echo $HOST
echo $me
ssh-keygen -t ed25519 -C "$me@gmail.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

nano ~/.ssh/config
# file:
Host *
  AddKeysToAgent yes
  IgnoreUnknown UseKeychain
  UseKeychain yes
  IdentityFile ~/.ssh/id_ed25519
  IdentityFile ~/.ssh/id_rsa # Keep any old key files if you want
  
cat ~/.ssh/id_ed25519
ssh-copy-id -f -i ~/.ssh/id_ed25519  $HOST -p 22
ssh -i ~/.ssh/id_ed25519  $HOST -p 22 -vv

ssh $HOST cat ~/.ssh/authorized_keys
```

Troubles
1. ssh ed25519 Bad configuration option: usekeychain
IgnoreUnknown UseKeychain

2. Offering ED25519 public we sent a publickey packet, wait for reply ???
FIX :
chmod 755 ~
