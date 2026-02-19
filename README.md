# Quantum Teleportation

> **Category**: fundamentals &nbsp;|&nbsp; **Difficulty**: intermediate &nbsp;|&nbsp; **Qubits**: 3 &nbsp;|&nbsp; **Gates**: 7 &nbsp;|&nbsp; **Depth**: 7

Quantum teleportation transfers the full quantum state of a qubit from one location to another using a pre-shared entangled Bell pair and two classical bits of communication. The original qubit is destroyed in the process (no-cloning). In this circuit q[0] holds the state |+⟩ to be teleported, q[1] is Alice's half of the Bell pair, and q[2] is Bob's half. After Alice's Bell measurement and Bob's corrections, q[2] ends up in |+⟩.

## Expected Output

q[2] in state |+⟩ after corrections

## Circuit

The OpenQASM 2.0 circuit is in [`circuit.qasm`](./circuit.qasm).

```
OPENQASM 2.0;
include "qelib1.inc";
// q[0]: state to teleport (|+>), q[1]: Alice EPR qubit, q[2]: Bob EPR qubit
qreg q[3];
creg c0[1];
creg c1[1];
// Prepare state to teleport: |+>
h q[0];
// Create Bell pair (Alice q[1] <-> Bob q[2])
h q[1];
cx q[1],q[2];
// Alice's Bell measurement
cx q[0],q[1];
h q[0];
measure q[0] -> c0[0];
measure q[1] -> c1[0];
// Bob's Pauli corrections based on classical bits
if(c1==1) x q[2];
if(c0==1) z q[2];
```

## Tags

`teleportation` `fundamentals` `bell-measurement` `classical-correction`

## References

- [Bennett et al. (1993). Teleporting an Unknown Quantum State. PRL 70, 1895](https://doi.org/10.1103/PhysRevLett.70.1895)

## License

MIT — part of the [OpenQC Algorithm Catalog](https://github.com/openqc-algorithms).
