
using Weave

Weave.set_chunk_defaults!(:echo => false, :results => "raw")

include("../src/lotka-volterra-2d-singular.jl")


weave("weave/lotka-volterra-2d-singular-dvi.jmd",
         out_path = "build/lotka-volterra-2d-singular",
         doctype = "github",
         mod = LotkaVolterra2dSingularDVI)

weave("weave/lotka-volterra-2d-singular-srk.jmd",
         out_path = "build/lotka-volterra-2d-singular",
         doctype = "github",
         mod = LotkaVolterra2dSingularDVI)

weave("weave/lotka-volterra-2d-singular-firk.jmd",
         out_path = "build/lotka-volterra-2d-singular",
         doctype = "github",
         mod = LotkaVolterra2dSingularDVI)

weave("weave/lotka-volterra-2d-singular-vprk-gauss.jmd",
         out_path = "build/lotka-volterra-2d-singular",
         doctype = "github",
         mod = LotkaVolterra2dSingularDVI)
