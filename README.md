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
> `nemesis_repo`.)

## What's inside

A focused set — the Calamares installer, Kiro's Calamares configuration, and
the Calamares Tweak Tool, each shipped on a stable and a testing channel:

- **calamares** / **calamares-next** — the GUI installer that drives the Kiro ISO's graphical install.
- **kiro-calamares-config** / **kiro-calamares-config-next** — Kiro's installer configuration.
- **kiro-calamares-tweak-tool** / **kiro-calamares-tweak-tool-nemesis** — a dev/expert tool (PySide6/QML) to preset Calamares' encryption and bootloader before an install; installer-only, not left on the system afterwards.

## Screenshots

<table>
  <tr>
    <td align="center">
      <img src="assets/screenshots/kiro-calamares-start.webp" alt="Calamares installer start" width="400" /><br />
      <sub>Calamares installer — start</sub>
    </td>
    <td align="center">
      <img src="assets/screenshots/kiro-calamares-end.webp" alt="Calamares installer finished" width="400" /><br />
      <sub>Calamares installer — finish</sub>
    </td>
  </tr>
  <tr>
    <td align="center">
      <img src="assets/screenshots/desktop-ohmychadwm.webp" alt="ohmychadwm desktop" width="400" /><br />
      <sub>ohmychadwm desktop</sub>
    </td>
    <td align="center">
      <img src="assets/screenshots/desktop-xfce.webp" alt="XFCE desktop" width="400" /><br />
      <sub>XFCE desktop</sub>
    </td>
  </tr>
  <tr>
    <td align="center">
      <img src="assets/screenshots/att.webp" alt="Arch Linux Tweak Tool" width="400" /><br />
      <sub>Arch Linux Tweak Tool</sub>
    </td>
    <td align="center">
      <img src="assets/screenshots/alacritty-tweak-tool.webp" alt="Alacritty tweak tool" width="400" /><br />
      <sub>Alacritty tweak tool</sub>
    </td>
  </tr>
  <tr>
    <td align="center">
      <img src="assets/screenshots/archlinux-betterlockscreen.webp" alt="Betterlockscreen" width="400" /><br />
      <sub>Betterlockscreen</sub>
    </td>
    <td align="center">
      <img src="assets/screenshots/archlinux-logout.webp" alt="Logout screen" width="400" /><br />
      <sub>Logout screen</sub>
    </td>
  </tr>
</table>

## Watch the videos

Playlist of all the KIRO videos — including the creation of BUILDRA based on KIRO:

https://www.youtube.com/watch?v=3jdKH6bLgUE&list=PLlloYVGq5pS71UubmlKjjw131PjixMIjW

The build tutorial — follow it and you are already half way there:

https://youtu.be/Ciqao_oWvM0

Live long and prosper.

# Major changes after the videos on YouTube

Make sure you read the major change at the bottom of the readme file on
https://github.com/kirodubes/kiro-iso

# Websites

Information : https://kiroproject.be

# Social Media

Youtube : https://www.youtube.com/erikdubois

<!-- KIRO-FUNDING-FOOTER:START — managed by Kiro-HQ/cascade-readme-footer.sh -->
## Help fund Kiro

Everything I build here stays free and open — always. If Kiro or any of these
tools have ever saved you time or taught you something, a small monthly
contribution helps keep the work going. Donations target break-even, nothing
more — the core always stays free for everyone.

- GitHub Sponsors: https://github.com/sponsors/erikdubois
- Patreon: https://www.patreon.com/c/kiroproject
- YouTube memberships: https://www.youtube.com/@ErikDubois/join
- Ko-fi: https://ko-fi.com/erikdubois
- PayPal: https://www.paypal.me/erikdubois
<!-- KIRO-FUNDING-FOOTER:END -->
