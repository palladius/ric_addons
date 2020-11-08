
# Makefile before I learn how to use a Rakefile appropriately :P
install: 
	bundle install --path vendor/bundle

deploy: install
	#sbin/rake-deploy1.sh
	bundle exec rake build
	bundle exec rake release
	echo Correctly built and deployed version 1

clean:
	rm -rf pkg/ doc/

versions:
	ruby -v
	gem -v
	bundle -v