def pure_Monte_Carlo():
        for t in range(1, n_steps):
            rand = numpy.random.standard_normal(N)
            S[t] = S[t - 1] * numpy.exp((r - 0.5 * std ** 2) * deltaT + (std * numpy.sqrt(deltaT) * rand))
        C = numpy.exp(-r * T)  * numpy.sum(numpy.maximum(S[-1] - K, 0)) * (1 / N)
        return C
