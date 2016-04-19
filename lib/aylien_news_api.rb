# Copyright 2016 Aylien, Inc. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Common files
require 'aylien_news_api/api_client'
require 'aylien_news_api/api_error'
require 'aylien_news_api/version'
require 'aylien_news_api/configuration'

# Models
require 'aylien_news_api/models/author'
require 'aylien_news_api/models/autocomplete'
require 'aylien_news_api/models/autocompletes'
require 'aylien_news_api/models/category'
require 'aylien_news_api/models/category_links'
require 'aylien_news_api/models/coverages'
require 'aylien_news_api/models/entities'
require 'aylien_news_api/models/entity'
require 'aylien_news_api/models/entity_links'
require 'aylien_news_api/models/error'
require 'aylien_news_api/models/error_links'
require 'aylien_news_api/models/errors'
require 'aylien_news_api/models/histogram_interval'
require 'aylien_news_api/models/histograms'
require 'aylien_news_api/models/location'
require 'aylien_news_api/models/media'
require 'aylien_news_api/models/related_stories'
require 'aylien_news_api/models/scope'
require 'aylien_news_api/models/sentiment'
require 'aylien_news_api/models/sentiments'
require 'aylien_news_api/models/share_count'
require 'aylien_news_api/models/share_counts'
require 'aylien_news_api/models/source'
require 'aylien_news_api/models/stories'
require 'aylien_news_api/models/story'
require 'aylien_news_api/models/story_cluster'
require 'aylien_news_api/models/story_links'
require 'aylien_news_api/models/summary'
require 'aylien_news_api/models/time_series'
require 'aylien_news_api/models/time_series_list'
require 'aylien_news_api/models/trend'
require 'aylien_news_api/models/trends'

# APIs
require 'aylien_news_api/api/default_api'

module AylienNewsApi
  class << self
    # Customize default settings for the SDK using block.
    #   AylienNewsApi.configure do |config|
    #     config.username = "xxx"
    #     config.password = "xxx"
    #   end
    # If no block given, return the default Configuration object.
    def configure
      if block_given?
        yield(Configuration.default)
      else
        Configuration.default
      end
    end
  end
end
