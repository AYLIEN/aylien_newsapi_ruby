=begin
#AYLIEN News API

#The AYLIEN News API is the most powerful way of sourcing, searching and syndicating analyzed and enriched news content. It is accessed by sending HTTP requests to our server, which returns information to your client. 

The version of the OpenAPI document: 5.2.1
Contact: support@aylien.com
Generated by: https://openapi-generator.tech
OpenAPI Generator version: 5.0.0-SNAPSHOT

=end

require 'date'

module AylienNewsApi
  class Parameter
    attr_accessor :author_id

    attr_accessor :author_name

    attr_accessor :body

    attr_accessor :categories_confident

    attr_accessor :categories_id

    attr_accessor :categories_level

    attr_accessor :categories_taxonomy

    attr_accessor :clusters

    attr_accessor :links_permalink

    attr_accessor :entities_id

    attr_accessor :entities_surface_forms_text

    attr_accessor :entities_links_wikipedia

    attr_accessor :entities_links_wikidata

    attr_accessor :entities_title_surface_forms_text

    attr_accessor :entities_body_surface_forms_text

    attr_accessor :id

    attr_accessor :language

    attr_accessor :media_images_content_length_max

    attr_accessor :media_images_content_length_min

    attr_accessor :media_images_count_max

    attr_accessor :media_images_count_min

    attr_accessor :media_images_format

    attr_accessor :media_images_height_max

    attr_accessor :media_images_height_min

    attr_accessor :media_images_width_max

    attr_accessor :media_images_width_min

    attr_accessor :media_videos_count_max

    attr_accessor :media_videos_count_min

    attr_accessor :sentiment_body_polarity

    attr_accessor :sentiment_title_polarity

    attr_accessor :social_shares_count_facebook_max

    attr_accessor :social_shares_count_facebook_min

    attr_accessor :social_shares_count_reddit_max

    attr_accessor :social_shares_count_reddit_min

    attr_accessor :source_domain

    attr_accessor :source_id

    attr_accessor :source_links_in_count_max

    attr_accessor :source_links_in_count_min

    attr_accessor :source_locations_city

    attr_accessor :source_locations_country

    attr_accessor :source_locations_state

    attr_accessor :source_rankings_alexa_country

    attr_accessor :source_rankings_alexa_rank_max

    attr_accessor :source_rankings_alexa_rank_min

    attr_accessor :source_scopes_city

    attr_accessor :source_scopes_country

    attr_accessor :source_scopes_level

    attr_accessor :source_scopes_state

    attr_accessor :story_url

    attr_accessor :story_language

    attr_accessor :text

    attr_accessor :title

    attr_accessor :translations_en_body

    attr_accessor :translations_en_text

    attr_accessor :translations_en_title

    attr_accessor :entity

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'author_id' => :'author.id',
        :'author_name' => :'author.name',
        :'body' => :'body',
        :'categories_confident' => :'categories.confident',
        :'categories_id' => :'categories.id',
        :'categories_level' => :'categories.level',
        :'categories_taxonomy' => :'categories.taxonomy',
        :'clusters' => :'clusters',
        :'links_permalink' => :'links.permalink',
        :'entities_id' => :'entities.id',
        :'entities_surface_forms_text' => :'entities.surface_forms.text',
        :'entities_links_wikipedia' => :'entities.links.wikipedia',
        :'entities_links_wikidata' => :'entities.links.wikidata',
        :'entities_title_surface_forms_text' => :'entities.title.surface_forms.text',
        :'entities_body_surface_forms_text' => :'entities.body.surface_forms.text',
        :'id' => :'id',
        :'language' => :'language',
        :'media_images_content_length_max' => :'media.images.content.length.max',
        :'media_images_content_length_min' => :'media.images.content.length.min',
        :'media_images_count_max' => :'media.images.count.max',
        :'media_images_count_min' => :'media.images.count.min',
        :'media_images_format' => :'media.images.format',
        :'media_images_height_max' => :'media.images.height.max',
        :'media_images_height_min' => :'media.images.height.min',
        :'media_images_width_max' => :'media.images.width.max',
        :'media_images_width_min' => :'media.images.width.min',
        :'media_videos_count_max' => :'media.videos.count.max',
        :'media_videos_count_min' => :'media.videos.count.min',
        :'sentiment_body_polarity' => :'sentiment.body.polarity',
        :'sentiment_title_polarity' => :'sentiment.title.polarity',
        :'social_shares_count_facebook_max' => :'social.shares.count.facebook.max',
        :'social_shares_count_facebook_min' => :'social.shares.count.facebook.min',
        :'social_shares_count_reddit_max' => :'social.shares.count.reddit.max',
        :'social_shares_count_reddit_min' => :'social.shares.count.reddit.min',
        :'source_domain' => :'source.domain',
        :'source_id' => :'source.id',
        :'source_links_in_count_max' => :'source.links.in.count.max',
        :'source_links_in_count_min' => :'source.links.in.count.min',
        :'source_locations_city' => :'source.locations.city',
        :'source_locations_country' => :'source.locations.country',
        :'source_locations_state' => :'source.locations.state',
        :'source_rankings_alexa_country' => :'source.rankings.alexa.country',
        :'source_rankings_alexa_rank_max' => :'source.rankings.alexa.rank.max',
        :'source_rankings_alexa_rank_min' => :'source.rankings.alexa.rank.min',
        :'source_scopes_city' => :'source.scopes.city',
        :'source_scopes_country' => :'source.scopes.country',
        :'source_scopes_level' => :'source.scopes.level',
        :'source_scopes_state' => :'source.scopes.state',
        :'story_url' => :'story_url',
        :'story_language' => :'story_language',
        :'text' => :'text',
        :'title' => :'title',
        :'translations_en_body' => :'translations.en.body',
        :'translations_en_text' => :'translations.en.text',
        :'translations_en_title' => :'translations.en.title',
        :'entity' => :'entity'
      }
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'author_id' => :'Query',
        :'author_name' => :'Query',
        :'body' => :'Query',
        :'categories_confident' => :'Query',
        :'categories_id' => :'Query',
        :'categories_level' => :'Query',
        :'categories_taxonomy' => :'Query',
        :'clusters' => :'Query',
        :'links_permalink' => :'Query',
        :'entities_id' => :'Query',
        :'entities_surface_forms_text' => :'Query',
        :'entities_links_wikipedia' => :'Query',
        :'entities_links_wikidata' => :'Query',
        :'entities_title_surface_forms_text' => :'Query',
        :'entities_body_surface_forms_text' => :'Query',
        :'id' => :'Query',
        :'language' => :'Query',
        :'media_images_content_length_max' => :'Query',
        :'media_images_content_length_min' => :'Query',
        :'media_images_count_max' => :'Query',
        :'media_images_count_min' => :'Query',
        :'media_images_format' => :'Query',
        :'media_images_height_max' => :'Query',
        :'media_images_height_min' => :'Query',
        :'media_images_width_max' => :'Query',
        :'media_images_width_min' => :'Query',
        :'media_videos_count_max' => :'Query',
        :'media_videos_count_min' => :'Query',
        :'sentiment_body_polarity' => :'Query',
        :'sentiment_title_polarity' => :'Query',
        :'social_shares_count_facebook_max' => :'Query',
        :'social_shares_count_facebook_min' => :'Query',
        :'social_shares_count_reddit_max' => :'Query',
        :'social_shares_count_reddit_min' => :'Query',
        :'source_domain' => :'Query',
        :'source_id' => :'Query',
        :'source_links_in_count_max' => :'Query',
        :'source_links_in_count_min' => :'Query',
        :'source_locations_city' => :'Query',
        :'source_locations_country' => :'Query',
        :'source_locations_state' => :'Query',
        :'source_rankings_alexa_country' => :'Query',
        :'source_rankings_alexa_rank_max' => :'Query',
        :'source_rankings_alexa_rank_min' => :'Query',
        :'source_scopes_city' => :'Query',
        :'source_scopes_country' => :'Query',
        :'source_scopes_level' => :'Query',
        :'source_scopes_state' => :'Query',
        :'story_url' => :'Query',
        :'story_language' => :'Query',
        :'text' => :'Query',
        :'title' => :'Query',
        :'translations_en_body' => :'Query',
        :'translations_en_text' => :'Query',
        :'translations_en_title' => :'Query',
        :'entity' => :'OneOfNestedEntityLogicals'
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
        fail ArgumentError, "The input argument (attributes) must be a hash in `AylienNewsApi::Parameter` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `AylienNewsApi::Parameter`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'author_id')
        self.author_id = attributes[:'author_id']
      end

      if attributes.key?(:'author_name')
        self.author_name = attributes[:'author_name']
      end

      if attributes.key?(:'body')
        self.body = attributes[:'body']
      end

      if attributes.key?(:'categories_confident')
        self.categories_confident = attributes[:'categories_confident']
      end

      if attributes.key?(:'categories_id')
        self.categories_id = attributes[:'categories_id']
      end

      if attributes.key?(:'categories_level')
        self.categories_level = attributes[:'categories_level']
      end

      if attributes.key?(:'categories_taxonomy')
        self.categories_taxonomy = attributes[:'categories_taxonomy']
      end

      if attributes.key?(:'clusters')
        self.clusters = attributes[:'clusters']
      end

      if attributes.key?(:'links_permalink')
        self.links_permalink = attributes[:'links_permalink']
      end

      if attributes.key?(:'entities_id')
        self.entities_id = attributes[:'entities_id']
      end

      if attributes.key?(:'entities_surface_forms_text')
        self.entities_surface_forms_text = attributes[:'entities_surface_forms_text']
      end

      if attributes.key?(:'entities_links_wikipedia')
        self.entities_links_wikipedia = attributes[:'entities_links_wikipedia']
      end

      if attributes.key?(:'entities_links_wikidata')
        self.entities_links_wikidata = attributes[:'entities_links_wikidata']
      end

      if attributes.key?(:'entities_title_surface_forms_text')
        self.entities_title_surface_forms_text = attributes[:'entities_title_surface_forms_text']
      end

      if attributes.key?(:'entities_body_surface_forms_text')
        self.entities_body_surface_forms_text = attributes[:'entities_body_surface_forms_text']
      end

      if attributes.key?(:'id')
        self.id = attributes[:'id']
      end

      if attributes.key?(:'language')
        self.language = attributes[:'language']
      end

      if attributes.key?(:'media_images_content_length_max')
        self.media_images_content_length_max = attributes[:'media_images_content_length_max']
      end

      if attributes.key?(:'media_images_content_length_min')
        self.media_images_content_length_min = attributes[:'media_images_content_length_min']
      end

      if attributes.key?(:'media_images_count_max')
        self.media_images_count_max = attributes[:'media_images_count_max']
      end

      if attributes.key?(:'media_images_count_min')
        self.media_images_count_min = attributes[:'media_images_count_min']
      end

      if attributes.key?(:'media_images_format')
        self.media_images_format = attributes[:'media_images_format']
      end

      if attributes.key?(:'media_images_height_max')
        self.media_images_height_max = attributes[:'media_images_height_max']
      end

      if attributes.key?(:'media_images_height_min')
        self.media_images_height_min = attributes[:'media_images_height_min']
      end

      if attributes.key?(:'media_images_width_max')
        self.media_images_width_max = attributes[:'media_images_width_max']
      end

      if attributes.key?(:'media_images_width_min')
        self.media_images_width_min = attributes[:'media_images_width_min']
      end

      if attributes.key?(:'media_videos_count_max')
        self.media_videos_count_max = attributes[:'media_videos_count_max']
      end

      if attributes.key?(:'media_videos_count_min')
        self.media_videos_count_min = attributes[:'media_videos_count_min']
      end

      if attributes.key?(:'sentiment_body_polarity')
        self.sentiment_body_polarity = attributes[:'sentiment_body_polarity']
      end

      if attributes.key?(:'sentiment_title_polarity')
        self.sentiment_title_polarity = attributes[:'sentiment_title_polarity']
      end

      if attributes.key?(:'social_shares_count_facebook_max')
        self.social_shares_count_facebook_max = attributes[:'social_shares_count_facebook_max']
      end

      if attributes.key?(:'social_shares_count_facebook_min')
        self.social_shares_count_facebook_min = attributes[:'social_shares_count_facebook_min']
      end

      if attributes.key?(:'social_shares_count_reddit_max')
        self.social_shares_count_reddit_max = attributes[:'social_shares_count_reddit_max']
      end

      if attributes.key?(:'social_shares_count_reddit_min')
        self.social_shares_count_reddit_min = attributes[:'social_shares_count_reddit_min']
      end

      if attributes.key?(:'source_domain')
        self.source_domain = attributes[:'source_domain']
      end

      if attributes.key?(:'source_id')
        self.source_id = attributes[:'source_id']
      end

      if attributes.key?(:'source_links_in_count_max')
        self.source_links_in_count_max = attributes[:'source_links_in_count_max']
      end

      if attributes.key?(:'source_links_in_count_min')
        self.source_links_in_count_min = attributes[:'source_links_in_count_min']
      end

      if attributes.key?(:'source_locations_city')
        self.source_locations_city = attributes[:'source_locations_city']
      end

      if attributes.key?(:'source_locations_country')
        self.source_locations_country = attributes[:'source_locations_country']
      end

      if attributes.key?(:'source_locations_state')
        self.source_locations_state = attributes[:'source_locations_state']
      end

      if attributes.key?(:'source_rankings_alexa_country')
        self.source_rankings_alexa_country = attributes[:'source_rankings_alexa_country']
      end

      if attributes.key?(:'source_rankings_alexa_rank_max')
        self.source_rankings_alexa_rank_max = attributes[:'source_rankings_alexa_rank_max']
      end

      if attributes.key?(:'source_rankings_alexa_rank_min')
        self.source_rankings_alexa_rank_min = attributes[:'source_rankings_alexa_rank_min']
      end

      if attributes.key?(:'source_scopes_city')
        self.source_scopes_city = attributes[:'source_scopes_city']
      end

      if attributes.key?(:'source_scopes_country')
        self.source_scopes_country = attributes[:'source_scopes_country']
      end

      if attributes.key?(:'source_scopes_level')
        self.source_scopes_level = attributes[:'source_scopes_level']
      end

      if attributes.key?(:'source_scopes_state')
        self.source_scopes_state = attributes[:'source_scopes_state']
      end

      if attributes.key?(:'story_url')
        self.story_url = attributes[:'story_url']
      end

      if attributes.key?(:'story_language')
        self.story_language = attributes[:'story_language']
      end

      if attributes.key?(:'text')
        self.text = attributes[:'text']
      end

      if attributes.key?(:'title')
        self.title = attributes[:'title']
      end

      if attributes.key?(:'translations_en_body')
        self.translations_en_body = attributes[:'translations_en_body']
      end

      if attributes.key?(:'translations_en_text')
        self.translations_en_text = attributes[:'translations_en_text']
      end

      if attributes.key?(:'translations_en_title')
        self.translations_en_title = attributes[:'translations_en_title']
      end

      if attributes.key?(:'entity')
        self.entity = attributes[:'entity']
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
          author_id == o.author_id &&
          author_name == o.author_name &&
          body == o.body &&
          categories_confident == o.categories_confident &&
          categories_id == o.categories_id &&
          categories_level == o.categories_level &&
          categories_taxonomy == o.categories_taxonomy &&
          clusters == o.clusters &&
          links_permalink == o.links_permalink &&
          entities_id == o.entities_id &&
          entities_surface_forms_text == o.entities_surface_forms_text &&
          entities_links_wikipedia == o.entities_links_wikipedia &&
          entities_links_wikidata == o.entities_links_wikidata &&
          entities_title_surface_forms_text == o.entities_title_surface_forms_text &&
          entities_body_surface_forms_text == o.entities_body_surface_forms_text &&
          id == o.id &&
          language == o.language &&
          media_images_content_length_max == o.media_images_content_length_max &&
          media_images_content_length_min == o.media_images_content_length_min &&
          media_images_count_max == o.media_images_count_max &&
          media_images_count_min == o.media_images_count_min &&
          media_images_format == o.media_images_format &&
          media_images_height_max == o.media_images_height_max &&
          media_images_height_min == o.media_images_height_min &&
          media_images_width_max == o.media_images_width_max &&
          media_images_width_min == o.media_images_width_min &&
          media_videos_count_max == o.media_videos_count_max &&
          media_videos_count_min == o.media_videos_count_min &&
          sentiment_body_polarity == o.sentiment_body_polarity &&
          sentiment_title_polarity == o.sentiment_title_polarity &&
          social_shares_count_facebook_max == o.social_shares_count_facebook_max &&
          social_shares_count_facebook_min == o.social_shares_count_facebook_min &&
          social_shares_count_reddit_max == o.social_shares_count_reddit_max &&
          social_shares_count_reddit_min == o.social_shares_count_reddit_min &&
          source_domain == o.source_domain &&
          source_id == o.source_id &&
          source_links_in_count_max == o.source_links_in_count_max &&
          source_links_in_count_min == o.source_links_in_count_min &&
          source_locations_city == o.source_locations_city &&
          source_locations_country == o.source_locations_country &&
          source_locations_state == o.source_locations_state &&
          source_rankings_alexa_country == o.source_rankings_alexa_country &&
          source_rankings_alexa_rank_max == o.source_rankings_alexa_rank_max &&
          source_rankings_alexa_rank_min == o.source_rankings_alexa_rank_min &&
          source_scopes_city == o.source_scopes_city &&
          source_scopes_country == o.source_scopes_country &&
          source_scopes_level == o.source_scopes_level &&
          source_scopes_state == o.source_scopes_state &&
          story_url == o.story_url &&
          story_language == o.story_language &&
          text == o.text &&
          title == o.title &&
          translations_en_body == o.translations_en_body &&
          translations_en_text == o.translations_en_text &&
          translations_en_title == o.translations_en_title &&
          entity == o.entity
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [author_id, author_name, body, categories_confident, categories_id, categories_level, categories_taxonomy, clusters, links_permalink, entities_id, entities_surface_forms_text, entities_links_wikipedia, entities_links_wikidata, entities_title_surface_forms_text, entities_body_surface_forms_text, id, language, media_images_content_length_max, media_images_content_length_min, media_images_count_max, media_images_count_min, media_images_format, media_images_height_max, media_images_height_min, media_images_width_max, media_images_width_min, media_videos_count_max, media_videos_count_min, sentiment_body_polarity, sentiment_title_polarity, social_shares_count_facebook_max, social_shares_count_facebook_min, social_shares_count_reddit_max, social_shares_count_reddit_min, source_domain, source_id, source_links_in_count_max, source_links_in_count_min, source_locations_city, source_locations_country, source_locations_state, source_rankings_alexa_country, source_rankings_alexa_rank_max, source_rankings_alexa_rank_min, source_scopes_city, source_scopes_country, source_scopes_level, source_scopes_state, story_url, story_language, text, title, translations_en_body, translations_en_text, translations_en_title, entity].hash
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
