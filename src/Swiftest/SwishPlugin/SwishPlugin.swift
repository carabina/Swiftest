import Swish
import SwishBuildSwift
import SwishUtils

public typealias ConfigFn = BuildTarget -> Void
public let defaultConfig: ConfigFn = { t in return }

func BuildAndRunSpecs(target: BuildTarget) {
	let files = target.sources.flatMap { source in
		FS.scan(source.path, pattern: source.pattern)
	}

	System.exec("mkdir -p \(target.buildDir)")

	let isStale: Bool
	let productPath = File.join(target.buildDir, "runSpecs")

	if !File.exists(productPath) {
		isStale = true
	} else {
		let lastBuilt = File.mtime(productPath)
		let lastChanged: UInt = files.map { $0.mtime }.sort().first ?? lastBuilt + 1
		isStale = lastChanged >= lastBuilt
	}

	if(!isStale) {
		Swish.logger.debug("Test target up-to-date. Running.")

		SwishBuildSwift.RunApp(target)(args: System.args)
		return ()
	}

	let filenames = files.map { $0.path }.join(" ")

	System.exec("cat \(filenames) > \(productPath).swift")
	System.exec("echo 'import SwiftestClient' >> \(productPath).swift")
	System.exec("echo 'SwiftestClient.run()' >> \(productPath).swift")

	let swishLib = File.join(Swish.root, ".swish", "lib")

	target.link(module: "SwiftestCore", path: swishLib)
	target.link(module: "SwiftestClient", path: swishLib)
	target.sources = [(path: target.buildDir, pattern: "*.swift")]

	SwishBuildSwift.BuildApp(target)
	SwishBuildSwift.RunApp(target)()
}

public struct SwiftestBuildDSL {
	public func spec(key: String, _ deps: [String], configure: ConfigFn = defaultConfig) {
		let target = BuildTarget(key: key, deps: deps, build: BuildApp)
		configure(target)

		let buildDeps = target.targetDeps.map { "\($0):build" }

		workspace.tasks.append(Task(key: key, prereqs: buildDeps, fn: { 
			BuildAndRunSpecs(target) 
		}))
	}
}

extension Swish {
	public static let Swiftest = SwiftestBuildDSL()
}
