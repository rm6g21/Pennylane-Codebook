@qml.qnode(dev)
def two_difforacle_amp(combo):
    """Apply the Grover operator twice to the uniform superposition.

    Args:
        combo (list[int]): A list of bits representing the secret combination.

    Returns:
        array[complex]: The resulting quantum state.
    """
    ##################
    # YOUR CODE HERE #
    ##################

    qml.broadcast(qml.Hadamard,wires=range(n_bits),pattern='single')
    qml.QubitUnitary(oracle_matrix(combo),wires=range(n_bits))
    qml.QubitUnitary(diffusion_matrix(),wires=range(n_bits))
    qml.QubitUnitary(oracle_matrix(combo),wires=range(n_bits))
    qml.QubitUnitary(diffusion_matrix(),wires=range(n_bits))
    return qml.state()
