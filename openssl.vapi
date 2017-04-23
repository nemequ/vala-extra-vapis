/* OpenSSL Vala Bindings
 * Copyright 2016 Guillaume Poirier-Morency <guillaumepoiriermorency@gmail>
 *
 * Copyright 1995-2016 The OpenSSL Project Authors. All Rights Reserved.
 *
 * Licensed under the OpenSSL license (the "License").  You may not use
 * this file except in compliance with the License.  You can obtain a copy
 * in the file LICENSE in the source distribution or at
 * https://www.openssl.org/source/license.html
 */

[CCode (cprefix = "")]
namespace OpenSSL
{
	[CCode (cprefix = "NID_", cheader_filename = "openssl/objects.h")]
	public enum NID
	{
		sha256
	}

	[Compact]
	[CCode (cname = "BIO_METHOD")]
	public class BIOMethod
	{

	}

	[Compact]
	[CCode (lower_case_cprefix = "BIO_", cheader_filename = "openssl/bio.h")]
	public class BIO
	{
		public static unowned BIOMethod s_mem ();
		public BIO (BIOMethod type);
		public int read (uint8[] buf);
	}

	[CCode (lower_case_cprefix = "CRYPTO_", cheader_filename = "openssl/crypto.h")]
	namespace Crypto
	{
		public int memcmp (void* v1, void* v2, size_t n);
	}

	[Compact]
	[CCode (lower_case_cprefix = "RSA_", cheader_filename = "openssl/rsa.h")]
	public class RSA
	{
		public int size ();
		[CCode (instance_pos = 5)]
		public bool sign (int type, uint8[] m, [CCode (array_length = false)] uint8[] sigret, out int siglen);
	}

	[CCode (lower_case_cprefix = "PEM_")]
	namespace PEM
	{
		[CCode (cname = "pem_password_cb")]
		public delegate int PasswordCallback (uint8[] buf, int flag);
		public void read_RSAPrivateKey (GLib.FileStream f, out RSA x, PasswordCallback? cb = null);
		public bool write_bio_RSAPublicKey (BIO bp, RSA x);
	}

	public int i2d_RSA_PUBKEY (RSA rsa, [CCode (array_length = false)] out uchar[] pp);
}
