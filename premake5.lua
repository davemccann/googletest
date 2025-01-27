local configOutputPath = "%{cfg.platform}/%{cfg.buildcfg}"

project("googletest")
kind("StaticLib")
language("C++")
cppdialect("C++17")
staticruntime("Off")

targetdir("bin/" .. configOutputPath)
objdir("bin-obj/" .. configOutputPath)

configmap({
	["Debug"] = "DebugStatic",
	["Release"] = "ReleaseStatic",
})

includedirs({
	"googletest/include",
	"googletest/",
})

files({
	"googletest/include/gtest/**.h",
	"googletest/src/gtest-all.cc",
})

filter("platforms:x64")
system("Windows")

filter("configurations:Debug*")
runtime("Debug")
symbols("On")

filter("configurations:Release*")
runtime("Release")
optimize("Speed")
