require 'fileutils'
require 'tmpdir'

ob_num_ver="2.3.1"
ob_ver="openbabel-"+ob_num_ver

main_dir = File.expand_path(File.join(File.dirname(__FILE__),"..","..","src"))
lib_dir = File.expand_path(File.join(File.dirname(__FILE__),"..","..","src"))
Dir.mkdir main_dir
ob_main_dir = File.join(main_dir,ob_ver)
ob_bindings_dir = File.join(ob_main_dir,"scripts","ruby")

begin
  Dir.chdir main_dir do
    FileUtils.rm_rf ob_main_dir
    puts "Downloading OpenBabel sources"
    puts `curl -L -d use_mirror=netcologne "http://downloads.sourceforge.net/project/openbabel/openbabel/#{ob_num_ver}/openbabel-#{ob_num_ver}.tar.gz" | tar xz`
  end
  Dir.chdir ob_main_dir do
    puts "Configuring OpenBabel"
    puts `cmake #{ob_main_dir} -DCMAKE_INSTALL_PREFIX=#{lib_dir}`
    unless File.exists?(`which obabel`.chomp)
      puts "OpenBabel not installed. Compiling sources."
      puts `make`
      puts `make install`
    end
  end
  Dir.chdir ob_bindings_dir do
    puts "Compiling and instaling OpenBabel Ruby bindings."
    `sed -i 's/Init_OpenBabel/Init_openbabel/g' *cpp`
    require './extconf.rb'
    `sed -i 's/-flat_namespace//' Makefile`
    puts `make`
  end
  FileUtils.cp(ob_bindings_dir+"/openbabel.so", "./")
ensure
  FileUtils.remove_entry_secure main_dir
end
