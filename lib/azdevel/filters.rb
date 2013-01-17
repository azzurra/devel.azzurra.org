# lib/azdevel/filters.rb - Special Nanoc filters
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

require 'nanoc'

module Azzurra::Devel

  module Filters
    class MetaFilter < Nanoc::Filter
      identifier :meta
      type :text

      def run(content, params = {})
        params = {:open => '$$$$', :close => '/$$$$'}.merge(params)
        matcher = /
          (                                 (?# all the content)
          #{Regexp.escape(params[:open])}   (?# opening delimiter)
          (?:\(([^()]+)\))?                 (?# filter name; optional; contains anything except parentheses)
          (.*?)                             (?# stingy-match content)
          #{Regexp.escape(params[:close])}  (?# closing delimiter)
          )
          /mx
        content.dup.tap do |buf|
          content.scan(matcher).uniq.each do |all_content, filter_name, matched_content|
            filter_class = Nanoc3::Filter.named(filter_name)
            raise Nanoc3::Errors::UnknownFilter.new(filter_name) if filter_class.nil?

            filtered_content = filter_class.new(assigns).run(matched_content)
            buf.gsub!(all_content, filtered_content)
          end
        end
      end
    end
  end

end
