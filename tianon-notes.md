- install `usbipd` in Windows
- attach Yubikey to WSL
  - `usbipd.exe list`
  - `usbipd.exe bind --hardware-id XXXX:YYYY`
  - `usbipd.exe attach --auto-attach --hardware-id 1050:0407 --wsl`
    - this stays captive, but pressing `Ctrl+C` seems fine and still attached
- install `pcscd` inside WSL (outside container)
- bind-mount `/run/pcscd` into container
- profit

`docker build --tag tuf-on-ci .`
`docker run -it --rm --user "$(id -u):$(id -g)" -v "$PWD":/wtf -w /wtf --init --name tuf-on-ci --mount type=bind,src=/run/pcscd,dst=/run/pcscd,ro tuf-on-ci tuf-on-ci-sign [branch-name-here]`
