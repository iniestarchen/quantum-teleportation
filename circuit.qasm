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
