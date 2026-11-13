
---

# 🖥️ Gamescope — The Micro-Compositor

> **Gamescope** (formerly known as *steamcompmgr*) is a micro-compositor that provides per-game resolution scaling, frame limiting, and HDR support — useful for running games in a controlled compositor environment.

---

## 📦 Step 1 — Choose Your Installation Method

There are **two ways** to install Gamescope.

### Option A — Stable Release (simple, recommended)

Install from the official repositories:

```bash
sudo apt-get install gamescope
```

> ✅ Fast, tested, and stable — best for everyday use.

### Option B — Master Branch (from source)

Build from the latest `master` branch.

> ⚠️ **Warning:** On my setup, the master build **forced powersaving** on the graphics card and **dropped FPS** in the QuakeWorld client. Stable is safer unless you need bleeding-edge features.

---

## 🛠️ Step 2 — Install Build Dependencies

For **Debian / Debian-based** systems:

```bash
apt install -y meson ninja-build pkg-config cmake libpipewire-0.3-dev \
    hwdata libx11-dev libwayland-dev libvulkan-dev wayland-protocols \
    libx11-xcb-dev libxdamage-dev libxcomposite-dev libxcursor-dev \
    libxxf86vm-dev libxtst-dev libxres-dev libxmu-dev libxkbcommon-dev \
    libcap-dev libsdl2-dev libavif-dev libpixman-1-dev liblcms2-dev \
    libseat-dev libinput-dev xwayland libxcb-composite0-dev \
    libxcb-ewmh-dev libxcb-icccm4-dev libxcb-res0-dev glslang-tools \
    libluajit-5.1-dev libcatch2-dev
```

| Group | Packages |
|---|---|
| Build system | `meson`, `ninja-build`, `cmake`, `pkg-config` |
| Wayland / Vulkan | `libwayland-dev`, `libvulkan-dev`, `wayland-protocols`, `xwayland` |
| X11 | `libx11-dev`, `libx11-xcb-dev`, `libxdamage-dev`, `libxcomposite-dev`, `libxcursor-dev`, `libxxf86vm-dev`, `libxtst-dev`, `libxres-dev`, `libxmu-dev` |
| Input / session | `libseat-dev`, `libinput-dev`, `libxkbcommon-dev`, `libcap-dev` |
| Graphics / color | `libpixman-1-dev`, `liblcms2-dev`, `libavif-dev`, `glslang-tools` |
| Media / misc | `libpipewire-0.3-dev`, `hwdata`, `libsdl2-dev`, `libluajit-5.1-dev`, `libcatch2-dev` |

---

## 📥 Step 3 — Build from Source

```bash
git clone https://github.com/ValveSoftware/gamescope.git
cd gamescope
git submodule update --init
meson setup --wipe build/
ninja -C build/
```

Test the build by launching a game:

```bash
build/src/gamescope -- <game>
```

---

## 📦 Step 4 — Install the Built Binary

```bash
meson install -C build/ --skip-subprojects
```

Then grant the required real-time scheduling capability:

```bash
sudo setcap 'CAP_SYS_NICE=eip' $(which gamescope)
```

> 💡 **Why `CAP_SYS_NICE`?** Gamescope needs elevated scheduling priority to keep frame pacing smooth. This capability lets it raise its own nice level without full root privileges.

---

### ✅ Summary Checklist

- [ ] Chose install method: **stable** (`apt`) or **master** (source)
- [ ] Build dependencies installed
- [ ] Repo cloned with submodules initialized
- [ ] Built with `meson` + `ninja`
- [ ] Tested via `build/src/gamescope -- <game>`
- [ ] Installed via `meson install`
- [ ] `CAP_SYS_NICE` capability granted

---

