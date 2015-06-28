import Swish

Swish.project("SwiftestCore") { project in
  project.module("SwiftestCore")
  project.app("SwiftestCLI")

  project.task("build", ["SwiftestCore:build"])
}
