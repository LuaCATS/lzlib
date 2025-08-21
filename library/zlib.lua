-- -----------------------------------------------------------------------------
-- Copyright (c) 2023-2025 by Josef Friedrich <josef@friedrich.rocks>
-- -----------------------------------------------------------------------------
--
-- MIT License
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
-- SOFTWARE.
--
-- -----------------------------------------------------------------------------

---
---@meta
---The definitions are developed in this repository: https://github.com/LuaCATS/lzlib

---
---`lzlib`, by Tiago Dionizio.
---
---* Old location: http://luaforge.net/projects/lzlib/.
---* More recent git repo (archived): https://github.com/LuaDist/lzlib
---* On luarocks: https://luarocks.org/modules/hisham/lzlib
---
---😱 [Types](https://github.com/LuaCATS/lzlib/blob/main/library/lzlib.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/lzlib/pulls)
local zlib = {}

---
---Return the zlib version.
---
---__Example:__
---
---```lua
---local version = zlib.version()
---assert(version == '1.2.13')
---```
---
---__Reference:__
---
---* Corresponding C source code: [lzlib.c#L699-L703](https://github.com/LuaDist/lzlib/blob/db11786b49beb02ce95ef8043c59bd13a4138cb3/lzlib.c#L699-L703)
---
---@return string version # For example `1.2.13`
---
---😱 [Types](https://github.com/LuaCATS/lzlib/blob/main/library/lzlib.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/lzlib/pulls)
function zlib.version() end

---
---Return the initial `adler32` value.
---
---Call to update the `adler32` value, `adler32` is the current value, `buffer` is passed
---to `adler32` zlib function and the updated value is returned.
---
---This function is not related to compression but is exported anyway because it might be useful in applications using the compression library.
---
---__Example:__
---
---```lua
---local adler = zlib.adler32()
---assert(adler == 1.0)
---adler = zlib.adler32(adler, 'some text')
---assert(adler == 300417946.0)
---adler = zlib.adler32(adler, 'some text')
---assert(adler == 1144063795.0)
---adler = zlib.adler32(adler, 'some text')
---assert(adler == 2530937548.0)
---```
---
---__Reference:__
---
---* Corresponding C source code: [lzlib.c#L706-L723](https://github.com/LuaDist/lzlib/blob/db11786b49beb02ce95ef8043c59bd13a4138cb3/lzlib.c#L706-L723)
---
---@param adler32? number
---@param buffer? string
---
---@return number adler32
---
---😱 [Types](https://github.com/LuaCATS/lzlib/blob/main/library/lzlib.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/lzlib/pulls)
function zlib.adler32(adler32, buffer) end

---
---Return the initial `crc32` (Cyclic Redundancy Check) value.
---
---Call to update the `crc32` value, `crc32` is the current value, `buffer` is passed
---to `crc32` zlib function and the updated value is returned.
---
---This function is not related to compression but is exported anyway because it might be useful in applications using the compression library.
---
---__Example:__
---
---```lua
---local crc = zlib.crc32()
---assert(crc == 0.0)
---crc = zlib.crc32(crc, 'some text')
---assert(crc == 1337638330.0)
---crc = zlib.crc32(crc, 'some text')
---assert(crc == 2768805016.0)
---crc = zlib.crc32(crc, 'some text')
---assert(crc == 1021719064.0)
---```
---
---__Reference:__
---
---* Corresponding C source code: [lzlib.c#L726-L743](https://github.com/LuaDist/lzlib/blob/db11786b49beb02ce95ef8043c59bd13a4138cb3/lzlib.c#L726-L743)
---
---@param crc32? number
---@param buffer? string
---
---@return number crc32
---
---😱 [Types](https://github.com/LuaCATS/lzlib/blob/main/library/lzlib.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/lzlib/pulls)
function zlib.crc32(crc32, buffer) end

---
---Return a string containing the compressed buffer according to the given parameters.
---
---__Example:__
---
---```lua
---local orig = [[
---Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam
---nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat,
---sed diam voluptua.
---]]
---assert(string.len(zlib.compress(orig)) < string.len(orig))
---```
---
---__Reference:__
---
---* Corresponding C source code: [lzlib.c#L748-L809](https://github.com/LuaDist/lzlib/blob/db11786b49beb02ce95ef8043c59bd13a4138cb3/lzlib.c#L748-L809)
---
---@param buffer string
---@param level? integer # The compression level must be `-1` (default compression), or between `0` and `9`: `1` gives best speed, `9` gives best compression, `0` gives no compression at all (the input data is simply copied a block at a time).
---@param method? integer # The method parameter is the compression method. It must be `8` (`Z_DEFLATED`) in this version of the library.
---@param window_bits? integer # `The window_bits` parameter is the base two logarithm of the maximum window size (the size of the history buffer). It should be in the range `8..15` for this version of the library, default `15`.
---@param mem_level? integer - default `8`
---@param strategy? integer - default `Z_DEFAULT_STRATEGY`
---
---@return string buffer
---
---😱 [Types](https://github.com/LuaCATS/lzlib/blob/main/library/lzlib.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/lzlib/pulls)
function zlib.compress(
  buffer,
  level,
  method,
  window_bits,
  mem_level,
  strategy
)
end

---
---Return the decompressed stream after processing the given buffer.
---
---__Example:__
---
---```lua
---local uncompressed = 'Lorem ipsum'
---local compressed = zlib.compress(uncompressed)
---local result = zlib.decompress(compressed)
---assert(result == uncompressed)
---```
---
---__Reference:__
---
---* Corresponding C source code: [lzlib.c#L813-L871](https://github.com/LuaDist/lzlib/blob/db11786b49beb02ce95ef8043c59bd13a4138cb3/lzlib.c#L813-L871)
---
---@param buffer string
---@param window_bits? integer # `The window_bits` parameter is the base two logarithm of the maximum window size (the size of the history buffer). It should be in the range `8..15` for this version of the library, default `15`.
---
---@return string
---
---😱 [Types](https://github.com/LuaCATS/lzlib/blob/main/library/lzlib.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/lzlib/pulls)
function zlib.decompress(buffer, window_bits) end

---
---😱 [Types](https://github.com/LuaCATS/lzlib/blob/main/library/lzlib.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/lzlib/pulls)
---@class zlib.Sink
local Sink = {}

---
---😱 [Types](https://github.com/LuaCATS/lzlib/blob/main/library/lzlib.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/lzlib/pulls)
function Sink:write() end

---
---😱 [Types](https://github.com/LuaCATS/lzlib/blob/main/library/lzlib.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/lzlib/pulls)
function Sink:close() end

---
---😱 [Types](https://github.com/LuaCATS/lzlib/blob/main/library/lzlib.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/lzlib/pulls)
function Sink:flush() end

---
---Return a deflate stream.
---
---__Reference:__
---
---* Corresponding C source code: [lzlib.c#L227-L268](https://github.com/LuaDist/lzlib/blob/db11786b49beb02ce95ef8043c59bd13a4138cb3/lzlib.c#L227-L268)
---
---@param sink zlib.Sink | function
---@param level? integer # The compression level must be `-1` (default compression), or between `0` and `9`: `1` gives best speed, `9` gives best compression, `0` gives no compression at all (the input data is simply copied a block at a time).
---@param method? integer # The method parameter is the compression method. It must be `8` (`Z_DEFLATED`) in this version of the library.
---@param window_bits? integer # `The window_bits` parameter is the base two logarithm of the maximum window size (the size of the history buffer). It should be in the range `8..15` for this version of the library, default `15`.
---@param mem_level? integer - default `8`
---@param strategy? integer - default `Z_DEFAULT_STRATEGY`
---@param dictionary? string - default `""`
---
---@return zlib.Stream
---
---😱 [Types](https://github.com/LuaCATS/lzlib/blob/main/library/lzlib.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/lzlib/pulls)
function zlib.deflate(
  sink,
  level,
  method,
  window_bits,
  mem_level,
  strategy,
  dictionary
)
end

---
---😱 [Types](https://github.com/LuaCATS/lzlib/blob/main/library/lzlib.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/lzlib/pulls)
---@class zlib.InflateSink
local InflateSink = {}

---
---😱 [Types](https://github.com/LuaCATS/lzlib/blob/main/library/lzlib.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/lzlib/pulls)
function InflateSink:read() end

---
---😱 [Types](https://github.com/LuaCATS/lzlib/blob/main/library/lzlib.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/lzlib/pulls)
function InflateSink:close() end

---
---Return an inflate stream.
---
---__Reference:__
---
---* Corresponding C source code: [lzlib.c#L277-L323](https://github.com/LuaDist/lzlib/blob/db11786b49beb02ce95ef8043c59bd13a4138cb3/lzlib.c#L277-L323)
---
---@param source string|function|zlib.InflateSink
---@param window_bits? integer -  default `15`
---@param dictionary? string - default `""`
---
---@return zlib.Stream
---
---😱 [Types](https://github.com/LuaCATS/lzlib/blob/main/library/lzlib.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/lzlib/pulls)
function zlib.inflate(source, window_bits, dictionary) end

---
---😱 [Types](https://github.com/LuaCATS/lzlib/blob/main/library/lzlib.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/lzlib/pulls)
---@class zlib.Stream
local Stream = {}

---
---Write each parameter into the stream.
---
---__Reference:__
---
---* Corresponding C source code: [lzlib.c#L673-L676](https://github.com/LuaDist/lzlib/blob/db11786b49beb02ce95ef8043c59bd13a4138cb3/lzlib.c#L673-L676)
---
---@param ... any
---
---😱 [Types](https://github.com/LuaCATS/lzlib/blob/main/library/lzlib.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/lzlib/pulls)
function Stream:write(...) end

---
---Read from the stream, each parameter corresponds to a return value.
---
---With no arguments, it reads a line. Parameters are interpreted as follows:
---
---* `a` - reads the remaining bytes
---* `l` - reads a line
---
---__Reference:__
---
---* Corresponding C source code: [lzlib.c#L550-L592](https://github.com/LuaDist/lzlib/blob/db11786b49beb02ce95ef8043c59bd13a4138cb3/lzlib.c#L550-L592)
---
---@param ... integer|'a'|'l'
---
---😱 [Types](https://github.com/LuaCATS/lzlib/blob/main/library/lzlib.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/lzlib/pulls)
function Stream:read(...) end

---
---Return an iterator that returns a new line each time
---it is called.
---
---@return fun(): line: string
---
---😱 [Types](https://github.com/LuaCATS/lzlib/blob/main/library/lzlib.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/lzlib/pulls)
function Stream:lines() end

---
---Flush the output for deflate streams.
---
---__Reference:__
---
---* Corresponding C source code: [lzlib.c#L681-L691](https://github.com/LuaDist/lzlib/blob/db11786b49beb02ce95ef8043c59bd13a4138cb3/lzlib.c#L681-L691)
---
---@param opts 'sync'|'full'|'finish'
---
---😱 [Types](https://github.com/LuaCATS/lzlib/blob/main/library/lzlib.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/lzlib/pulls)
function Stream:flush(opts) end

---
---Close the stream.
---
---__Reference:__
---
---* Corresponding C source code: [lzlib.c#L192-L204](https://github.com/LuaDist/lzlib/blob/db11786b49beb02ce95ef8043c59bd13a4138cb3/lzlib.c#L192-L204)
---
---😱 [Types](https://github.com/LuaCATS/lzlib/blob/main/library/lzlib.lua) incomplete or incorrect? 🙏 [Please contribute!](https://github.com/LuaCATS/lzlib/pulls)
function Stream:close() end

---
---__Reference:__
---
---* Corresponding C source code: [lzlib.c#L208-L212](https://github.com/LuaDist/lzlib/blob/db11786b49beb02ce95ef8043c59bd13a4138cb3/lzlib.c#L208-L212)
---
---@return number adler
function Stream:adler() end


return zlib
