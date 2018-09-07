println("Setup...\n")

deps = [
    "IJulia",
    "VegaLite",
    "HTTP",
    "JSON",
    "ArgParse",
    "Humanize",
    "DataFrames",
]

Pkg.init()
Pkg.update()
println()
foreach(deps) do pkgname
    println("Installing ", pkgname, "...")
    Pkg.add(pkgname)
    println()
end

println("Force precompilation...\n")
foreach(deps) do pkgname
    println("Precompiling ", pkgname, "...")
    try
        Base.compilecache(pkgname)
    catch
        println("... error!")
    end
    println()
end

println("Force IJulia kernel install...")
Pkg.build("IJulia")

println("\nSetup done.")
