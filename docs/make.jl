using CGMethod1D
using Documenter

DocMeta.setdocmeta!(CGMethod1D, :DocTestSetup, :(using CGMethod1D); recursive=true)

makedocs(;
    modules=[CGMethod1D],
    authors="Christian Garcia",
    repo="https://github.com/cfgarciar/CGMethod1D.jl/blob/{commit}{path}#{line}",
    sitename="CGMethod1D.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://cfgarciar.github.io/CGMethod1D.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/cfgarciar/CGMethod1D.jl",
    devbranch="master",
)
