# kiro_repo

<p align="center">
  <img src="kiro.jpg" alt="Kiro" width="220" />
</p>

The pacman package repository behind the **Kiro** ISO. It holds the
[Calamares](https://calamares.io) installer and Kiro's Calamares
configuration — on **stable** and **next** channels — the packages Kiro pulls
in at build and install time.

> **Note** — this repo is *installer-only by design*. After a normal Kiro
> install it is **not** added to your `/etc/pacman.conf`. (Looking for the
> extras you add *after* install, like Spotify? That's the separate
> `nemesis_repo`.) You can still opt in on any Arch system if you want it on a
> running machine.

## Add the repository

Append this to your `/etc/pacman.conf`, then run `sudo pacman -Syyu`:

```
[kiro_repo]
SigLevel = Never
Server = https://kirodubes.github.io/$repo/$arch
```

## What's inside

A focused set — the Calamares installer plus Kiro's Calamares configuration,
each shipped on two channels (stable + testing):

- **calamares** / **calamares-next** — the GUI installer that drives the Kiro ISO's graphical install.
- **kiro-calamares-config** / **kiro-calamares-config-next** — Kiro's installer configuration.

## Screenshots

<table>
  <tr>
    <td align="center">
      <img src="assets/pictures/kiro-calamares-start.webp" alt="Calamares installer start" width="400" /><br />
      <sub>Calamares installer — start</sub>
    </td>
    <td align="center">
      <img src="assets/pictures/kiro-calamares-end.webp" alt="Calamares installer finished" width="400" /><br />
      <sub>Calamares installer — finish</sub>
    </td>
  </tr>
  <tr>
    <td align="center">
      <img src="assets/pictures/desktop-ohmychadwm.webp" alt="ohmychadwm desktop" width="400" /><br />
      <sub>ohmychadwm desktop</sub>
    </td>
    <td align="center">
      <img src="assets/pictures/desktop-xfce.webp" alt="XFCE desktop" width="400" /><br />
      <sub>XFCE desktop</sub>
    </td>
  </tr>
  <tr>
    <td align="center">
      <img src="assets/pictures/att.webp" alt="Arch Linux Tweak Tool" width="400" /><br />
      <sub>Arch Linux Tweak Tool</sub>
    </td>
    <td align="center">
      <img src="assets/pictures/alacritty-tweak-tool.webp" alt="Alacritty tweak tool" width="400" /><br />
      <sub>Alacritty tweak tool</sub>
    </td>
  </tr>
  <tr>
    <td align="center">
      <img src="assets/pictures/archlinux-betterlockscreen.webp" alt="Betterlockscreen" width="400" /><br />
      <sub>Betterlockscreen</sub>
    </td>
    <td align="center">
      <img src="assets/pictures/archlinux-logout.webp" alt="Logout screen" width="400" /><br />
      <sub>Logout screen</sub>
    </td>
  </tr>
</table>

## Watch the videos

Playlist of all the KIRO videos — including the creation of BUILDRA based on KIRO:

https://www.youtube.com/watch?v=3jdKH6bLgUE&list=PLlloYVGq5pS71UubmlKjjw131PjixMIjW

The build tutorial — follow it and you are already half way there:

https://youtu.be/3jdKH6bLgUE

Live long and prosper.

# Major changes after the videos on YouTube

Make sure you read the major change at the bottom of the readme file on
https://github.com/kirodubes/kiro-iso

# Websites

Information : https://kiroproject.be

# Social Media

Youtube : https://www.youtube.com/erikdubois
