/* snappy Vala Bindings
 * Copyright 2011 Fabian Deutsch <fabian.deutsch@gmx.de>
 *
 * Permission is hereby granted, free of charge, to any person
 * obtaining a copy of this software and associated documentation
 * files (the "Software"), to deal in the Software without
 * restriction, including without limitation the rights to use, copy,
 * modify, merge, publish, distribute, sublicense, and/or sell copies
 * of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
 * BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
 * ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
 * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */

[CCode (cheader_filename = "snappy-c.h")]
namespace Snappy
{

    [CCode (cname = "snappy_status", cprefix = "SNAPPY_")]
    public enum Status
    {
        OK,
        INVALID_INPUT,
        BUFFER_TOO_SMALL
    }


    Status compress (char* input, size_t input_length, 
                     char* compressed, size_t* compressed_length);

    Status uncompress (char* compressed, size_t compressed_length, 
                       char* uncompressed, size_t* uncompressed_length);

    size_t max_compressed_length (size_t source_length);

    Status uncompressed_length (char* compressed, size_t compressed_length, size_t* result);

    Status validate_compressed_buffer (char* compressed, size_t compressed_length);
}
