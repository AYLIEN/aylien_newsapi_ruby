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
  class DeprecatedEntity
    # The unique ID of the entity
    attr_accessor :id

    # The indices of the entity text
    attr_accessor :indices

    attr_accessor :links

    # The entity text
    attr_accessor :text

    # The stock_ticker of the entity (might be null)
    attr_accessor :stock_ticker

    # An array of the entity types
    attr_accessor :types

    attr_accessor :sentiment

    attr_accessor :surface_forms

    # Describes how relevant an entity is to the article
    attr_accessor :prominence_score

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'id' => :'id',
        :'indices' => :'indices',
        :'links' => :'links',
        :'text' => :'text',
        :'stock_ticker' => :'stock_ticker',
        :'types' => :'types',
        :'sentiment' => :'sentiment',
        :'surface_forms' => :'surface_forms',
        :'prominence_score' => :'prominence_score'
      }
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'id' => :'String',
        :'indices' => :'Array<Array<Integer>>',
        :'links' => :'EntityLinks',
        :'text' => :'String',
        :'stock_ticker' => :'String',
        :'types' => :'Array<String>',
        :'sentiment' => :'EntitySentiment',
        :'surface_forms' => :'Array<DeprecatedEntitySurfaceForm>',
        :'prominence_score' => :'Float'
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
        fail ArgumentError, "The input argument (attributes) must be a hash in `AylienNewsApi::DeprecatedEntity` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `AylienNewsApi::DeprecatedEntity`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'id')
        self.id = attributes[:'id']
      end

      if attributes.key?(:'indices')
        if (value = attributes[:'indices']).is_a?(Array)
          self.indices = value
        end
      end

      if attributes.key?(:'links')
        self.links = attributes[:'links']
      end

      if attributes.key?(:'text')
        self.text = attributes[:'text']
      end

      if attributes.key?(:'stock_ticker')
        self.stock_ticker = attributes[:'stock_ticker']
      end

      if attributes.key?(:'types')
        if (value = attributes[:'types']).is_a?(Array)
          self.types = value
        end
      end

      if attributes.key?(:'sentiment')
        self.sentiment = attributes[:'sentiment']
      end

      if attributes.key?(:'surface_forms')
        if (value = attributes[:'surface_forms']).is_a?(Array)
          self.surface_forms = value
        end
      end

      if attributes.key?(:'prominence_score')
        self.prominence_score = attributes[:'prominence_score']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if !@prominence_score.nil? && @prominence_score > 1
        invalid_properties.push('invalid value for "prominence_score", must be smaller than or equal to 1.')
      end

      if !@prominence_score.nil? && @prominence_score < 0
        invalid_properties.push('invalid value for "prominence_score", must be greater than or equal to 0.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if !@prominence_score.nil? && @prominence_score > 1
      return false if !@prominence_score.nil? && @prominence_score < 0
      true
    end

    # Custom attribute writer method with validation
    # @param [Object] prominence_score Value to be assigned
    def prominence_score=(prominence_score)
      if !prominence_score.nil? && prominence_score > 1
        fail ArgumentError, 'invalid value for "prominence_score", must be smaller than or equal to 1.'
      end

      if !prominence_score.nil? && prominence_score < 0
        fail ArgumentError, 'invalid value for "prominence_score", must be greater than or equal to 0.'
      end

      @prominence_score = prominence_score
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          id == o.id &&
          indices == o.indices &&
          links == o.links &&
          text == o.text &&
          stock_ticker == o.stock_ticker &&
          types == o.types &&
          sentiment == o.sentiment &&
          surface_forms == o.surface_forms &&
          prominence_score == o.prominence_score
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [id, indices, links, text, stock_ticker, types, sentiment, surface_forms, prominence_score].hash
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
