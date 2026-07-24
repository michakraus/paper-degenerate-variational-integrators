using Documenter
using GeometricIntegrators

makedocs(;
    authors="Michael Kraus",
    sitename="Degenerate Variational Integrators",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://michakraus.github.io/paper-degenerate-variational-integrators",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",

        "Lotka-Volterra 2d (singular Lagrangian)" => [
            "Symplectic Gauss-Legendre Runge-Kutta Methods" => "lotka-volterra-2d-singular/lotka-volterra-2d-singular-srk.md",
            "Degenerate Variational Integrators" => "lotka-volterra-2d-singular/lotka-volterra-2d-singular-dvi.md",
        ],

        # "Lotka-Volterra 2d (symmetric Lagrangian)" => [
        #     "Symplectic Gauss-Legendre Runge-Kutta Methods" => "lotka-volterra-2d-symmetric/lotka-volterra-2d-symmetric-srk.md",
        #     "Gauss-Legendre VPRK Methods" => "lotka-volterra-2d-symmetric/lotka-volterra-2d-symmetric-vprk-gauss.md",
        #     "Gauss-Legendre Runge-Kutta Methods" => "lotka-volterra-2d-symmetric/lotka-volterra-2d-symmetric-firk.md",
        # ],
    ],
)

deploydocs(;
    repo="github.com/michakraus/paper-degenerate-variational-integrators",
    devbranch="main"
)
