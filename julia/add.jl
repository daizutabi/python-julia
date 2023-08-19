using Pkg

include("env.jl")

envs = ["JULIA_CONDAPKG_BACKEND", "JULIA_PYTHONCALL_EXE"]
@assert ENV[envs[1]] == "Null"
@assert endswith(ENV[envs[2]], joinpath(read_envname(), "python.exe"))
for env in envs
    println("$env: $(ENV[env])")
end

open("pkg.txt") do f
    Pkg.add(readlines(f))
end

Pkg.precompile()

const CONFIG_DIR = joinpath(DEPOT_PATH[1], "config")

isdir(CONFIG_DIR) || mkdir(CONFIG_DIR)

function write_startup(path, src)
    open(joinpath(CONFIG_DIR, path), "w") do f
        print(f, src)
    end
end

write_startup("startup.jl", "using Revise\nusing OhMyREPL\n")
write_startup("startup_ijulia.jl", "using Revise\nusing IJuliaFormatter\n")
