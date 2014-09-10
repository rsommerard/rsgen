rsgen
=====

Simple template generator in CLI.

How it works ?
=====

This CLI application use Thor gem.
If you don't have Thor gem installed on your system, run "gem install thor"

To create a new html file called myHTMLFileName run "ruby rsgen.rb html myHTMLFileName"

If you want just an empty html file, run with "-e" or "--empty" option like this "ruby rsgen.rb html -e myHTMLFileName"

To create a new css file called myCSSFileName run "ruby rsgen.rb css myCSSFileName"

To create a new js file called myJSFileName run "ruby rsgen.rb js myJSFileName"
