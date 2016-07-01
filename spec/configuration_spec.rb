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

require 'spec_helper'

describe AylienNewsApi::Configuration do
  let(:config) { AylienNewsApi::Configuration.default }

  before(:each) do
    AylienNewsApi.configure do |c|
      c.host = 'api.newsapi.aylien.com'
      c.base_path = 'v1'
    end
  end

  describe '#base_url' do
    it 'should have the default value' do
      expect(config.base_url).to eq('https://api.newsapi.aylien.com/v1')
    end

    it 'should remove trailing slashes' do
      [nil, '', '/', '//'].each do |base_path|
        config.base_path = base_path
        expect(config.base_url).to eq('https://api.newsapi.aylien.com')
      end
    end
  end
end
