# lib/azdevel/news.rb - News data source
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

  module News
    require 'yaml'

    def load_news_data(filename='news.yaml')
      if File.exists?(filename)
        news_data = YAML.load_file(filename).symbolize_keys
        # Attach news_data to global configuration
        @config[:news] = news_data
      else
        raise RuntimeError.new("News data file #{filename} does not exist")
      end
    end

  end

end
