
using CGMethod1D
using Documenter, Pkg

push!(LOAD_PATH,"../src/")

makedocs(
         sitename = "CGMethod1D.jl",
         modules  = [CGMethod1D],
         pages=[
                "Home" => "index.md"
               ])

deploydocs(;
    repo="github.com/cfgarciar/CGMethod1D.jl",
)