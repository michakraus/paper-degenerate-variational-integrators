module MasslessChargedParticleStandardDVI

    const Δt = 0.1
    const nt = 100000

    using GeometricIntegrators

    # Standard (two-component) vector potential: gauge-equivalent to the singular one, but
    # not of the form the degenerate variational integrators are formulated for. In contrast
    # to the Lotka-Volterra gauges, this problem module provides its own plot recipes.
    using GeometricProblems.MasslessChargedParticle

    import DegenerateVariationalIntegrators as DVI
    using DegenerateVariationalIntegrators: tableaus_dvi, tableaus_vprk_glrk,
        tableaus_srk_glrk, tableaus_firk_glrk

    const PLOT_RECIPES = (solution       = plot_solution,
                          phase_portrait = plot_phase_portrait,
                          traces         = plot_traces)

    run_list(args...; kwargs...) = DVI.run_list(PLOT_RECIPES, args...; kwargs...)

    export run_list

end
