project "yaml-cpp"
	kind "StaticLib"
	language "C++"
	cppdialect "C++17"
	staticruntime "off"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"src/**.h",
		"src/**.cpp",

		"include/**.h",
	}

	includedirs
	{
		"include",
	}

	defines
	{
		"YAML_CPP_STATIC_DEFINE"
	}

	filter "system:windows"
		systemversion "latest"

	filter "system:linux"
		pic "on"

	filter "configurations:Debug"
		defines "GE_DEBUG"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		defines "GE_RELEASE"
		runtime "Release"
		optimize "on"

	filter "configurations:Dist"
		defines "GE_DIST"
		runtime "Release"
		optimize "on"
