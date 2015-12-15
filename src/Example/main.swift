import Swiftest

Swiftest.register([
  ArraySpec.self,
  BoolSpec.self,
  DictionarySpec.self,
  HooksSpec.self,
  NumberSpec.self,
  StringSpec.self
])

try Swiftest.run()
