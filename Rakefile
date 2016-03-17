require 'rake'
require 'html-proofer'



# remove generated site
def cleanup
  sh 'rm -Rf _site'
end

# launch jekyll
def jekyll(directives = '')
  sh 'bundle exec jekyll ' + directives
end





#############################################################################
#
# Site tasks
#
#############################################################################

namespace :site do

  desc "Generate the site"
  task :build => :clean do
    jekyll('build')
  end


  desc "Generate the site and serve locally"
  task :serve do
    jekyll('serve')
  end


  desc "Generate the site, serve locally and watch for changes"
  task :watch do
    jekyll('serve --watch')
  end


  desc "Check links"
  task :test => :build do
    HTMLProofer.check_directory("./_site", {
                                  :check_favicon => true,
                                  :url_ignore => ['http://localhost:4000']
                                }).run
  end


  desc 'Clean up generated site'
  task :clean do
    cleanup
  end


  desc "Generate the site and push changes to remote origin"
  task :deploy do
    # Detect pull request
    if ENV['TRAVIS_PULL_REQUEST'].to_s.to_i > 0
      puts 'Pull request detected. Not proceeding with deploy.'
      exit
    end

    # Configure git if this is run in Travis CI, see https://github.com/openingscience/book/blob/master/Rakefile
    if ENV["TRAVIS"]
      sh "git config --global user.name '#{ENV['GIT_NAME']}'"
      sh "git config --global user.email '#{ENV['GIT_EMAIL']}'"
      sh "git config --global push.default simple"

      # deploy only if on master branch
      if ENV["TRAVIS_BRANCH"] == "master"

        if [ "$TRAVIS_TAG" = "" ]
        then
          puts "Not a tag, not deploying"
          exit 0
        else
          puts "Building and deploying tag '#{ENV['TRAVIS_TAG']}'"
          puts "Cloning euctrl-pru.github.io..."
          sh "git clone https://#{ENV['GIT_NAME']}:#{ENV['GH_TOKEN']}@github.com/euctrl-pru/euctrl-pru.github.io.git > /dev/null"

          # Generate the site...it goes in _site
          jekyll('build')

          # Commit and push to github
          sha = `git log`.match(/[a-z0-9]{40}/)[0]
          Dir.chdir('euctrl-pru.github.io') do
            sh "git rm -rf * > /dev/null"
            sh "cp -r  ../_site/* ."
            sh "git add --all ."
            sh "git status"
            sh "git commit -m 'Updating to euctrl-pru/euctrl-pru.github.io@#{sha}, tagged '#{ENV['TRAVIS_TAG']}'.'"
            # Make sure to make the output quiet, or else the API token will leak!
            sh "git push --force --quiet origin master"
            puts "Updated destination repo pushed to GitHub Pages"
          end
        end
      end
    end
  end
end
