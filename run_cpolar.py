import subprocess
import time
import os

os.chdir(r"C:\Users\于馨棋\Desktop\CatPaw Desk\seoul-guide")

# Kill any existing cpolar processes
os.system('taskkill /F /IM cpolar.exe 2>nul')

# Start cpolar and capture output
proc = subprocess.Popen(
    [r"C:\Program Files\cpolar\cpolar.exe", "http", "8080"],
    stdout=open("cpolar_out.txt", "w"),
    stderr=subprocess.STDOUT,
    text=True
)
print(f"Started cpolar PID: {proc.pid}")
proc.wait()
