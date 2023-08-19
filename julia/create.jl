using Pkg

include("env.jl")

const MAMBA_DIR = joinpath(ENV["LOCALAPPDATA"], "mambaforge")
const HOME = joinpath(MAMBA_DIR, "envs", read_envname())
ENV["CONDA_JL_CONDA_EXE"] = joinpath(MAMBA_DIR, "Scripts", "mamba.exe")
ENV["CONDA_JL_HOME"] = HOME
ENV["IJULIA_NODEFAULTKERNEL"] = "1"

Pkg.add("IJulia")

using IJulia

installkernel("Julia", env=Dict("JULIA_NUM_THREADS" => "auto"))

const PYTHON = joinpath(HOME, "python.exe")
run(`setx JULIA_CONDAPKG_BACKEND Null`)
run(`setx JULIA_PYTHONCALL_EXE $PYTHON`)

println("Restart command prompt.")
