using Aqua
using Test
using DegenerateVariationalIntegrators

# `Documenter` and `Weave` are in `[deps]` for the `weave/` scripts, not for `src/`.
# `persistent_tasks`: CairoMakie is a direct dependency, so on Julia 1.11 the wrapper's
# `Pkg.precompile` also builds the Makie extensions of PoincareInvariants and GeometricProblems
# after the package loads. On 1.11.9, `tmax = 30` timed out after 43.9 s, and `tmax = 300`
# returned `false` after 53.0 s.
Aqua.test_all(DegenerateVariationalIntegrators; stale_deps = false,
    persistent_tasks = (; tmax = 300))
@test_broken isempty(Aqua.find_stale_deps(Base.PkgId(DegenerateVariationalIntegrators)))  # issue #1
