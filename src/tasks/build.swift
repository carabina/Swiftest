import Swish
import SwishBuildSwift

Swish.Swift.lib("SwiftestClient", ["SwiftestCore"]) { lib in 
	lib.sources = [(path: "src/Swiftest/Client", pattern: "*.swift")]
}

Swish.Swift.lib("SwiftestCore") { lib in
	lib.sources = [(path: "src/Swiftest/Core", pattern: "*.swift")]
}

Swish.task("build", ["SwiftestCore:build", "SwiftestClient:build"])
