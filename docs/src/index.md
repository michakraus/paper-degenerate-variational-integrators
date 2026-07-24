# Degenerate Variational Integrators

This packages serves to document the examples from the paper *Degenerate Variational Integrators*. The integrators are implemented in [GeometricIntegrators.jl](https://github.com/JuliaGNI/GeometricIntegrators.jl) and the example problems in [GeometricProblems.jl](https://github.com/JuliaGNI/GeometricProblems.jl).

The degenerate variational integrators of the paper are the methods `DVIA` and `DVIB` (first order, integrated with a ten times smaller time step here) as well as `CTDVI` and `CMDVI` (second order). They are compared against the symplectic Gauss-Legendre Runge-Kutta methods `DVRK(Gauss(s))`, the Gauss-Legendre Runge-Kutta methods `Gauss(s)` and the Gauss-Legendre variational partitioned Runge-Kutta methods `VPRKGauss(s)`, all for `s = 1, …, 6`.

## Numerical Examples

### Lotka-Volterra 2d (singular Lagrangian)

* [Degenerate Variational Integrators](lotka-volterra-2d-singular/lotka-volterra-2d-singular-dvi.md)
* [Symplectic Gauss-Legendre Runge-Kutta Methods](lotka-volterra-2d-singular/lotka-volterra-2d-singular-srk.md)
* [Gauss-Legendre Runge-Kutta Methods](lotka-volterra-2d-singular/lotka-volterra-2d-singular-firk.md)
* [Gauss-Legendre VPRK Methods](lotka-volterra-2d-singular/lotka-volterra-2d-singular-vprk-gauss.md)

### Lotka-Volterra 2d (symmetric Lagrangian)

* [Degenerate Variational Integrators](lotka-volterra-2d-symmetric/lotka-volterra-2d-symmetric-dvi.md)
* [Symplectic Gauss-Legendre Runge-Kutta Methods](lotka-volterra-2d-symmetric/lotka-volterra-2d-symmetric-srk.md)
* [Gauss-Legendre Runge-Kutta Methods](lotka-volterra-2d-symmetric/lotka-volterra-2d-symmetric-firk.md)
* [Gauss-Legendre VPRK Methods](lotka-volterra-2d-symmetric/lotka-volterra-2d-symmetric-vprk-gauss.md)


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

## Figure License

> Copyright (c) Michael Kraus <michael.kraus@ipp.mpg.de>
>
> All figures are licensed under the Creative Commons [CC BY-NC-SA 4.0 License](https://creativecommons.org/licenses/by-nc-sa/4.0/).


## Software License

> Copyright (c) Michael Kraus <michael.kraus@ipp.mpg.de>
>
> Permission is hereby granted, free of charge, to any person obtaining a copy
> of this software and associated documentation files (the "Software"), to deal
> in the Software without restriction, including without limitation the rights
> to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
> copies of the Software, and to permit persons to whom the Software is
> furnished to do so, subject to the following conditions:
>
> The above copyright notice and this permission notice shall be included in all
> copies or substantial portions of the Software.
>
> THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
> AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
> OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
> SOFTWARE.
