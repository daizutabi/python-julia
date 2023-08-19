function read_envname()
    open("../python/create.bat") do f
        lines = readlines(f)
        line = filter(startswith("set ENV_NAME"), lines)[1]
        _, name = split(line, "=")
        strip(name)
    end
end
