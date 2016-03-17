require 'html/proofer'

task default: %w[build]


desc 'Build for production'
task :build => :clean do
  jekyll('build')
end


task :test => :build do
  HTML::Proofer.new("./_site", {
                      :url_ignore => ['http://localhost:4000']
                    }).run
end



desc 'Check links for site already running on localhost:4000'
task :check_links do
  begin
    require 'anemone'

    root = 'http://localhost:4000/'
    puts "Checking links with anemone ... "
    # check-links --no-warnings http://localhost:4000
    Anemone.crawl(root, :discard_page_bodies => true) do |anemone|
      anemone.after_crawl do |pagestore|
        broken_links = Hash.new { |h, k| h[k] = [] }
        pagestore.each_value do |page|
          if page.code != 200
            referrers = pagestore.pages_linking_to(page.url)
            referrers.each do |referrer|
              broken_links[referrer] << page
            end
          else
            puts "OK #{page.url}"
          end
        end
        puts "\n\nLinks with issues: "
        broken_links.each do |referrer, pages|
          puts "#{referrer.url} contains the following broken links:"
          pages.each do |page|
            puts "  HTTP #{page.code} #{page.url}"
          end
        end
      end
    end
    puts "... done!"

  rescue LoadError
    abort 'Install anemone gem: gem install anemone'
  end
end

desc 'Clean up generated site'
task :clean do
  cleanup
end

# remove generated site
def cleanup
  sh 'rm -Rf _site'
end

# launch jekyll
def jekyll(directives = '')
  sh 'bundle exec jekyll ' + directives
end
