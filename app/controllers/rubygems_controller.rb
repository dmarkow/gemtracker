class RubygemsController < ApplicationController
  def hook
    data = JSON.parse(request.raw_post)
    rubygem = Rubygem.find_or_initialize_by_name(data["name"])
    for field in %w(downloads info version_downloads version homepage_uri bug_tracker_uri source_code_uri gem_uri project_uri mailing_list_uri documentation_uri wiki_uri) do
      rubygem[field] = data[field]
    end
    rubygem.save
    render :text => "Okay!"
  end

  def manual_update
    gems = File.readlines("/Users/dylan/dev/gemtracker/z")
    gems.each do |g|
      g.strip!
      matches = g.match(/(.*) \((.*)\)/)
      rubygem = Rubygem.find_or_initialize_by_name(matches[1])
      rubygem.version = matches[2]
      rubygem.save
      puts rubygem.name
    end
  end

  def index
    @rubygems = Rubygem.order(:name)
  end
end
