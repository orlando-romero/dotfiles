#  ~/.ipython/profile_default/startup/startup.py
import subprocess


def viu(file_path, width=50, height=None, transparent=False, show_name=True):
    cmd = ["viu"]
    if transparent:
        cmd.append("-t")
    if width:
        cmd.extend(["-w", str(width)])
    if height:
        cmd.extend(["-h", str(height)])
    if show_name:
        cmd.append("-n")
    cmd.append(file_path)
    subprocess.run(cmd)


try:
    import numpy as np
except:
    pass

try:
    import matplotlib.pyplot as plt

    fig_counter = 0

    def icat(width=50, height=None, transparent=False, show_name=True):
        plt.savefig("temp_fig.png")
        viu("temp_fig.png", width=width, height=height, transparent=transparent, show_name=show_name)

except:
    icat = viu

try:
    import pandas as pd
except:
    pass

try:
    from IPython import get_ipython

    ipython = get_ipython()
    if ipython:
        ipython.magic("load_ext autoreload")
        ipython.magic("autoreload 2")
        ipython.magic("clear")
        # plt.ion()
except:
    pass
