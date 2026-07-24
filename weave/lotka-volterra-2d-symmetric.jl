
using Weave

Weave.set_chunk_defaults!(:echo => false, :results => "raw")

include("../src/lotka-volterra-2d-symmetric.jl")


weave("weave/lotka-volterra-2d-symmetric-dvi.jmd",
         out_path = "build/lotka-volterra-2d-symmetric",
         doctype = "github",
         mod = LotkaVolterra2dSymmetricDVI)

weave("weave/lotka-volterra-2d-symmetric-srk.jmd",
         out_path = "build/lotka-volterra-2d-symmetric",
         doctype = "github",
         mod = LotkaVolterra2dSymmetricDVI)

weave("weave/lotka-volterra-2d-symmetric-firk.jmd",
         out_path = "build/lotka-volterra-2d-symmetric",
         doctype = "github",
         mod = LotkaVolterra2dSymmetricDVI)

weave("weave/lotka-volterra-2d-symmetric-vprk-gauss.jmd",
         out_path = "build/lotka-volterra-2d-symmetric",
         doctype = "github",
         mod = LotkaVolterra2dSymmetricDVI)
