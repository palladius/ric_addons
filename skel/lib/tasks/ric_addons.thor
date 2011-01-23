
class RicAddons < Thor
  desc :help, "Menga's example"
  def help
    puts 'Runno la config con Thor! Doing nuthin actually'
  end

  desc :copy_files, "[subdir='**'] Copies files from ric_addons to your local dir [Try subdir='public/**']"
  method_options :help => false
  def copy_files(subdir = '**' )
    #options[:force] # args as --force
    if options[:help]  # args as --force
      puts "Usage: thor ric:copy_files [subdir]"
      puts "  --help:  this help"
      puts "  --force: force copying (TBIY)"
      return -1
    end
    say "Beware, copying a few files…", :red
    new_ver = File.open('vendor/plugins/ric_addons/VERSION').read rescue "VerErr(#{$!})"
    puts "RicAddons: injecting files from version: #{new_ver}"
    Dir["vendor/plugins/ric_addons/skel/#{subdir}/*"].each do |source|
      destination = source.gsub(/^vendor\/plugins\/ric_addons\/skel\//,'')
      if File.exists?(destination)
        puts "Skipping #{destination} cos it already exists" 
      else
        #puts "Generating #{destination}"
        _copy_single_file(source,destination)
      end
    end
  end
  
  
  
  desc :ric_addons_symlink, 'Should add symlinks from vendors/plugins/ric_addons/ * helpers/models/controllers...'
  def ric_addons_symlink
    puts "TODO.. copy file like: "
  end
  
private
  def _copy_single_file(source,destination)
    say "Copying '#{source}' to '#{destination}'", :yellow
    return if File.exists?(destination)
    if destination.match /rb$/ # if ruby..
      puts "TODO add version in header and DONT TOUCH ME, rather run 'ric_addons:copy_files' again"
    end
    FileUtils.cp(source,destination) rescue "FileCpErr:(#{$!})"
  end

  
end

