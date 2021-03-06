# lib/helpers.rb - General-purpose helpers
# Copyright (C) 2013 Matteo Panella <morpheus@azzurra.org>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

require 'azdevel'

include Nanoc::Helpers::Rendering
include Nanoc::Helpers::LinkTo
include Nanoc::Helpers::XMLSitemap
include Azzurra::Devel::Navigation
include Azzurra::Devel::Filters
include Azzurra::Devel::Projects
include Azzurra::Devel::News

def get_title
  subtitle = is_front_page? ? "Home" : @item[:title]
  @config[:site_name] + " :: " + subtitle
end

def is_front_page?
  @item.identifier == '/'
end

def is_current_item?(nav_entry)
  not @item[:nav_id].nil? and nav_entry.has_key?(:nav_id) and @item[:nav_id] == nav_entry[:nav_id]
end

def excluded_from_sitemap?(item)
  item.binary? || item[:publish] == false || item[:is_hidden] == true || item.identifier.match(/^\/assets\//) || item.identifier == '/sitemap.xml/' ||
    item.identifier.match(/^\/(google[a-f0-9]+|robots)\//)
end

def route_path(item)
  # in-memory items do not have a file name
  return item.identifier + "index.html" if item[:content_filename].nil?

  url = item[:content_filename].gsub(/^content/, '')

  # Fix output file extension
  extname = '.' + item[:extension].split('.').last
  outext = '.haml'
  if url.match(/(\.[a-zA-Z0-9]+){2}$/)
    outext = ''
  elsif extname == ".less"
    outext = '.css'
  elsif url.match(/^\/js/)
    outext = '.js'
  else
    outext = '.html'
  end
  url.gsub!(extname, outext)

  if url.include?('-')
    url = url.split('-').join('/')
  end

  url
end

def route_assets(item)
  item[:content_filename].gsub(/^content\/assets\/[^\/]+/, '').gsub(/_/, '.')
end

def format_date(date_string)
  begin
    d = Date.parse date_string
    d.strftime('%d/%m/%Y')
  rescue
    date_string
  end
end
