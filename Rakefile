task :default => :test

task :test do
  FileList["test/test_*"].each do |file|
    ruby "#{file}"
  end
end
