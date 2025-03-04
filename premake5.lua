project("googletest")
    kind("StaticLib")
    language("C++")
    cppdialect("C++20")
    staticruntime("off")

    targetdir ("bin/" .. "%{cfg.platform}" .. "%{cfg.buildcfg}")
    objdir ("bin-obj/" .. "%{cfg.platform}" .. "%{cfg.buildcfg}")

    includedirs {
        "googletest/include",
        "googletest/",
    }

    files {
        "googletest/include/gtest/**.h",
        "googletest/src/gtest-all.cc",
    }

    filter "action:gmake"
        buildoptions { "-MJ compile_commands.json" }

    filter { "system:windows", "toolset:clang" }
        defines { "_UNICODE", "UNICODE" }
        buildoptions { "-g -gcodeview" }

    filter "configurations:*"
        symbols "on"

    filter "configurations:Debug"
        runtime "Debug"
        optimize "off"

    filter "configurations:Release"
        runtime "Release"
        optimize "on"
