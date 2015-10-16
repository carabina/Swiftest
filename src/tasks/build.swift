import Swish
import SwishBuildSwift

Swish.Swift.lib("SwiftestClient", ["SwiftestCore"]) { lib in
	lib.sources = [(path: "src/Swiftest/Client", pattern: "*.swift")]
}

Swish.Swift.lib("SwiftestCore") { lib in
	lib.sources = [(path: "src/Swiftest/Core", pattern: "*.swift")]
}

Swish.Swift.lib("SwiftestSwishPlugin") { lib in
	lib.sources = [(path: "src/Swiftest/SwishPlugin", pattern: "*.swift")]

	lib.link(module: "Swish", path: "/usr/local/lib/swish")
	lib.link(module: "SwishBuildSwift", path: "/usr/local/lib/swish")
	lib.link(module: "SwishUtils", path: "/usr/local/lib/swish")
}

Swish.task("build", [
	"SwiftestCore:build",
	"SwiftestClient:build",
	"SwiftestSwishPlugin:build"
])
