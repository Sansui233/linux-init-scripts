Linux server initialization scripts for personal habitual usage. An easy and good way of managing personal server pre-installing package.

Because I often buy cheap vps, It's heavy on server to retain every thing in docker. Moreover, it's more about habitual env setting before work.

Run `main.sh` to start.
- check & install basic package
- basic env/habitual settings(.bash_profile vim etc)
- register some crontab item(like log cleaner)

Folder structure:
- install: files in this directory will be executed without confirmation.
- install_optional: files in this directory will be executed after confirmation.
  - Installer script should support files migration in the same-prefix folder.  
    Ex. `telegram-cli.sh` can copy all files in telegram_conf into installation(/root/tg) directory.
- home_config: bash profile and vim configurations (or any file in home directory)
- iptables: iptable configurations
- scripts: some additional tools like log cleaner
- lib: common function used by `main.sh` and installers

If you want to execute a single installer, run `source conf.sh` first.
