require 'rake'

desc "Hook our dotfiles into system-standard positions."
task :install do
  Dir.glob('*.symlink').each do |linkable|
    file = linkable.split('/').last.split('.symlink').last
    target = "#{ENV["HOME"]}/.#{file}"

    if File.exists?(target) || File.symlink?(target)
      next if FileUtils.identical?(linkable, target)
      `mv "$HOME/.#{file}" "$HOME/.#{file}.backup"`
    end
    `ln -s "$PWD/#{linkable}" "#{target}"`
  end
end

task :uninstall do
  Dir.glob('*.symlink').each do |linkable|
    file = linkable.split('/').last.split('.symlink').last
    target = "#{ENV["HOME"]}/.#{file}"

    # Remove all symlinks created during installation
    if File.symlink?(target) && FileUtils.identical?(linkable, target)
      FileUtils.rm(target)
    end

    # Replace any backups made during installation
    if File.exists?("#{ENV["HOME"]}/.#{file}.backup")
      `mv "$HOME/.#{file}.backup" "$HOME/.#{file}"` 
    end
  end
end

task :default => 'install'
