# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)
 
require 'tuxedo/version'
 
Gem::Specification.new do |s|
  s.name        = "tuxedo"
  s.version     = Tuxedo::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Conan Rimmer", "Charles Strahan", "Ed Weng"]
  s.email       = ["conan.rimmer@livingsocial.com", "charles.strahan@livingsocial.com", "ed.weng@livingsocial.com"]
  s.homepage    = "https://github.com/conanr/tuxedo"
  s.summary     = "Wrapper for Cane and Reek for more managable output."
  s.description = "Wrapper for cane and reek used to produce better style with better output."
 
  s.required_rubygems_version = ">= 1.3.6"
 
  s.add_development_dependency "rspec"
  s.add_development_dependency "rake"
  s.add_development_dependency "fabrication"

  s.add_dependency('cane')
  s.add_dependency('reek')
 
  s.executables  = []
  s.bindir       = "bin"
  s.executables  <<  "tuxedo"
  s.files        = Dir.glob("{bin,lib,data}/**/*")
  s.require_path = 'lib'
end