/* libsodium Vala Bindings
 * Copyright 2016 Evan Nemerson <evan@nemerson.com>
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

/* This is *very* incomplete. */

[CCode (cheader_filename = "sodium.h", lower_case_cprefix = "sodium_")]
namespace Sodium {
  [CCode (lower_case_cprefix = "randombytes_")]
  namespace Random {
    [CCode (cname = "randombytes_random")]
    public static uint32 random (uint32 upper_bound = 0xffffffff);
    public static void buffer (uint8[] buf);
    public static int close ();
    public static int stir ();
  }

  namespace Sign {
    [CCode (cname = "crypto_sign_PUBLICKEYBYTES")]
    public static size_t PUBLIC_KEY_BYTES;
    [CCode (cname = "crypto_sign_SECRETKEYBYTES")]
    public static size_t SECRET_KEY_BYTES;

    [CCode (cname = "crypto_sign_keypair")]
    public static int key_pair (uint8[Sodium.Sign.PUBLIC_KEY_BYTES] public_key, uint8[Sodium.Sign.SECRET_KEY_BYTES] secret_key);
  }

  public static int init ();
}
