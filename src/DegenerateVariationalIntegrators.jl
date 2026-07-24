module DegenerateVariationalIntegrators

    include("common.jl")
    include("tableau_lists.jl")

    export tableaus_vprk_glrk,
           tableaus_srk_glrk,
           tableaus_firk_glrk

end
