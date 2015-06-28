import Swish

Swish.project("Swiftest") { project in

  project.module("SwiftestCore") { target in
    target.sourceDir = "src/Swiftest/Core"
  }

  project.app("SwiftestClient", ["SwiftestCore"]) { target in
    target.sourceDir = "src/Swiftest/Client"
  }

  project.task("build", ["SwiftestCore:build", "SwiftestClient:build"])
  project.task("run", ["SwiftestClient:run"])
}
