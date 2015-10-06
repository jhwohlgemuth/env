#!/bin/bash
SSH_USER=${SSH_USERNAME:-vagrant}
echo "Installing desktop"
apt-get install --no-install-recommends -y ubuntu-desktop
apt-get install -y gnome-terminal overlay-scrollbar gnome-session-fallback
apt-get install -y firefox chromium-browser indicator-multiload
USERNAME=${SSH_USER}
LIGHTDM_CONFIG=/etc/lightdm/lightdm.conf
GDM_CUSTOM_CONFIG=/etc/gdm/custom.conf
mkdir -p $(dirname ${GDM_CUSTOM_CONFIG})
echo "[daemon]" >> $GDM_CUSTOM_CONFIG
echo "# Enabling automatic login" >> $GDM_CUSTOM_CONFIG
echo "AutomaticLoginEnable=True" >> $GDM_CUSTOM_CONFIG
echo "AutomaticLoginEnable=${USERNAME}" >> $GDM_CUSTOM_CONFIG
echo "==> Configuring lightdm autologin"
echo "[SeatDefaults]" >> $LIGHTDM_CONFIG
echo "autologin-user=${USERNAME}" >> $LIGHTDM_CONFIG
