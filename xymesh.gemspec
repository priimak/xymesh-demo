lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'xymesh/version'

Gem::Specification.new do |spec|
  spec.name = "xymesh"
  spec.version = XYMesh::VERSION
  spec.authors = ["Dmitri Priimak"]
  spec.email = ["priimak+xymesh@gmail.com"]
  spec.description = %q{xymesh is a gem to be used for numerical computations using adaptive mesh refinement}
  spec.summary = %q{xymesh adaptive mesh refinement in Ruby}
  spec.homepage = "https://github.com/priimak/xymesh"
  spec.license = "MIT"
  spec.files = ["lib/xymesh_aux.rb", "lib/xymesh.rb"]
end