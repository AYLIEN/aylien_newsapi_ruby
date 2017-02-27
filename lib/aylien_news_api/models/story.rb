=begin
Copyright 2017 Aylien, Inc. All Rights Reserved.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
=end

require 'date'

module AylienNewsApi

  class Story
    # ID of the story which is a unique identification
    attr_accessor :id

    # Title of the story
    attr_accessor :title

    # Body of the story
    attr_accessor :body

    # The suggested story summary
    attr_accessor :summary

    # The story source
    attr_accessor :source

    # The story author
    attr_accessor :author

    # Extracted entities from the story title or body
    attr_accessor :entities

    # Extracted keywords mentioned in the story title or body
    attr_accessor :keywords

    # An array of suggested Story hashtags
    attr_accessor :hashtags

    # Character count of the story body
    attr_accessor :characters_count

    # Word count of the story body
    attr_accessor :words_count

    # Sentence count of the story body
    attr_accessor :sentences_count

    # Paragraph count of the story body
    attr_accessor :paragraphs_count

    # Suggested categories for the story
    attr_accessor :categories

    # Social shares count for the story
    attr_accessor :social_shares_count

    # An array of extracted media such as images and videos
    attr_accessor :media

    # Suggested sentiments for the story title or body
    attr_accessor :sentiment

    # Language of the story
    attr_accessor :language

    # Published date of the story
    attr_accessor :published_at

    # Links which is related to the story
    attr_accessor :links


    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'id' => :'id',
        :'title' => :'title',
        :'body' => :'body',
        :'summary' => :'summary',
        :'source' => :'source',
        :'author' => :'author',
        :'entities' => :'entities',
        :'keywords' => :'keywords',
        :'hashtags' => :'hashtags',
        :'characters_count' => :'characters_count',
        :'words_count' => :'words_count',
        :'sentences_count' => :'sentences_count',
        :'paragraphs_count' => :'paragraphs_count',
        :'categories' => :'categories',
        :'social_shares_count' => :'social_shares_count',
        :'media' => :'media',
        :'sentiment' => :'sentiment',
        :'language' => :'language',
        :'published_at' => :'published_at',
        :'links' => :'links'
      }
    end

    # Attribute type mapping.
    def self.api_types
      {
        :'id' => :'Integer',
        :'title' => :'String',
        :'body' => :'String',
        :'summary' => :'Summary',
        :'source' => :'Source',
        :'author' => :'Author',
        :'entities' => :'Entities',
        :'keywords' => :'Array<String>',
        :'hashtags' => :'Array<String>',
        :'characters_count' => :'Integer',
        :'words_count' => :'Integer',
        :'sentences_count' => :'Integer',
        :'paragraphs_count' => :'Integer',
        :'categories' => :'Array<Category>',
        :'social_shares_count' => :'ShareCounts',
        :'media' => :'Array<Media>',
        :'sentiment' => :'Sentiments',
        :'language' => :'String',
        :'published_at' => :'DateTime',
        :'links' => :'StoryLinks'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}){|(k,v), h| h[k.to_sym] = v}

      if attributes.has_key?(:'id')
        self.id = attributes[:'id']
      end

      if attributes.has_key?(:'title')
        self.title = attributes[:'title']
      end

      if attributes.has_key?(:'body')
        self.body = attributes[:'body']
      end

      if attributes.has_key?(:'summary')
        self.summary = attributes[:'summary']
      end

      if attributes.has_key?(:'source')
        self.source = attributes[:'source']
      end

      if attributes.has_key?(:'author')
        self.author = attributes[:'author']
      end

      if attributes.has_key?(:'entities')
        self.entities = attributes[:'entities']
      end

      if attributes.has_key?(:'keywords')
        if (value = attributes[:'keywords']).is_a?(Array)
          self.keywords = value
        end
      end

      if attributes.has_key?(:'hashtags')
        if (value = attributes[:'hashtags']).is_a?(Array)
          self.hashtags = value
        end
      end

      if attributes.has_key?(:'characters_count')
        self.characters_count = attributes[:'characters_count']
      end

      if attributes.has_key?(:'words_count')
        self.words_count = attributes[:'words_count']
      end

      if attributes.has_key?(:'sentences_count')
        self.sentences_count = attributes[:'sentences_count']
      end

      if attributes.has_key?(:'paragraphs_count')
        self.paragraphs_count = attributes[:'paragraphs_count']
      end

      if attributes.has_key?(:'categories')
        if (value = attributes[:'categories']).is_a?(Array)
          self.categories = value
        end
      end

      if attributes.has_key?(:'social_shares_count')
        self.social_shares_count = attributes[:'social_shares_count']
      end

      if attributes.has_key?(:'media')
        if (value = attributes[:'media']).is_a?(Array)
          self.media = value
        end
      end

      if attributes.has_key?(:'sentiment')
        self.sentiment = attributes[:'sentiment']
      end

      if attributes.has_key?(:'language')
        self.language = attributes[:'language']
      end

      if attributes.has_key?(:'published_at')
        self.published_at = attributes[:'published_at']
      end

      if attributes.has_key?(:'links')
        self.links = attributes[:'links']
      end

    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properies with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      return invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return true
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          id == o.id &&
          title == o.title &&
          body == o.body &&
          summary == o.summary &&
          source == o.source &&
          author == o.author &&
          entities == o.entities &&
          keywords == o.keywords &&
          hashtags == o.hashtags &&
          characters_count == o.characters_count &&
          words_count == o.words_count &&
          sentences_count == o.sentences_count &&
          paragraphs_count == o.paragraphs_count &&
          categories == o.categories &&
          social_shares_count == o.social_shares_count &&
          media == o.media &&
          sentiment == o.sentiment &&
          language == o.language &&
          published_at == o.published_at &&
          links == o.links
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [id, title, body, summary, source, author, entities, keywords, hashtags, characters_count, words_count, sentences_count, paragraphs_count, categories, social_shares_count, media, sentiment, language, published_at, links].hash
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def build_from_hash(attributes)
      return nil unless attributes.is_a?(Hash)
      self.class.api_types.each_pair do |key, type|
        if type =~ /\AArray<(.*)>/i
          # check to ensure the input is an array given that the the attribute
          # is documented as an array but the input is not
          if attributes[self.class.attribute_map[key]].is_a?(Array)
            self.send("#{key}=", attributes[self.class.attribute_map[key]].map{ |v| _deserialize($1, v) } )
          end
        elsif !attributes[self.class.attribute_map[key]].nil?
          self.send("#{key}=", _deserialize(type, attributes[self.class.attribute_map[key]]))
        end # or else data not found in attributes(hash), not an issue as the data can be optional
      end

      self
    end

    # Deserializes the data based on type
    # @param string type Data type
    # @param string value Value to be deserialized
    # @return [Object] Deserialized data
    def _deserialize(type, value)
      case type.to_sym
      when :DateTime
        DateTime.parse(value)
      when :Date
        Date.parse(value)
      when :String
        value.to_s
      when :Integer
        value.to_i
      when :Float
        value.to_f
      when :BOOLEAN
        if value.to_s =~ /\A(true|t|yes|y|1)\z/i
          true
        else
          false
        end
      when :Object
        # generic object (usually a Hash), return directly
        value
      when /\AArray<(?<inner_type>.+)>\z/
        inner_type = Regexp.last_match[:inner_type]
        value.map { |v| _deserialize(inner_type, v) }
      when /\AHash<(?<k_type>.+?), (?<v_type>.+)>\z/
        k_type = Regexp.last_match[:k_type]
        v_type = Regexp.last_match[:v_type]
        {}.tap do |hash|
          value.each do |k, v|
            hash[_deserialize(k_type, k)] = _deserialize(v_type, v)
          end
        end
      else # model
        temp_model = AylienNewsApi.const_get(type).new
        temp_model.build_from_hash(value)
      end
    end

    # Returns the string representation of the object
    # @return [String] String presentation of the object
    def to_s
      to_hash.to_s
    end

    # to_body is an alias to to_hash (backward compatibility)
    # @return [Hash] Returns the object in the form of hash
    def to_body
      to_hash
    end

    # Returns the object in the form of hash
    # @return [Hash] Returns the object in the form of hash
    def to_hash
      hash = {}
      self.class.attribute_map.each_pair do |attr, param|
        value = self.send(attr)
        next if value.nil?
        hash[param] = _to_hash(value)
      end
      hash
    end

    # Outputs non-array value in the form of hash
    # For object, use to_hash. Otherwise, just return the value
    # @param [Object] value Any valid value
    # @return [Hash] Returns the value in the form of hash
    def _to_hash(value)
      if value.is_a?(Array)
        value.compact.map{ |v| _to_hash(v) }
      elsif value.is_a?(Hash)
        {}.tap do |hash|
          value.each { |k, v| hash[k] = _to_hash(v) }
        end
      elsif value.respond_to? :to_hash
        value.to_hash
      else
        value
      end
    end

  end

end
