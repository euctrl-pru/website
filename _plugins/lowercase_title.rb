module Jekyll


  class Page
    include Liquid::StandardFilters

    # Initialize a new Page.
    #
    # site - The Site object.
    # base - The String path to the source.
    # dir  - The String path between the source and the file.
    # name - The String filename of the file.
    def initialize(site, base, dir, name)
      @site = site
      @base = base
      @dir  = dir
      @name = name

      self.process(name)
      self.read_yaml(File.join(base, dir), name)
      # Monkey patch
      self.data['title_lowercase'] = self.data.has_key?('title') ? downcase(self.data['title']) : 'zzz'
    end
  end

  class Post
    include Liquid::StandardFilters

    def title_lowercase
      downcase(self.title)
    end

    # Convert this post into a Hash for use in Liquid templates.
    #
    # Returns <Hash>
    def to_liquid(attrs = ATTRIBUTES_FOR_LIQUID)
      super(attrs + %w[
        title_lowercase
      ])
    end
  end
end
