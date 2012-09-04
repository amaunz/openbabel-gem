# openbabel gem

GEM for [OpenBabel](http://openbabel.sf.net), a chemical library by Geoff Hutchison and others.

openbabel gem has been tested with ruby 1.9. It only compiles on POSIX systems and requires the following to be installed already:

  * openbabel library
  * cmake
  * curl
  * tar, sed, make (those should be present anyway)

## Install
gem install openbabel

It downloads the sources, compiles OpenBabel (if not installed) and the ruby bindings and installs them.
If OpenBabel is not yet installed installation may last very long - please be patient.

Check out [http://cs.maunz.de](http://cs.maunz.de) for more information.
