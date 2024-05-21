# New branch for .dotfiles

This new `main` branch is an attempt to have my dotfiles in a more organized way
---
- Step 1: Clone this repo
```
  git clone git@gitlab.com:leonardo.sobarzo/dotfiles.git .dotfiles
```
I wanted the repo to be called `.dotfiles` but GitLab doesn't like . as the first character.
- Step 2:
``` 
  cd .dotfiles
  stow */
```


---
# The thing that always forget

```
Section "Device"
    Identifier  "AMD Graphics"
    Driver      "amdgpu"
    Option      "TearFree" "true"
EndSection
```
Here: `/etc/X11/xorg.conf.d/20-amd.conf`
