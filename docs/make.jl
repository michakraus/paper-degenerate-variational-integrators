using Documenter
using GeometricIntegrators

makedocs(;
    authors="Michael Kraus",
    sitename="Degenerate Variational Integrators",
    # Keep broken references in the generated material non-fatal (Documenter ≥ 1 errors on
    # them by default): the pages under `docs/src/<problem>/` are written by `run_list`, and
    # a build in which some integrators crashed should still yield a site to look at.
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

        "Massless Charged Particle (singular vector potential)" => [
            "Degenerate Variational Integrators" => "massless-charged-particle-singular/massless-charged-particle-singular-dvi.md",
            "Symplectic Gauss-Legendre Runge-Kutta Methods" => "massless-charged-particle-singular/massless-charged-particle-singular-srk.md",
            "Gauss-Legendre Runge-Kutta Methods" => "massless-charged-particle-singular/massless-charged-particle-singular-firk.md",
            "Gauss-Legendre VPRK Methods" => "massless-charged-particle-singular/massless-charged-particle-singular-vprk-gauss.md",
        ],

        "Massless Charged Particle (standard vector potential)" => [
            "Degenerate Variational Integrators" => "massless-charged-particle-standard/massless-charged-particle-standard-dvi.md",
            "Symplectic Gauss-Legendre Runge-Kutta Methods" => "massless-charged-particle-standard/massless-charged-particle-standard-srk.md",
            "Gauss-Legendre Runge-Kutta Methods" => "massless-charged-particle-standard/massless-charged-particle-standard-firk.md",
            "Gauss-Legendre VPRK Methods" => "massless-charged-particle-standard/massless-charged-particle-standard-vprk-gauss.md",
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
