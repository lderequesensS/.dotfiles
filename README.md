# Step 1: Clone this repo
```
  git clone git@github.com:leonardo.sobarzo/dotfiles.git .dotfiles
```

# Step 2:
```
  cd .dotfiles
  stow */
```

---
# The thing that I always forget
```
Section "Device"
    Identifier  "AMD Graphics"
    Driver      "amdgpu"
    Option      "TearFree" "true"
EndSection
```
Here: `/etc/X11/xorg.conf.d/20-amd.conf`
