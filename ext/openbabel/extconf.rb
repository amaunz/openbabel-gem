require 'fileutils'
require 'tmpdir'

ob_num_ver="2.3.1"
ob_ver="openbabel-"+ob_num_ver

main_dir = Dir.mktmpdir
ob_main_dir=main_dir+"/"+ob_ver
ob_bindings_dir=ob_main_dir+"/scripts/ruby"

begin
  Dir.chdir main_dir do
    FileUtils.rm_rf ob_main_dir
    `curl -L -d use_mirror=netcologne "http://downloads.sourceforge.net/project/openbabel/openbabel/#{ob_num_ver}/openbabel-#{ob_num_ver}.tar.gz" | tar xz`
  end
  Dir.chdir ob_main_dir do
    `cmake #{ob_main_dir}`
  end
  Dir.chdir ob_bindings_dir do
    `sed -i 's/Init_OpenBabel/Init_openbabel/g' *cpp`
    require './extconf.rb'
    `make`
  end
  FileUtils.cp(ob_bindings_dir+"/openbabel.so", "./")
ensure
  FileUtils.remove_entry_secure main_dir
end
