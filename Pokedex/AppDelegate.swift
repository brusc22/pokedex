def antithetic_Monte_Carlo():
    n = int(N/2)
    S1 = S[:,0:n]
    S2 = S[:,0:n]

    for t in range(1, n_steps):
        rand1 = numpy.random.standard_normal(n)
        rand2 = -rand1
        S1[t] = S1[t - 1] * numpy.exp((r - 0.5 * std ** 2) * deltaT + (std * numpy.sqrt(deltaT) * rand1))
        S2[t] = S2[t - 1] * numpy.exp((r - 0.5 * std ** 2) * deltaT + (std * numpy.sqrt(deltaT) * rand2))

    STot = numpy.concatenate((S1,S2), axis=1)

    C = numpy.exp(-r * T) * numpy.sum(numpy.maximum(STot[-1] - K, 0)) * (1 / N)

    return C
