# VPN

**Preferred:** ProtonVPN (free, no data cap)

## Install
```bash
sudo apt update && sudo apt install -y wget apt-transport-https
wget -qO- https://repo.protonvpn.com/debian/public_key.asc | sudo tee /etc/apt/trusted.gpg.d/protonvpn.asc
echo "deb [arch=amd64] https://repo.protonvpn.com/debian stable main" | sudo tee /etc/apt/sources.list.d/protonvpn-stable.list
sudo apt update && sudo apt install -y proton-vpn-gnome-desktop
```

Sign up at [protonvpn.com](https://protonvpn.com) → launch `protonvpn-app` → Quick Connect
