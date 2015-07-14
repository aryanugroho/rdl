class IO
  type 'self.binread', '(String name, ?Fixnum length, ?Fixnum offset) -> String'
  type 'self.binwrite', '(String name, String, ?Fixnum offset, %open_args) -> Fixnum'
  type 'self.copy_stream', '(String or IO src, String or IO dst, ?Fixnum copy_length, ?Fixnum src_offset) -> Fixnum'
  rdl_alias 'self.for_fd', 'self.new'
  type 'self.foreach', '(String name, ?String sep, ?Fixnum limit, %open_args) { (String) -> %any } -> nil'
  type 'self.foreach', '(String name, ?String sep, ?Fixnum limit, %open_args) -> Enumerator<String>'
#  type 'self.new', '(Fixnum fd, ?Fixnum mode, ?Fixnum opt) -> IO' # Do not wrap. Leads to mysterious errors.
  type 'self.open', '(Fixnum fd, ?String mode, %open_args) -> IO'
  type 'self.open', '(Fixnum fd, ?String mode, %open_args) { (IO) -> t } -> t'
  type 'self.pipe', '(?String ext_or_ext_int_enc, %open_args) -> [IO, IO]'
  type 'self.pipe', '(?String ext_enc, ?String int_enc, %open_args) -> [IO, IO]'
  type 'self.pipe', '(?String ext_or_ext_int_enc, %open_args) { ([IO, IO]) -> t } -> t'
  type 'self.pipe', '(?String ext_enc, ?String int_enc, %open_args) { ([IO, IO]) -> t } -> t'
  type 'self.popen', '(?Hash<String, String> env, String cmd, ?String mode, %open_args) -> IO'
  type 'self.popen', '(?Hash<String, String> env, String cmd, ?String mode, %open_args) { (IO) -> t } -> t'
  type 'self.read', '(String name, ?Fixnum length, ?Fixnum offset, %open_args) -> String'
  type 'self.readlines', '(String name, ?String sep, ?Fixnum limit, %open_args) -> Array<String>'
  type 'self.select', '(Array<IO> read_array, ?Array<IO> write_array, ?Array<IO> error_array, ?Fixnum timeout) -> Array<IO> or nil'
  type 'self.sysopen', '(String path, ?String mode, ?String perm) -> Fixnum' # TODO unsure of type of perm
  type 'self.try_convert', '([to_io: () -> IO]) -> IO or nil'
  type 'self.write', '(String name, String, ?Fixnum offset, %open_args) -> Fixnum'
  type :<<, '([to_s: () -> String]) -> self'
  type :advise, '(:normal or :sequence or :random or :willneed or :dontneed or :noreuse, ?Fixnum offset, ?Fixnum len) -> nil'
  type :autoclose=, '(%bool) -> %bool'
  type :autoclose?, '() -> %bool'
  type :binmode, '() -> self'
  type :binmode?, '() -> %bool'
  rdl_alias :bytes, :each_byte # deprecated
  rdl_alias :chars, :each_char # deprecated
  type :close, '() -> nil'
  type :close_on_exec=, '(%bool) -> %bool'
  type :close_on_exec?, '() -> %bool'
  type :close_read, '() -> nil'
  type :close_write, '() -> nil'
  type :closed?, '() -> %bool'
  rdl_alias :codepoints, :each_codepoint # deprecated
  type :each, '(?String sep, ?Fixnum limit) { (String) -> %any } -> self'
  type :each, '(?String sep, ?Fixnum limit) -> Enumerator<String>'
  rdl_alias :each_line, :each
  type :each_byte, '() { (Fixnum) -> %any } -> self'
  type :each_byte, '() -> Enumerator<Fixnum>'
  type :each_char, '() { (String) -> %any } -> self'
  type :each_char, '() -> Enumerator<String>'
  type :each_codepoint, '() { (Fixnum) -> %any } -> self'
  type :each_codepoint, '() -> Enumerator<Fixnum>'
  type :eof, '() -> %bool'
  rdl_alias :eof?, :eof
  type :external_enconding, '() -> Enconding'
  type :fcntl, '(Fixnum integer_cmd, String or Fixnum arg) -> Fixnum'
  type :fdatasync, '() -> 0 or nil'
  type :fileno, '() -> Fixnum'
  type :flush, '() -> self'
  type :fsync, '() -> 0 or nil'
  type :getbyte, '() -> Fixnum or nil'
  type :getc, '() -> String or nil'
  type :gets, '(?String sep, ?Fixnum limit) -> String or nil'
  type :inspect, '() -> String'
  type :internal_encoding, '() -> Encoding'
  type :ioctl, '(Fixnum integer_cmd, String or Fixnum arg) -> Fixnum'
  type :isatty, '() -> %bool'
  type :lineno, '() -> Fixnum'
  type :lineno=, '(Fixnum) -> Fixnum'
  rdl_alias :lines, :each_line # deprecated
  type :pid, '() -> Fixnum'
  type :pos, '() -> Fixnum'
  type :pos=, '(Fixnum) -> Fixnum'
  type :print, '(*[to_s: () -> String]) -> nil'
  type :printf, '(String format_string, *%any) -> nil'
  type :putc, '(Numeric or String) -> %any'
  type :puts, '(*[to_s: () -> String]) -> nil'
  type :read, '(?Fixnum length, ?String outbuf) -> String or nil'
  type :read_nonblock, '(Fixnum maxlen) -> String'
  type :read_nonblock, '(Fixnum maxlen, String outbuf) -> String outbuf'
  type :readbyte, '() -> Fixnum'
  type :readchar, '() -> String'
  type :readline, '(?String sep, ?Fixnum limit) -> String'
  type :readlines, '(?String sep, ?Fixnum limit) -> Array<String>'
  type :readpartial, '(Fixnum maxlen) -> String'
  type :readpartial, '(Fixnum maxlen, String outbuf) -> String outbuf'
  type :reopen, '(IO other_IO) -> IO'
  type :reopen, '(String path, String mode_str) -> IO'
  type :rewrind, '() -> 0'
  type :seek, '(Fixnum amount, ?Fixnum whence) -> 0'
  type :set_encoding, '(?String or Encoding ext_or_ext_int_enc) -> self'
  type :set_encoding, '(?String or Encoding ext_enc, ?String or Encoding int_enc) -> self'
  type :stat, '() -> File::Stat'
  type :sync, '() -> %bool'
  type :sync=, '(%bool) -> %bool'
  type :sysread, '(Fixnum maxlen, String outbuf) -> String'
  type :sysseek, '(Fixnum amount, ?Fixnum whence) -> Fixnum'
  type :syswrite, '(String) -> Fixnum'
  type :tell, '() -> Fixnum'
  rdl_alias :to_i, :fileno
  type :to_io, '() -> self'
  type :tty?, '() -> %bool'
  type :ungetbyte, '(String or Fixnum) -> nil'
  type :ungetc, '(String) -> nil'
  type :write, '(String) -> Fixnum'
  type :write_nonbloc, '(String, ?Fixnum options) -> Fixnum'
end
