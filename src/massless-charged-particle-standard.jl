module MasslessChargedParticleStandardDVI

    const Δt = 0.1
    const nt = 100000

    # The Poincaré invariants advect a few hundred trajectories per method instead of one, so they
    # run over a correspondingly shorter time interval — at the same time step.
    const nt_poincare = 1000

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

    # Phase space parameterisations and invariant constructors, all supplied by GeometricProblems:
    # `f_loop`/`f_surface` are the curve and the surface the invariants are taken over,
    # `poincare_invariant_1st`/`_2nd` build them over this gauge's own one- and two-form.
    const PI_SPEC = (loop    = MasslessChargedParticle.f_loop,
                     surface = MasslessChargedParticle.f_surface,
                     first   = MasslessChargedParticle.poincare_invariant_1st,
                     second  = MasslessChargedParticle.poincare_invariant_2nd)

    run_list(args...; kwargs...) = DVI.run_list(PLOT_RECIPES, args...; kwargs...)
    run_poincare(args...; kwargs...) = DVI.run_poincare(PI_SPEC, args...; kwargs...)

    export run_list, run_poincare

end
