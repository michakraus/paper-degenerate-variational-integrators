#
# Smoke test for the weave path: `run_list` including the time step refinement of the
# first-order methods, `integrate_partial`, and the whole CairoMakie plotting stack.
#
#   julia --project test/test_scripts.jl
#
# Not part of `runtests.jl`: it is comparatively slow and produces files.
#

include("../src/lotka-volterra-2d-singular.jl")
include("../src/lotka-volterra-2d-symmetric.jl")
include("../src/massless-charged-particle-singular.jl")
include("../src/massless-charged-particle-standard.jl")

import GeometricProblems
using DegenerateVariationalIntegrators

# `run_list` writes one markdown page per run into the working directory and the figures
# into `figures/` below it, so run it in a temporary directory instead of the repository.
mktempdir() do dir
    cd(dir) do
        # A hundred time steps (a thousand for the refined first-order methods): enough for
        # the energy drift diagnostic, which needs at least ten steps to have intervals.
        problem(mod) = mod.iodeproblem(; timestep = 0.01, timespan = (0.0, 1.0))

        # All problem modules export `run_list`, so they are addressed by their module.
        LotkaVolterra2dSingularDVI.run_list(
            problem(GeometricProblems.LotkaVolterra2dSingular), :DVI, tableaus_dvi())

        LotkaVolterra2dSymmetricDVI.run_list(
            problem(GeometricProblems.LotkaVolterra2dSymmetric), :TableauVPRK, tableaus_vprk_glrk())

        MasslessChargedParticleSingularDVI.run_list(
            problem(GeometricProblems.MasslessChargedParticleSingular), :DVI, tableaus_dvi())

        MasslessChargedParticleStandardDVI.run_list(
            problem(GeometricProblems.MasslessChargedParticle), :TableauVPRK, tableaus_vprk_glrk())

        @info "Generated pages and figures in $(dir):" readdir(dir) readdir("figures")
    end
end
