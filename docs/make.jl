# using CGMethod1D
# using Documenter, Pkg

# Pkg.precompile()

# const is_ci = haskey(ENV, "GITHUB_ACTIONS")

# makedocs(
#     format=Documenter.HTML(prettyurls=is_ci),
#     sitename="CGMethod1D.jl",
#     doctest = false,
#     strict = false,
#     pages=Any[
#         "Home" => "index.md",
#     ],
# )

# deploydocs(;
#     repo="github.com/cfgarciar/CGMethod1D.jl",
#     push_preview=true,
# )

using CGMethod1D
using Documenter

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