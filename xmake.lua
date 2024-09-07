-- add_requires("microsoft-proxy 2.4.0")
add_rules("mode.debug", "mode.release")
add_rules("plugin.compile_commands.autoupdate")

set_languages("cxx20", "c++20")

package("ms-proxy")
  set_homepage("https://github.com/microsoft/proxy")
  set_urls("https://github.com/microsoft/proxy/archive/refs/tags/$(version).tar.gz")
  add_versions("3.0.0", "7e073e217e5572bc4c17ed5893273c80ea34c87e1406c853beeb9ca9bdda9733")

  on_install(function (package)
      os.cp("proxy.h", package:installdir("include"))
  end)
package_end()

add_requires("ms-proxy 3.0.0")

target("proxy")
    set_kind("binary")
    add_files("src/*.cpp")
    add_packages("ms-proxy")
