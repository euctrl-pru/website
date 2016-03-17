require 'rake'
require 'date'
require 'yaml'
require 'html/proofer'

CONFIG = YAML.load(File.read('_config.yml'))


task default: %w[build]

def check_destination
  # if the relevant directory (cloned from source repo) exists locally
  unless Dir.exist? CONFIG["destination"]
    sh "git clone https://#{ENV['GIT_NAME']}:#{ENV['GH_TOKEN']}@github.com/#{CONFIG["github_user"]}/#{CONFIG["destination_repo"]}.git #{CONFIG["destination"]}"
  end
end



desc 'Build for production'
task :build => :clean do
  jekyll('build')
end







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
    HTML::Proofer.new("./_site", {
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

    # Configure git if this is run in Travis CI
    if ENV["TRAVIS"]
      sh "git config --global user.name 'travis@travis-ci.org'"
      sh "git config --global user.email 'Travis'"
      sh "git config --global push.default simple"

      # deploy only if on master branch
      if ENV["TRAVIS_BRANCH"] == "master"
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
          sh "git commit -m 'Updating to euctrl-pru/euctrl-pru.github.io@#{sha}.'"
          sh "git push origin master"
          puts "Updated destination repo pushed to GitHub Pages"
        end
      end
    end
  end
end
