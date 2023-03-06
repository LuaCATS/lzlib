---@meta
---
---`lzlib`, by Tiago Dionizio, http://luaforge.net/projects/lzlib/.
---https://luarocks.org/modules/hisham/lzlib
---https://github.com/LuaDist/lzlib
zlib = {}

---returns zlib version
---
---@return string
function zlib.version() end

---Without any parameters, returns the initial adler32 value.
---
---Call to update the adler32 value, adler is the current value, buffer is passed
---to adler32 zlib function and the updated value is returned.
---
---@param adler32? integer
---@param buffer? string
---
---@return string buffer
function zlib.adler32(adler32, buffer) end

---Same as zlib.adler32.
---
---@param crc32? integer
---@param buffer? string
---
---@return string buffer
function zlib.crc32(crc32, buffer) end

---Return a string containing the compressed buffer according to the given parameters.
---
---@param buffer string
---@param level? integer
---@param method? integer
---@param windowBits? integer
---@param memLevel? integer
---@param strategy? integer
---
---@return string buffer
function zlib.compress(buffer, level, method, windowBits, memLevel, strategy) end

---Return the decompressed stream after processing the given buffer.
---
---@param buffer string
---@param windowBits? integer
---
---@return string
function zlib.decompress(buffer, windowBits) end

---Return a deflate stream.
---
function zlib.deflate() end

---Return an inflate stream.
---
function zlib.inflate() end

return zlib
