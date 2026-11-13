
---

# ⚡ Installing the `scx_lavd` Scheduler

> `scx_lavd` (Latency-sensitive AV D) is a recommended scheduler for **FPS gaming** on modern kernels. It's part of the **sched-ext** project and is built from source.

---

## 🛠️ Step 1 — Set Up the Dev Environment

Install all required build dependencies:

```bash
sudo apt install -y build-essential cmake cargo rustc clang llvm \
    pkg-config libelf-dev protobuf-compiler libseccomp-dev \
    libbpf-dev pahole
```

| Package | Purpose |
|---|---|
| `build-essential` | Core compiler toolchain |
| `cmake` | Build system |
| `cargo` / `rustc` | Rust toolchain (needed for scx) |
| `clang` / `llvm` | LLVM compiler for eBPF |
| `pkg-config` | Library discovery |
| `libelf-dev` | ELF handling |
| `protobuf-compiler` | Protocol buffer support |
| `libseccomp-dev` | Seccomp sandboxing library |
| `libbpf-dev` | eBPF loading library |
| `pahole` | BTF / debug info generation |

---

## 📥 Step 2 — Build the scx Schedulers from Source

```bash
git clone https://github.com/sched-ext/scx.git
cd scx
cargo build --release
```

---

## 📦 Step 3 — Install the scx Schedulers

Install all Rust schedulers found under `scheds/rust/`:

```bash
ls -d scheds/rust/scx_* | xargs -I{} cargo install --path {}
```

---

## 🧪 Step 4 — Test the Installation

Run `scx_lavd` in performance mode to verify it works:

```bash
sudo ~/.cargo/bin/scx_lavd --performance
```

> 💡 **Tip:** `--performance` optimizes the scheduler for throughput and responsiveness — ideal for FPS games. Press `Ctrl+C` to stop it after testing.

---

### ✅ Summary Checklist

- [ ] Build dependencies installed (`build-essential`, `cargo`, `clang`, `libbpf-dev`, `pahole`, …)
- [ ] `scx` repo cloned
- [ ] Schedulers built with `cargo build --release`
- [ ] Schedulers installed via `cargo install`
- [ ] `scx_lavd --performance` runs successfully

---
