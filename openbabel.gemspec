Gem::Specification.new do |s|
  s.name               = "openbabel"
  s.version            = "2.3.1.5"

  s.authors = ["Andreas Maunz, Christoph Helma"]
  s.date = %q{2012-04-03}
  s.description = %q{OpenBabel as a GEM}
  s.email = %q{andreas@maunz.de}
  s.homepage = %q{http://cs.maunz.de}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{OpenBabel!}
  s.test_files = ["test/test_openbabel.rb"]

  s.files = ["Rakefile", "lib/openbabel.rb", "ext/openbabel/Makefile"]
  s.extensions = ['ext/openbabel/extconf.rb']
end
