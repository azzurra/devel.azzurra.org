# lib/azdevel/projects.rb - Project-related helpers
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

module Azzurra::Devel

  module Projects
    def projects
      @projects ||= items.select {|item| item[:kind] == 'project'}
      @projects
    end

    def sorted_projects
      projects.sort_by do |prj|
        prj[:weight]
      end
    end

    def documentation_for_project
      unless defined? @docs
        init_docs
      end
      @docs[@item[:project_id]]
    end

    def downloads_for_project
      unless defined? @dloads
        init_downloads
      end

      @dloads[@item[:project_id]]
    end

    private

    def init_docs
      @docs = {}
      projects.each do |prj|
        @docs[prj[:project_id]] = []
      end
      items.select {|item| item[:kind] == 'documentation'}.each do |doc|
        raise "Null project for #{doc}" if doc[:project].nil?
        @docs[doc[:project]] << doc
      end
    end

    def init_downloads
      @dloads = {}
      projects.each do |prj|
        @dloads[prj[:project_id]] = []
      end

      items.select {|item| item[:kind] == 'download'}.each do |dl|
        # Throw an error for downloads without a project id
        raise "Null project for #{dl}" if dl[:project].nil?
        # And skip downloads for unknown projects
        next if @dloads[dl[:project]].nil?
        @dloads[dl[:project]] << dl
      end
    end
  end

end
