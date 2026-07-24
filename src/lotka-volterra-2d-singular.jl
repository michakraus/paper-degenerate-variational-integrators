module LotkaVolterra2dSingularDVI

    const Δt = 0.1
    const nt = 100000

    using GeometricIntegrators

    using GeometricProblems.LotkaVolterra2dSingular
    # Both Lotka-Volterra gauges share the plot recipes of the standard problem.
    using GeometricProblems.LotkaVolterra2d: plot_solution, plot_phase_portrait, plot_traces

    import DegenerateVariationalIntegrators as DVI
    using DegenerateVariationalIntegrators: tableaus_dvi, tableaus_vprk_glrk,
        tableaus_srk_glrk, tableaus_firk_glrk

    const PLOT_RECIPES = (solution       = plot_solution,
                          phase_portrait = plot_phase_portrait,
                          traces         = plot_traces)

    run_list(args...; kwargs...) = DVI.run_list(PLOT_RECIPES, args...; kwargs...)

    export run_list

end
