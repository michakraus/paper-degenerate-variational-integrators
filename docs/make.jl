using Documenter
using GeometricIntegrators

makedocs(;
    authors="Michael Kraus",
    sitename="Degenerate Variational Integrators",
    # Some integrators crash on the degenerate Lagrangian and therefore produce no
    # figures; their pages reference those (missing) images unconditionally. Downgrade
    # the resulting broken-link errors to warnings (Documenter ≥ 1 errors by default).
    warnonly=[:cross_references],
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://michakraus.github.io/paper-degenerate-variational-integrators",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",

        "Lotka-Volterra 2d (singular Lagrangian)" => [
            "Degenerate Variational Integrators" => "lotka-volterra-2d-singular/lotka-volterra-2d-singular-dvi.md",
            "Symplectic Gauss-Legendre Runge-Kutta Methods" => "lotka-volterra-2d-singular/lotka-volterra-2d-singular-srk.md",
            "Gauss-Legendre Runge-Kutta Methods" => "lotka-volterra-2d-singular/lotka-volterra-2d-singular-firk.md",
            "Gauss-Legendre VPRK Methods" => "lotka-volterra-2d-singular/lotka-volterra-2d-singular-vprk-gauss.md",
        ],

        "Lotka-Volterra 2d (symmetric Lagrangian)" => [
            "Degenerate Variational Integrators" => "lotka-volterra-2d-symmetric/lotka-volterra-2d-symmetric-dvi.md",
            "Symplectic Gauss-Legendre Runge-Kutta Methods" => "lotka-volterra-2d-symmetric/lotka-volterra-2d-symmetric-srk.md",
            "Gauss-Legendre Runge-Kutta Methods" => "lotka-volterra-2d-symmetric/lotka-volterra-2d-symmetric-firk.md",
            "Gauss-Legendre VPRK Methods" => "lotka-volterra-2d-symmetric/lotka-volterra-2d-symmetric-vprk-gauss.md",
        ],
    ],
)

# Skipped when the weave matrix of the CI workflow did not complete (`DEPLOY_DOCS` is set
# there): publishing a site that is missing the pages of the failed jobs would silently
# drop results from the documentation. Defaults to deploying, so that local builds and
# manual runs are unaffected.
if get(ENV, "DEPLOY_DOCS", "true") == "true"
    deploydocs(;
        repo="github.com/michakraus/paper-degenerate-variational-integrators",
        devbranch="main"
    )
else
    @warn "Incomplete weave run – skipping deploydocs. The built site is kept as a CI artifact."
end
