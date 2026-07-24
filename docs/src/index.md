# Degenerate Variational Integrators

This packages serves to document the examples from the paper *Degenerate Variational Integrators*. The integrators are implemented in [GeometricIntegrators.jl](https://github.com/JuliaGNI/GeometricIntegrators.jl) in the modules `GeometricIntegrators.Integrators` and `GeometricIntegrators.Integrators.VPRK`, and the example problems in [GeometricProblems.jl](https://github.com/JuliaGNI/GeometricProblems.jl).

## Numerical Examples

### Lotka-Volterra 2d (singular Lagrangian)

* [Symplectic Gauss-Legendre Runge-Kutta Methods](lotka-volterra-2d-singular/lotka-volterra-2d-singular-srk.md)
* [Degenerate Variational Integrators](lotka-volterra-2d-singular/lotka-volterra-2d-singular-dvi.md)


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
@misc{Kraus:2020:DVIsRepo,
  title={Companion Repository to ``Degenerate Variational Integrators''},
  author={Kraus, Michael},
  year={2021},
  month={16},
  howpublished={\url{https://github.com/michakraus/paper-degenerate-variational-integrators}},
  doi={tba}
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
