![Shortix](https://raw.githubusercontent.com/Jannomag/shortix/main/shortix_logo.svg)     
A script that creates human readable symlinks for Proton game prefixes

# Prerequisites
> [!NOTE]
> This is made with desktop Arch Linux (or derivatives thereof) in mind, and *only* tested with the **native** version of Steam! Currently not guaranteed to symlink correctly on Flatpak environments.

Install Protontricks either:
 - From the AUR:
 ```
 $ git clone https://aur.archlinux.org/protontricks.git
 cd protontricks
 makepkg -si

 # or more simply, if you use an AUR helper (yay/paru):
 $ {paru|yay} protontricks  # then select protontricks
 ```
 - From the chaotic-aur:
 ```
 # pacman -S protontricks
 ```
 - From Flathub:
 ```
 $ flatpak install com.github.Matoking.protontricks
 ```

# Installation (Package Manager)
Build from the AUR!
```
$ git clone https://aur.archlinux.org/shortix-desktop.git
cd shortix-desktop
makepkg -i
```
Once finished and installed, enable with:
```
# systemctl enable --now shortix
```
Proton prefix symlinks are created in `$HOME/.steam/protonPrefixes`

# Background and explanation
The original author, Jannomag, wanted to have easier access to the prefixes for the games on their Steam Deck, so they created **Shortix.**
And then some other numbnut [whom you might have heard of](https://www.youtube.com/watch?v=UpRTaM2-NIQ) came across the original project, and wanted to use it on their desktop to more easily mod Steam games ~~and maybe talk about it eventually in a modding video hint-hint nudge~~.

This fork provides:
 - A modified shortix(.sh) that creates its shortcuts and mark files in `$HOME/.steam/protonPrefixes` (to mitigate [home folder clutter](https://old.reddit.com/r/linux/comments/971m0z/im_tired_of_folders_littering_my_home_directory/) as much as possible) - and also named as a typical executable!
 - Modified the systemd service file to point to systemwide directory, and allow it to be installed as a system-level service rather than a user one.
 - Packaged to build and integrate nicely on Arch Linux systems!

How shortix works:
- Runs protontricks to get a list of all installed games, including Non-Steam games.
- Use the data to create symlinks in `/home/{yourUsername}/.steam/protonPrefixes`
- If there's a dead end symlink, it will get removed
- The script will be executed every 15 minutes by a systemd system service

To change the restart interval, adjust `/etc/systemd/system/shortix.service` - change the 1800s value to your desired value in seconds

You can also manually invoke the script by simply running `shortix`.

# Prefix removal script
An additional script, `shortix-remove`, allows you to delete a game(s)' prefix or shadercache folder - when run, simply drag-and-drop any proton prefix and/or shadercache symlinks from a file browser into the terminal window it's being run in.
Afterwards press enter, the script will notify you about the paths and confirm whether you want to delete them.
> [!WARNING]
> The deletion **will remove the prefix / shadercache completely!** Prefixes often includes game-specific configuration files and/or user data/save files--if your game doesn't support Steam Cloud Saves, *please backup any files you care about restoring later before confirming!*

# Tested systems / distros
- EndeavourOS (w/ native Steam/Protontricks)

# Contribution
If you have any suggestions, let me know!
