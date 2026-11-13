
---

# 🎮 Radeon GPU Setup & Tuning Guide

> Configure your Radeon card for maximum gaming performance with the latest Mesa drivers, GRUB kernel parameters, and LACT tuning.

---

## ⚙️ Step 1 — Enable Full Features in GRUB

Edit `/etc/default/grub` and add the following kernel parameter to unlock all AMDGPU features:

```ini
GRUB_CMDLINE_LINUX_DEFAULT="amdgpu.ppfeaturemask=0xfffffff"
```

Apply the changes and reboot:

```bash
sudo update-grub
reboot
```

---

## 📦 Step 2 — Install the Latest kisak-mesa Drivers

The **kisak-mesa fresh** PPA (maintained by a Valve developer) provides the latest Mesa point releases for Ubuntu, which can improve gaming performance and Vulkan compatibility compared to stock drivers.

Add the PPA and upgrade:

```bash
sudo add-apt-repository ppa:kisak/kisak-mesa
sudo apt update
sudo apt full-upgrade
```

> 💡 **Note:** This PPA supports Ubuntu 24.04 (Noble) and 26.04 (Resolute). Older releases (22.04 and earlier) are discontinued.

### ✅ Verify the Driver Version

After upgrading, confirm the new Mesa version is active:

```bash
glxinfo | grep "OpenGL version"
vulkaninfo --summary
```

> 🔄 **Rollback (optional):** If you encounter issues, you can revert to stock Mesa:
> ```bash
> sudo apt install ppa-purge
> sudo ppa-purge ppa:kisak/kisak-mesa
> ```

---

## 📥 Step 3 — Install LACT (Linux AMDGPU Control Tool)

Download the `.deb` package from the [LACT releases page](https://github.com/ilya-zlobintsev/LACT/releases#release-v0.10.1):

**Version used here:** `v0.10.1`

```bash
sudo dpkg --install lact-0.10.1-0.amd64.ubuntu-2604.deb
```

---

## 🚀 Step 4 — Configure LACT for Your GPU

Launch **LACT** and tune it for your video card.

> 📺 **Reference:** For the **Radeon Red Devil RX 9070**, several YouTube videos show extreme tuning tests. The settings below are based on those.

### Recommended Performance Settings

| # | Setting | Value |
|---|---------|-------|
| 1 | **Voltage** | `-100 mV` (decrease) |
| 2 | **Power consumption** | `374 W` |
| 3 | **Performance control** | `Manual` |
| 4 | **Power profile** | `3D_FULL_SCREEN` |
| 5 | **Zero temperature** | `50 °C` |
| 6 | **Acoustic limit** | `3300` |

> 🔧 **Tip:** Lowering voltage while raising the power limit squeezes more performance out of the card — but always monitor temperatures and stability.

---

## 📄 Step 5 — Import the Ready-Made LACT Profile

A pre-configured JSON profile is available in the **files** section:

```
files/LACT-profile-qw2.json
```

Import it directly into LACT via the profile import option to apply all settings at once.

---

### ✅ Summary Checklist

- [ ] `amdgpu.ppfeaturemask=0xfffffff` added to GRUB
- [ ] `update-grub` run and system rebooted
- [ ] kisak-mesa PPA added and Mesa upgraded
- [ ] Mesa version verified via `glxinfo` / `vulkaninfo`
- [ ] LACT `v0.10.1` installed via `dpkg`
- [ ] Voltage lowered by `-100 mV`
- [ ] Power limit raised to `374 W`
- [ ] Manual performance control enabled
- [ ] `3D_FULL_SCREEN` power profile selected
- [ ] Zero temperature set to `50 °C`
- [ ] Acoustic limit set to `3300`
- [ ] `LACT-profile-qw2.json` imported
