#!/bin/sh
# dev.lin.run.gamescope.sh - run ezQuake in gamescope + scx_lavd scheduler in parallel

set -e

# --- Prepare config ---
./name.pl >> ezquake/configs/config.cfg

# --- CPU governor to performance ---
sudo cpufreq-set -g performance

# --- RAPL permissions (for power/energy readings) ---
sudo chmod a+r /sys/class/powercap/intel-rapl/intel-rapl:0/intel-rapl:0:0/energy_uj

# --- Optional allocators (uncomment to use) ---
# export LD_PRELOAD="/usr/lib/x86_64-linux-gnu/libjemalloc.so.2"
export LD_PRELOAD="/usr/lib/x86_64-linux-gnu/libtcmalloc_minimal.so.4" # recomended for FPS single thread games

# --- Cleanup function ---
SCX_LAVD_PID=""
cleanup() {
    if [ -n "$SCX_LAVD_PID" ] && kill -0 "$SCX_LAVD_PID" 2>/dev/null; then
        echo "[run] stopping scx_lavd (pid $SCX_LAVD_PID)..."
        sudo kill "$SCX_LAVD_PID" 2>/dev/null || true
        wait "$SCX_LAVD_PID" 2>/dev/null || true
    fi
}
trap cleanup EXIT INT TERM

# --- Start scx_lavd scheduler in background ---
echo "[run] starting scx_lavd --performance..."
sudo ~/.cargo/bin/scx_lavd --performance &
SCX_LAVD_PID=$!
sleep 0.5  # give it a moment to attach

# --- Run gamescope in foreground ---
echo "[run] launching gamescope..." # remove -w -h to do not use FSR features
gamescope -w 1920 -h 1080 -W 2560 -H 1440 -r 0 --adaptive-sync -f \
    --force-grab-cursor --backend sdl -- \
    gamemoderun ./unezquake-linux-x86_64

# --- When gamescope exits, cleanup runs via trap ---
