#--
# DO NOT MODIFY!!!!
# This file is automatically generated by rex 1.0.5
# from lexical definition file "lexer.rex".
#++

require 'racc/parser'
module RDL::Type
class Parser < Racc::Parser
  require 'strscan'

  class ScanError < StandardError ; end

  attr_reader   :lineno
  attr_reader   :filename
  attr_accessor :state

  def scan_setup(str)
    @ss = StringScanner.new(str)
    @lineno =  1
    @state  = nil
  end

  def action
    yield
  end

  def scan_str(str)
    scan_setup(str)
    do_parse
  end
  alias :scan :scan_str

  def load_file( filename )
    @filename = filename
    open(filename, "r") do |f|
      scan_setup(f.read)
    end
  end

  def scan_file( filename )
    load_file(filename)
    do_parse
  end


  def next_token
    return if @ss.eos?
    
    # skips empty actions
    until token = _next_token or @ss.eos?; end
    token
  end

  def _next_token
    text = @ss.peek(1)
    @lineno  +=  1  if text == "\n"
    token = case @state
    when nil
      case
      when (text = @ss.scan(/\s/))
        ;

      when (text = @ss.scan(/or/))
         action { [:OR, text] }

      when (text = @ss.scan(/->/))
         action { [:RARROW, text] }

      when (text = @ss.scan(/=>/))
         action { [:RASSOC, text] }

      when (text = @ss.scan(/\(/))
         action { [:LPAREN, text] }

      when (text = @ss.scan(/\)/))
         action { [:RPAREN, text] }

      when (text = @ss.scan(/\{\{(?:(?!}}).)+\}\}/))
         action { [:PREDICATE, text] }

      when (text = @ss.scan(/\{/))
         action { [:LBRACE, text] }

      when (text = @ss.scan(/\}/))
         action { [:RBRACE, text] }

      when (text = @ss.scan(/\[/))
         action { [:LBRACKET, text] }

      when (text = @ss.scan(/\]/))
         action { [:RBRACKET, text] }

      when (text = @ss.scan(/</))
         action { [:LESS, text] }

      when (text = @ss.scan(/>/))
         action { [:GREATER, text] }

      when (text = @ss.scan(/,/))
         action { [:COMMA, text] }

      when (text = @ss.scan(/\?/))
         action { [:QUERY, text] }

      when (text = @ss.scan(/\*/))
         action { [:STAR, text] }

      when (text = @ss.scan(/\#T/))
         action { [:HASH_TYPE, text] }

      when (text = @ss.scan(/\#Q/))
         action { [:HASH_QUERY, text] }

      when (text = @ss.scan(/\$\{/))
         action { [:CONST_BEGIN, text] }

      when (text = @ss.scan(/\.\.\./))
         action { [:DOTS, text] }

      when (text = @ss.scan(/\./))
         action { [:DOT, text] }

      when (text = @ss.scan(/-?\d\.\d+/))
         action { [:FLOAT, text] } # Must go before FIXNUM

      when (text = @ss.scan(/-?(\d)+/))
         action { [:FIXNUM, text] }

      when (text = @ss.scan(/(\w|\:\:)+/))
         action { [:ID, text] }

      when (text = @ss.scan(/:\w+/))
         action { [:SYMBOL, text[1..-1]] }

      when (text = @ss.scan(/\:/))
         action { [:COLON, text] } # Must come after SYMBOL

      when (text = @ss.scan(/%\w+/))
         action { [:SPECIAL_ID, text] }

      when (text = @ss.scan(/'[^']*'/))
         action { [:STRING, text.gsub("'", "")] }

      when (text = @ss.scan(/"[^"]*"/))
         action { [:STRING, text.gsub('"', "")] }

      else
        text = @ss.string[@ss.pos .. -1]
        raise  ScanError, "can not match: '" + text + "'"
      end  # if

    else
      raise  ScanError, "undefined state: '" + state.to_s + "'"
    end  # case state
    token
  end  # def _next_token

  nest = 0
end # class
end
