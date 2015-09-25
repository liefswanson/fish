function sbt_init
	if set -q $argv
		echo 'Making project in '(pwd)
	else
		echo 'Making project in '(pwd)'/'$argv[1]

		mkdir -p $argv[1]
		cd $argv[1]
	end

	mkdir -p src/{main,test}/{java,resources,scala}
	mkdir lib project target

	# create an initial build.sbt file
	echo 'name := "MyProject"
version := "1.0"
scalaVersion := "2.11.7"
sbtPlugin := true' > build.sbt

    echo 'sbt.version=0.13.7' > project/build.properties

	echo '*.class
*.log

# sbt specific
.cache/
.history/
.lib/
dist/*
target/
lib_managed/
src_managed/
project/boot/
project/plugins/project/

.ensime_cache/

# Scala-IDE specific
.scala_dependencies
.worksheet' > .gitignore
	sbt gen-ensime
end
