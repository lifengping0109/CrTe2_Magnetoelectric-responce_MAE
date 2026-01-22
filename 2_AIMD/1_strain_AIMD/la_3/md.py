#grep "!" scf.out | awk '{print $5}' >>bl.dat
import numpy as np
energies=np.genfromtxt('bl.dat')

import matplotlib.pyplot as plt

# --- Step 1: Save your energies in a text file ---
# Suppose you saved them in 'energy.dat', one energy per line, like:
# -230.82228932
# -231.81335888
# ...

# --- Step 2: Load energies ---
# energies = np.loadtxt('energy.dat')  # shape = (N_steps,)

# --- Step 3: Create step array ---
steps = np.arange(1, len(energies)+1)  # Step 1, 2, ..., N

# # --- Step 4: Plot ---
plt.figure(figsize=(6,4))
plt.plot(steps, energies-np.min(energies))
plt.xlabel('MD Step')
plt.ylabel('Total Energy (Ry)')
plt.title('MD Energy vs Step')
# plt.grid(True)
plt.tight_layout()
# plt.ylim(-232.030,-232)
plt.show()

