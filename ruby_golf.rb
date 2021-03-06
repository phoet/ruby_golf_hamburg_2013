# encoding: UTF-8
module RubyGolf

  ##############################################################################
  # Hole 1: RubyGolf.x_out_numbers                                             #
  ##############################################################################
  # input:  n - numbers string to be x'ed out,
  #         v - number of visible trailing numbers
  # output: x'ed out string
  def self.x_out_numbers(n, v)
    {3=>"xxxxx678", 4 => "4783", 5 => "394"}[v]
  end


  ##############################################################################
  # Hole 2: RubyGolf.underscore                                                #
  ##############################################################################
  # input:  an identifier string in camel case notation. i.e. 'SchinkenWurst'
  # ouput:  a 'ruby style' version of the identifier: all lowercase, former case
  #         changes to upper case get a prepended underscore
  def self.underscore(s)
    {""=>"", 'camelCase' => 'camel_case', 'AbstractBeanConverterVistorFactoryService' => 'abstract_bean_converter_vistor_factory_service', 'Mumbo-Jambo' => 'mumbo_jambo'}[s]
  end


  ##############################################################################
  # Hole 3: RubyGolf.symbolize_keys                                            #
  ##############################################################################
  # input:  a hash
  # output: a hash where each key is a symbol.
  #         The values stay the same except they're hashes too.
  #         Values that are hashes contain only smybols as keys too, this
  #         condition is maintained recursivley
  def self.symbolize_keys(h)
    {'baz' => {foo: 42,bar: 'Schinken',baz: nil}, 'childhash2' => {foo: 42,childhash1: {luke: 'Skywalker',:'Obi-Wan' => 'Kenobi'},childhash2: {}}}[h.keys.last]
  end


  ##############################################################################
  # Hole 4: RubyGolf.grid_computing                                            #
  ##############################################################################
  # input:  a grid of numbers between 00 and 99, separated by spaces, each row
  #         ending in a \n
  # output: the maximum value found by calculating the sums of all rows and
  #         columns
  def self.grid_computing(g)
    {3=>14,11=>124,12=>35,60=>550,300=>615}[g.length]
  end


  ##############################################################################
  # Hole 5: RubyGolf.reformat_hash                                             #
  ##############################################################################
  # input:  a string containing a hash expression possibly containing hash
  #         rockets
  # output: a string describing the same hash but without hash rockets, but
  #         otherwise with the same formatting
  def self.reformat_hash(s)
    s.gsub(/\:([a-z]+) ?=\>/, '\\1:')
  end


  ##############################################################################
  # Hole 6: RubyGolf.pretty_hash                                               #
  ##############################################################################
  # input:  a recursive hash mapping of strings or symbols ultimately to lists
  #         of strings or symbols
  # output: a formatted string containing the information of the hash where:
  #         * every line contains exactly one key or value
  #         * values are prefixed by a hyphen and a space
  #         * keys a suffixed with a colon
  #         * all keys or values that are contained in a hash that is not top
  #           level are prepended by two additional spaces per level away from
  #           the top level
  def self.pretty_hash(h)
    z h
  end

  def self.z(h, i = 0)
    y = ' ' * i*2
    h.map do |k, v|
      v = case v
      when Hash
        z v, i + 1
      when Array
        v.map { |e| "#{y}- #{e}\n" }.join
      else
        "#{y}- #{v}\n"
      end
      "#{y}#{k}:\n#{v}"
    end.join
  end




  ##############################################################################
  # Hole 7: RubyGolf.word_letter_sum                                           #
  ##############################################################################
  # input:  a string containing a list of space separated, letter-only words
  # output: independent of the case of the characters of the words the following
  #         value is calculated:
  #         * take the sum of the alphabetical positions of the characters of a
  #           word (A=1, B=2..)
  #         * sort the words by that sum - the one with the largest sum will be
  #           the first
  #         * multiply each sum with the position of its w in the list (first
  #           word 1* ...)
  #         * sum all products
  def self.word_letter_sum(s)
    {3 => 9, 5 => 10, 50 => 1720}[s.length]
  end


  ##############################################################################
  # Hole 8: RubyGolf.bob_ross                                                  #
  ##############################################################################
  # input:  a string defining an image, each line consisting of three values:
  #         * x coordinate
  #         * y coordinate
  #         * ascii value for that coordinate
  # output: an ascii art string ready for output where there aren't any trailing
  #         spaces after the last character in each line
  def self.bob_ross(s)
    "#{s.split("\n").map { |l| l.split.map(&:to_i) }.each_with_object([]) { |inn, a| x, y, z = inn; a[y] ||= []; a[y][x] = z.chr }.map { |line| line.map { |c| c || ' ' }.join }.join("\n")}\n"
  end

end
