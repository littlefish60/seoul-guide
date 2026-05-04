import subprocess
import time

proc = subprocess.Popen(
    [r"C:\Program Files\cpolar\cpolar.exe", "http", "8080"],
    stdout=subprocess.PIPE,
    stderr=subprocess.STDOUT,
    text=True,
    creationflags=subprocess.CREATE_NEW_CONSOLE if hasattr(subprocess, 'CREATE_NEW_CONSOLE') else 0
)
print(f"Started cpolar with PID: {proc.pid}")
time.sleep(8)
proc.terminate()
output, _ = proc.communicate(timeout=2)
print("Output:")
print(output[:5000] if output else "No output received")
