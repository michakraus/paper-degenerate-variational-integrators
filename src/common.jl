using Documenter
using Latexify
using Markdown
using Markdown: MD, Paragraph, LineBreak
using Plots

using GeometricIntegrators
using GeometricIntegrators.Integrators.VPRK

using GeometricProblems.Diagnostics
using GeometricProblems.PlotRecipes


function Integrators.integrate!(int::Union{IntegratorVPRK,IntegratorFIRKimplicit,IntegratorSRKimplicit}, sol::Solution)
    asol = AtomicSolution(sol, int)

    # loop over initial conditions showing progress bar
    for m in eachsample(sol)
        get_initial_conditions!(sol, asol, m, 1)
        initialize!(int, asol)

        n = 0
        try
            for outer n in eachtimestep(sol)
                integrate!(int, sol, asol, m, n)
            end
        catch ex
            tstr = " in time step " * string(n)
        
            if nsamples(sol) > 1
                tstr *= " for initial condition " * string(m)
            end
            
            tstr *= "."
            
            if isa(ex, DomainError)
                show(stdout, "text/markdown", Markdown.parse("DOMAIN ERROR: Simulation crashed" * tstr))
                @warn("DOMAIN ERROR: Simulation crashed" * tstr)
            elseif isa(ex, NonlinearSolverException)
                show(stdout, "text/markdown", Markdown.parse("SOLVER ERROR: Simulation crashed" * tstr))
                show(stdout, "text/markdown", Markdown.parse(ex.msg))
                @warn("SOLVER ERROR: Simulation crashed" * tstr)
                @warn(ex.msg)
            else
                show(stdout, "text/markdown", Markdown.parse("ERROR: Simulation crashed with $(typeof(ex)) " * tstr))
                show(stdout, "text/markdown", Markdown.parse(ex.msg))
                @warn("ERROR: Simulation crashed with $(typeof(ex)) " * tstr)
                @warn(ex.msg)
                # showerror(stdout, ex, catch_backtrace())
            end
        end
    end

    nothing
end


_linebreak(io) = show(io, "text/markdown", MD(Paragraph([LineBreak()])))


function _plot_figure_md(file, name, filename)
    # if isfile(filename)
        show(file, "text/markdown", Markdown.parse("![$name]($filename)"))
        _linebreak(file)
    # else
    #     show(stdout, "text/markdown", Markdown.parse("ERROR: Plot output $filename does not exist!"))
    #     @warn("Plot output $filename does not exist!")
    # end
end


function write_plots(dir, file, name, fig_suff)

    plot_file = file * ".md"

    open(plot_file, "w") do f
        show(f, "text/markdown", Markdown.parse("# $name"))
        _linebreak(f)

        _plot_figure_md(f, name, "$(dir)/$(file)_solution$(fig_suff)")
        _plot_figure_md(f, name, "$(dir)/$(file)_traces$(fig_suff)")

        show(f, "text/markdown", Markdown.parse("## Energy Error"))
        _linebreak(f)

        _plot_figure_md(f, name, "$(dir)/$(file)_energy_error$(fig_suff)")
        _plot_figure_md(f, name, "$(dir)/$(file)_energy_drift$(fig_suff)")
        
        show(f, "text/markdown", Markdown.parse("## Constraint"))
        _linebreak(f)
        
        _plot_figure_md(f, name, "$(dir)/$(file)_constraint_error$(fig_suff)")
    end
end


function plot(sol, equ, dir, file, fig_suff)
    if !isdir(dir)
        mkdir(dir)
    end

    try
        plot_lotka_volterra_2d(sol, equ; nt=lastentry(sol), fmt=:png)
        savefig(dir * "/" * file * fig_suff)

        plot_lotka_volterra_2d_solution(sol, equ; nt=lastentry(sol), fmt=:png)
        savefig(dir * "/" * file * "_solution" * fig_suff)

        plot_lotka_volterra_2d_traces(sol, equ; nt=lastentry(sol), fmt=:png)
        savefig(dir * "/" * file * "_traces" * fig_suff)

        H, ΔH = compute_energy_error(sol.t, sol.q, equ.parameters)
        plotenergyerror(sol.t, ΔH; nt=lastentry(sol), fmt=:png)
        savefig(dir * "/" * file * "_energy_error" * fig_suff)

        plotenergydrift(compute_error_drift(sol.t, ΔH, div(ntime(sol), 10))...; nt=lastentry(sol))
        savefig(dir * "/" * file * "_energy_drift" * fig_suff)

        plotconstrainterror(sol.t, compute_momentum_error(sol.t, sol.q, sol.p, (t,q,k)->ϑ(t,q,equ.parameters,k)); nt=lastentry(sol), fmt=:png)
        savefig(dir * "/" * file * "_constraint_error" * fig_suff)
    catch ex
        if isa(ex, DomainError)
            show(stdout, "text/markdown", Markdown.parse("ERROR: Diagnostics crashed with DomainError."))
            @warn("ERROR: Diagnostics crashed with DomainError.")
        else
            show(stdout, "text/markdown", Markdown.parse("ERROR: Plot crashed with $(typeof(ex))"))
            show(stdout, "text/markdown", Markdown.parse(ex.msg))
            @warn("ERROR: Plot crashed with $(typeof(ex))")
            @warn(ex.msg)
            showerror(stdout, ex, catch_backtrace())
        end
    end
end


function run_integrator(iode, tab, integrator, nt, dir, file, fig_suff)
    sol = Solution(iode, Δt, nt)
    int = integrator(iode, tab, Δt)

    integrate!(int, sol)

    plot(sol, iode, dir, file, fig_suff)
end


function run_list(iode, name, list, plot_dir = PLOT_DIR, symp_dir = SYMP_DIR;
                    fig_suff = ".png")

    for run in list
        tab, file = run

        if length(run) ≥ 3
            integrator = run[3]
        else
            integrator = Integrator
        end
        
        write_plots(plot_dir, file, name, fig_suff)

        show(stdout, "text/markdown", Markdown.parse("## $(tab.name)"))
        _linebreak(stdout)

        show(stdout, "text/markdown", Markdown.parse("[Plots]($file.md)"))
        _linebreak(stdout)

        run_integrator(iode, tab, integrator, nt, plot_dir, file, fig_suff)
        show(stdout, "text/markdown", Markdown.parse("![$name]($plot_dir/$file$fig_suff)"))
    end

    nothing
end


function run_single_integrator(iode, integrator, nt, factor, dir, file, fig_suff)
    sol = Solution(iode, Δt/factor, nt*factor)
    int = integrator(iode, Δt/factor)

    integrate!(int, sol)

    plot(sol, iode, dir, file, fig_suff)
end


function run_single(iode::Equation, name::Symbol, integrator, factor = 1, plot_dir = PLOT_DIR, symp_dir = SYMP_DIR;
                    fig_suff = ".png")

    file = string(name)

    write_plots(plot_dir, file, name, fig_suff)

    show(stdout, "text/markdown", Markdown.parse("## $(name)"))
    _linebreak(stdout)

    show(stdout, "text/markdown", Markdown.parse("[Plots]($file.md)"))
    _linebreak(stdout)

    run_single_integrator(iode, integrator, nt, factor, plot_dir, file, fig_suff)
    show(stdout, "text/markdown", Markdown.parse("![$name]($plot_dir/$file$fig_suff)"))

    nothing
end
