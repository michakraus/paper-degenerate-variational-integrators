using GeometricIntegrators
using Weave

GeometricIntegrators.set_config(:verbosity, 0)

Weave.set_chunk_defaults!(:echo => false, :error => true, :results => "raw")

include("../src/lotka-volterra-2d-singular.jl")

weave("../weave/lotka-volterra-2d-singular-dvi.jmd",
         out_path = "src/lotka-volterra-2d-singular",
         doctype = "github",
         mod = LotkaVolterra2dSingularDVI)

weave("../weave/lotka-volterra-2d-singular-srk.jmd",
         out_path = "src/lotka-volterra-2d-singular",
         doctype = "github",
         mod = LotkaVolterra2dSingularDVI)

