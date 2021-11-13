Linux server initialization scripts for personal habitual usage. A easy and good way of managing personal server pre-installing package.

Because I often buy cheap vps, It's heavy for server to retain every thing in docker. Moreover, it's more about habitual env setting before work.

Run `main.sh` to start.
- check & install basic package
- basic env/habitual settings(.bash_profile vim etc)
- register some crontab item(like log cleaner)

Folder structure:
- install: files in this dir will be executed without confirmation.
- install_optional: files in this dir will be executed after confirmation.
  - Installer script should support files migration in the same-prefix folder.
    Ex. `telegram-cli.sh` can copy all files in telegram_conf into installation(/root/tg) directory.
- home_config: bash profile and vim configurations (or any file in home folder)
- iptables: iptable configurations
- scripts: some additional tools like log cleaner
