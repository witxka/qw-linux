
---

# 🎯 Building & Installing GameMode

> **GameMode** (by Feral Interactive) applies performance optimizations to processes on demand — ideal for squeezing maximum performance out of games.

---

## 🛠️ Step 1 — Prepare the Dev Environment

Install all required build dependencies:

```bash
apt update && apt install -y \
    meson libsystemd-dev pkg-config ninja-build git \
    dbus-user-session libdbus-1-dev libinih-dev build-essential \
    systemd-dev libsystemd-dev
```

| Package | Purpose |
|---|---|
| `meson` / `ninja-build` | Build system |
| `git` | Source retrieval |
| `pkg-config` | Library discovery |
| `build-essential` | Core compiler toolchain |
| `libsystemd-dev` / `systemd-dev` | systemd integration |
| `dbus-user-session` / `libdbus-1-dev` | D-Bus support |
| `libinih-dev` | INI config parsing |

---

## 📥 Step 2 — Build and Install GameMode

Clone the repo and build:

```bash
git clone https://github.com/FeralInteractive/gamemode.git
cd gamemode
./bootstrap.sh
```

> 💡 **Tip:** `./bootstrap.sh` wraps the Meson configure + build + install steps in one go, including the release build.

---

## 🧪 Step 3 — Test the Installation

Verify that GameMode is installed and running correctly:

```bash
gamemoded -t
```

> ✅ A successful run reports all tests as **passed**, confirming the daemon and client library work.

# Section 4 — GameMode Configuration

GameMode reads its configuration from `/etc/gamemode.ini`. The file is divided into sections that control different aspects of behavior: `[general]`, `[filter]`, `[gpu]`, `[cpu]`, `[supervisor]`, and `[custom]`.

An example configuration file is provided in `files/gamemode.ini`. To install it:

```bash
sudo cp files/gamemode.ini /etc/gamemode.ini
```

> 💡 **Tip:** After editing `/etc/gamemode.ini`, the reaper thread picks up changes automatically (every `reaper_freq` seconds, default 5) — no daemon restart is required.
---

### ✅ Summary Checklist

- [ ] Build dependencies installed (`meson`, `ninja-build`, `libsystemd-dev`, `libdbus-1-dev`, `libinih-dev`, …)
- [ ] `gamemode` repo cloned
- [ ] Built and installed via `./bootstrap.sh`
- [ ] `gamemoded -t` passes all tests
- [ ] Example config copied to `/etc/gamemode.ini`
---
