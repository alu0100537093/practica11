require "bundler/gem_tasks"

task :default => :spec

desc "Ejecutar las expectativas de la clase Examen"
task :spec do
	 sh "rspec -Ilib -Ispec spec/exam_spec.rb"
end

desc "Ejecutar las expectativas con documentacion"
task :doc do 
    sh "rspec -Ilib -Ispec spec/exam_spec.rb --format documentation"
end

desc "Ejecutar las expectativas en html"
task :html do 
    sh "rspec -Ilib -Ispec spec/exam_spec.rb --format html"
end

