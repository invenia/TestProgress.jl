using Documenter, TestProgress

makedocs(;
    modules=[TestProgress],
    format=Documenter.HTML(),
    pages=[
        "Home" => "index.md",
    ],
    repo="https://github.com/invenia/TestProgress.jl/blob/{commit}{path}#L{line}",
    sitename="TestProgress.jl",
    authors="Invenia Technical Computing Corporation",
    assets=[
        "assets/invenia.css",
        "assets/logo.png",
    ],
)

deploydocs(;
    repo="github.com/invenia/TestProgress.jl",
)
