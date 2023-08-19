using Pkg

include("env.jl")

@assert ENV["JULIA_CONDAPKG_BACKEND"] == "Null"
@assert endswith(ENV["JULIA_PYTHONCALL_EXE"], joinpath(read_envname(), "python.exe"))

const CONFIG_DIR = joinpath(DEPOT_PATH[1], "config")

isdir(CONFIG_DIR) || mkdir(CONFIG_DIR)

open("pkg.txt") do f
    Pkg.add(readlines(f))
end

Pkg.precompile()

function write_startup(path, src)
    open(joinpath(CONFIG_DIR, path), "w") do f
        print(f, src)
    end
end

write_startup("startup.jl", "using Revise\nusing OhMyREPL\n")
write_startup("startup_ijulia.jl", "using Revise\nusing IJuliaFormatter\n")
