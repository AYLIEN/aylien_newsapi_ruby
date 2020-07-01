=begin
#AYLIEN News API

#The AYLIEN News API is the most powerful way of sourcing, searching and syndicating analyzed and enriched news content. It is accessed by sending HTTP requests to our server, which returns information to your client. 

The version of the OpenAPI document: 3.0
Contact: support@aylien.com
Generated by: https://openapi-generator.tech
OpenAPI Generator version: 5.0.0-SNAPSHOT

=end

require 'date'

module AylienNewsApi
  class Story
    attr_accessor :author

    # Body of the story
    attr_accessor :body

    # Suggested categories for the story
    attr_accessor :categories

    # Character count of the story body
    attr_accessor :characters_count

    # An array of clusters the story is associated with
    attr_accessor :clusters

    attr_accessor :entities

    # An array of suggested Story hashtags
    attr_accessor :hashtags

    # ID of the story which is a unique identification
    attr_accessor :id

    # Extracted keywords mentioned in the story title or body
    attr_accessor :keywords

    # Language of the story
    attr_accessor :language

    attr_accessor :links

    # An array of extracted media such as images and videos
    attr_accessor :media

    # Paragraph count of the story body
    attr_accessor :paragraphs_count

    # Published date of the story
    attr_accessor :published_at

    # Sentence count of the story body
    attr_accessor :sentences_count

    attr_accessor :sentiment

    attr_accessor :social_shares_count

    attr_accessor :source

    attr_accessor :summary

    # Title of the story
    attr_accessor :title

    attr_accessor :translations

    # Word count of the story body
    attr_accessor :words_count

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'author' => :'author',
        :'body' => :'body',
        :'categories' => :'categories',
        :'characters_count' => :'characters_count',
        :'clusters' => :'clusters',
        :'entities' => :'entities',
        :'hashtags' => :'hashtags',
        :'id' => :'id',
        :'keywords' => :'keywords',
        :'language' => :'language',
        :'links' => :'links',
        :'media' => :'media',
        :'paragraphs_count' => :'paragraphs_count',
        :'published_at' => :'published_at',
        :'sentences_count' => :'sentences_count',
        :'sentiment' => :'sentiment',
        :'social_shares_count' => :'social_shares_count',
        :'source' => :'source',
        :'summary' => :'summary',
        :'title' => :'title',
        :'translations' => :'translations',
        :'words_count' => :'words_count'
      }
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'author' => :'Author',
        :'body' => :'String',
        :'categories' => :'Array<Category>',
        :'characters_count' => :'Integer',
        :'clusters' => :'Array<Integer>',
        :'entities' => :'Entities',
        :'hashtags' => :'Array<String>',
        :'id' => :'Integer',
        :'keywords' => :'Array<String>',
        :'language' => :'String',
        :'links' => :'StoryLinks',
        :'media' => :'Array<Media>',
        :'paragraphs_count' => :'Integer',
        :'published_at' => :'DateTime',
        :'sentences_count' => :'Integer',
        :'sentiment' => :'Sentiments',
        :'social_shares_count' => :'ShareCounts',
        :'source' => :'Source',
        :'summary' => :'Summary',
        :'title' => :'String',
        :'translations' => :'StoryTranslations',
        :'words_count' => :'Integer'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
      ])
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `AylienNewsApi::Story` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `AylienNewsApi::Story`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'author')
        self.author = attributes[:'author']
      end

      if attributes.key?(:'body')
        self.body = attributes[:'body']
      end

      if attributes.key?(:'categories')
        if (value = attributes[:'categories']).is_a?(Array)
          self.categories = value
        end
      end

      if attributes.key?(:'characters_count')
        self.characters_count = attributes[:'characters_count']
      end

      if attributes.key?(:'clusters')
        if (value = attributes[:'clusters']).is_a?(Array)
          self.clusters = value
        end
      end

      if attributes.key?(:'entities')
        self.entities = attributes[:'entities']
      end

      if attributes.key?(:'hashtags')
        if (value = attributes[:'hashtags']).is_a?(Array)
          self.hashtags = value
        end
      end

      if attributes.key?(:'id')
        self.id = attributes[:'id']
      end

      if attributes.key?(:'keywords')
        if (value = attributes[:'keywords']).is_a?(Array)
          self.keywords = value
        end
      end

      if attributes.key?(:'language')
        self.language = attributes[:'language']
      end

      if attributes.key?(:'links')
        self.links = attributes[:'links']
      end

      if attributes.key?(:'media')
        if (value = attributes[:'media']).is_a?(Array)
          self.media = value
        end
      end

      if attributes.key?(:'paragraphs_count')
        self.paragraphs_count = attributes[:'paragraphs_count']
      end

      if attributes.key?(:'published_at')
        self.published_at = attributes[:'published_at']
      end

      if attributes.key?(:'sentences_count')
        self.sentences_count = attributes[:'sentences_count']
      end

      if attributes.key?(:'sentiment')
        self.sentiment = attributes[:'sentiment']
      end

      if attributes.key?(:'social_shares_count')
        self.social_shares_count = attributes[:'social_shares_count']
      end

      if attributes.key?(:'source')
        self.source = attributes[:'source']
      end

      if attributes.key?(:'summary')
        self.summary = attributes[:'summary']
      end

      if attributes.key?(:'title')
        self.title = attributes[:'title']
      end

      if attributes.key?(:'translations')
        self.translations = attributes[:'translations']
      end

      if attributes.key?(:'words_count')
        self.words_count = attributes[:'words_count']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      true
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          author == o.author &&
          body == o.body &&
          categories == o.categories &&
          characters_count == o.characters_count &&
          clusters == o.clusters &&
          entities == o.entities &&
          hashtags == o.hashtags &&
          id == o.id &&
          keywords == o.keywords &&
          language == o.language &&
          links == o.links &&
          media == o.media &&
          paragraphs_count == o.paragraphs_count &&
          published_at == o.published_at &&
          sentences_count == o.sentences_count &&
          sentiment == o.sentiment &&
          social_shares_count == o.social_shares_count &&
          source == o.source &&
          summary == o.summary &&
          title == o.title &&
          translations == o.translations &&
          words_count == o.words_count
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [author, body, categories, characters_count, clusters, entities, hashtags, id, keywords, language, links, media, paragraphs_count, published_at, sentences_count, sentiment, social_shares_count, source, summary, title, translations, words_count].hash
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def self.build_from_hash(attributes)
      new.build_from_hash(attributes)
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def build_from_hash(attributes)
      return nil unless attributes.is_a?(Hash)
      self.class.openapi_types.each_pair do |key, type|
        if type =~ /\AArray<(.*)>/i
          # check to ensure the input is an array given that the attribute
          # is documented as an array but the input is not
          if attributes[self.class.attribute_map[key]].is_a?(Array)
            self.send("#{key}=", attributes[self.class.attribute_map[key]].map { |v| _deserialize($1, v) })
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
      when :Boolean
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
        AylienNewsApi.const_get(type).build_from_hash(value)
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
        if value.nil?
          is_nullable = self.class.openapi_nullable.include?(attr)
          next if !is_nullable || (is_nullable && !instance_variable_defined?(:"@#{attr}"))
        end
        
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
        value.compact.map { |v| _to_hash(v) }
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
