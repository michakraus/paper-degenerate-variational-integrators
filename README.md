# Degenerate Variational Integrators

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://michakraus.github.io/paper-degenerate-variational-integrators/stable)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://michakraus.github.io/paper-degenerate-variational-integrators/dev)

This packages serves to document the examples from the paper *Degenerate Variational Integrators*.

The integrators are implemented in [GeometricIntegrators.jl](https://github.com/JuliaGNI/GeometricIntegrators.jl) and the example problems in [GeometricProblems.jl](https://github.com/JuliaGNI/GeometricProblems.jl).
The corresponding plots can be found in the [documentation](https://michakraus.github.io/paper-degenerate-variational-integrators/stable).

The degenerate variational integrators of the paper are the methods `DVIA` and `DVIB` (first order) as well as `CTDVI` and `CMDVI` (second order). They are compared against the symplectic Gauss-Legendre Runge-Kutta methods `DVRK(Gauss(s))`, the Gauss-Legendre Runge-Kutta methods `Gauss(s)` and the Gauss-Legendre variational partitioned Runge-Kutta methods `VPRKGauss(s)`, each applied to both the singular and the symmetric Lagrangian of the two-dimensional Lotka-Volterra model.

## Reproducing the Figures

Weave all pages of one example into `build/`:

```
make lvsingular
make lvsymmetric
```

Build the documentation, including all figures, in `docs/build/` (`-j8` weaves the eight
pages in parallel):

```
cd docs
make -j8 weave
make documenter
```

Run the test suite, which integrates every method for a single time step:

```
julia --project -e 'using Pkg; Pkg.test()'
```

## References

* Michael Kraus. Degenerate Variational Integrators.

If you use the integrators described in the article above, please cite GeometricIntegrators.jl as

```
@misc{Kraus:2020:GeometricIntegrators,
  title={GeometricIntegrators.jl: Geometric Numerical Integration in Julia},
  author={Kraus, Michael},
  year={2020},
  howpublished={\url{https://github.com/JuliaGNI/GeometricIntegrators.jl}},
  doi={10.5281/zenodo.3648325}
}
```

If you use the figures or implementations provided here, please cite this repository as

```
@misc{Kraus:2021:DVIsRepo,
  title={Companion Repository to ``Degenerate Variational Integrators''},
  author={Kraus, Michael},
  year={2021},
  howpublished={\url{https://github.com/michakraus/paper-degenerate-variational-integrators}},
}
```

## Licenses

This package is licensed under the [MIT "Expat" License](LICENSE.md).
All figures are licensed under the Creative Commons [CC BY-NC-SA 4.0 License](https://creativecommons.org/licenses/by-nc-sa/4.0/).
