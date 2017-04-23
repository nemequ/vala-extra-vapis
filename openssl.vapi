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
	[CCode (cprefix = "AES_", lower_case_cprefix = "AES_", cheader_filename = "openssl/aes.h")]
	namespace AES
	{
		public const int BLOCK_SIZE;
	}

	[Compact]
	[CCode (cname = "ENGINE", cheader_filename = "openssl/engine.h")]
	public class Engine {}

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

	[CCode (cprefix = "EVP_", lower_case_cprefix = "EVP_", cheader_filename = "openssl/evp.h")]
	namespace EVP
	{
		[Compact]
		[CCode (cname = "EVP_MD")]
		public class MessageDigest
		{

		}

		public unowned MessageDigest? md_null ();
		public unowned MessageDigest? md2 ();
		public unowned MessageDigest? md4 ();
		public unowned MessageDigest? md5 ();
		public unowned MessageDigest? md5_sha1 ();
		public unowned MessageDigest? blake2b512 ();
		public unowned MessageDigest? blake2s256 ();
		public unowned MessageDigest? sha1 ();
		public unowned MessageDigest? sha224 ();
		public unowned MessageDigest? sha256 ();
		public unowned MessageDigest? sha384 ();
		public unowned MessageDigest? sha512 ();
		public unowned MessageDigest? mdc2 ();
		public unowned MessageDigest? ripmed160 ();
		public unowned MessageDigest? whirlpool ();
		[CCode (cname = "get_digestbyname")]
		public unowned MessageDigest? get_digest_by_name (string name);

		[Compact]
		[CCode (cname = "EVP_MD_CTX", lower_case_cprefix = "EVP_MD_CTX_")]
		public class MessageDigestContext
		{
			public MessageDigestContext ();
			[CCode (cname = "EVP_DigestInit_ex")]
			public int init (MessageDigest type, Engine? engine);
			[CCode (cname = "EVP_DigestUpdate")]
			public int update (uint8[] d);
			[CCode (cname = "EVP_DigestFinal_ex")]
			public int final ([CCode (array_length = false)] uchar[] md, out int s);
		}

		[Compact]
		[CCode (cname = "EVP_CIPHER", lower_case_cprefix = "EVP_CIPHER_")]
		public class Cipher
		{
			[CCode (cname = "EVP_CIPHER_meth_new")]
			public Cipher (int cipher_type, int block_size, int key_len);
			public int key_length ();
			public int iv_length ();
		}

		public unowned Cipher? enc_null ();
		public unowned Cipher? des_ecb ();
		public unowned Cipher? des_ede ();
		public unowned Cipher? des_ede3 ();
		public unowned Cipher? des_ede_ecb ();
		public unowned Cipher? des_ede3_ecb ();
		public unowned Cipher? des_cfb64 ();
		public unowned Cipher? des_cfb1 ();
		public unowned Cipher? des_cfb8 ();
		public unowned Cipher? des_ede_cfb64 ();
		public unowned Cipher? des_ede3_cfb64 ();
		public unowned Cipher? des_ede3_cfb1 ();
		public unowned Cipher? des_ede3_cfb8 ();
		public unowned Cipher? des_ofb ();
		public unowned Cipher? des_ede_ofb ();
		public unowned Cipher? des_ede3_ofb ();
		public unowned Cipher? des_cbc ();
		public unowned Cipher? des_ede_cbc ();
		public unowned Cipher? des_ede3_cbc ();
		public unowned Cipher? desx_cbc ();
		public unowned Cipher? des_ede3_wrap ();
		public unowned Cipher? rc4 ();
		public unowned Cipher? rc4_40 ();
		public unowned Cipher? rc4_hmac_md5 ();
		public unowned Cipher? idea_ecb ();
		public unowned Cipher? idea_cfb64 ();
		public unowned Cipher? idea_ofb ();
		public unowned Cipher? idea_cbc ();
		public unowned Cipher? rc2_ecb ();
		public unowned Cipher? rc2_cbc ();
		public unowned Cipher? rc2_40_cbc ();
		public unowned Cipher? rc2_64_cbc ();
		public unowned Cipher? rc2_cfb64 ();
		public unowned Cipher? rc2_ofb ();
		public unowned Cipher? bf_ecb ();
		public unowned Cipher? bf_cbc ();
		public unowned Cipher? bf_cfb64 ();
		public unowned Cipher? bf_ofb ();
		public unowned Cipher? cast5_ecb ();
		public unowned Cipher? cast5_cbc ();
		public unowned Cipher? cast5_cfb64 ();
		public unowned Cipher? cast5_ofb ();
		public unowned Cipher? rc5_32_12_16_cbc ();
		public unowned Cipher? rc5_32_12_16_ecb ();
		public unowned Cipher? rc5_32_12_16_cfb64 ();
		public unowned Cipher? rc5_32_12_16_ofb ();
		public unowned Cipher? aes_128_ecb ();
		public unowned Cipher? aes_128_cbc ();
		public unowned Cipher? aes_128_cfb1 ();
		public unowned Cipher? aes_128_cfb8 ();
		public unowned Cipher? aes_128_cfb128 ();
		public unowned Cipher? aes_128_ofb ();
		public unowned Cipher? aes_128_ctr ();
		public unowned Cipher? aes_128_ccm ();
		public unowned Cipher? aes_128_gcm ();
		public unowned Cipher? aes_128_xts ();
		public unowned Cipher? aes_128_wrap ();
		public unowned Cipher? aes_128_wrap_pad ();
		public unowned Cipher? aes_128_ocb ();
		public unowned Cipher? aes_192_ecb ();
		public unowned Cipher? aes_192_cbc ();
		public unowned Cipher? aes_192_cfb1 ();
		public unowned Cipher? aes_192_cfb8 ();
		public unowned Cipher? aes_192_cfb128 ();
		public unowned Cipher? aes_192_ofb ();
		public unowned Cipher? aes_192_ctr ();
		public unowned Cipher? aes_192_ccm ();
		public unowned Cipher? aes_192_gcm ();
		public unowned Cipher? aes_192_wrap ();
		public unowned Cipher? aes_192_wrap_pad ();
		public unowned Cipher? aes_192_ocb ();
		public unowned Cipher? aes_256_ecb ();
		public unowned Cipher? aes_256_cbc ();
		public unowned Cipher? aes_256_cfb1 ();
		public unowned Cipher? aes_256_cfb8 ();
		public unowned Cipher? aes_256_cfb128 ();
		public unowned Cipher? aes_256_ofb ();
		public unowned Cipher? aes_256_ctr ();
		public unowned Cipher? aes_256_ccm ();
		public unowned Cipher? aes_256_gcm ();
		public unowned Cipher? aes_256_xts ();
		public unowned Cipher? aes_256_wrap ();
		public unowned Cipher? aes_256_wrap_pad ();
		public unowned Cipher? aes_256_ocb ();
		public unowned Cipher? aes_128_cbc_hmac_sha1 ();
		public unowned Cipher? aes_256_cbc_hmac_sha1 ();
		public unowned Cipher? aes_128_cbc_hmac_sha256 ();
		public unowned Cipher? aes_256_cbc_hmac_sha256 ();
		public unowned Cipher? camellia_128_ecb ();
		public unowned Cipher? camellia_128_cbc ();
		public unowned Cipher? camellia_128_cfb1 ();
		public unowned Cipher? camellia_128_cfb8 ();
		public unowned Cipher? camellia_128_cfb128 ();
		public unowned Cipher? camellia_128_ofb ();
		public unowned Cipher? camellia_128_ctr ();
		public unowned Cipher? camellia_192_ecb ();
		public unowned Cipher? camellia_192_cbc ();
		public unowned Cipher? camellia_192_cfb1 ();
		public unowned Cipher? camellia_192_cfb8 ();
		public unowned Cipher? camellia_192_cfb128 ();
		public unowned Cipher? camellia_192_ofb ();
		public unowned Cipher? camellia_192_ctr ();
		public unowned Cipher? camellia_256_ecb ();
		public unowned Cipher? camellia_256_cbc ();
		public unowned Cipher? camellia_256_cfb1 ();
		public unowned Cipher? camellia_256_cfb8 ();
		public unowned Cipher? camellia_256_cfb128 ();
		public unowned Cipher? camellia_256_ofb ();
		public unowned Cipher? camellia_256_ctr ();
		public unowned Cipher? chacha20 ();
		public unowned Cipher? chacha20_poly1305 ();
		public unowned Cipher? seed_ecb ();
		public unowned Cipher? seed_cbc ();
		public unowned Cipher? seed_cfb128 ();
		public unowned Cipher? seed_ofb ();
		[CCode (cname = "EVP_get_cipherbyname")]
		public unowned Cipher? get_cipher_by_name (string name);

		[CCode (cname = "EVP_BytesToKey")]
		public int bytes_to_key (Cipher cipher, MessageDigest md, [CCode (array_length = false)] int[] salt, uchar[] key_data, int nrounds, [CCode (array_length = false)] uchar[] key, [CCode (array_length = false)] uchar[] iv);

		[Compact]
		[CCode (cname = "EVP_CIPHER_CTX", cprefix = "EVP_CIPHER_CTX_", lower_case_cprefix = "EVP_CIPHER_CTX_")]
		public class CipherContext
		{
			public CipherContext ();

			public int reset ();

			public int set_key_length (int keylen);
			public int set_padding (int pad);

			[CCode (cname = "EVP_EncryptInit_ex")]
			public int encrypt_init (Cipher cipher, Engine? engine, [CCode (array_length = false)] uchar[] key, [CCode (array_length = false)] uchar[] iv);

			[CCode (cname = "EVP_EncryptUpdate")]
			public int encrypt_update ([CCode (array_length = false)] uchar[] ciphertext, out int ciphertext_len, uchar[] plaintext);

			[CCode (cname = "EVP_EncryptFinal_ex")]
			public int encrypt_final ([CCode (array_length = false)] uchar[] ciphertext, out int ciphertext_len);

			[CCode (cname = "EVP_DecryptInit_ex")]
			public int decrypt_init (Cipher cipher, Engine? engine, [CCode (array_length = false)] uchar[] key, [CCode (array_length = false)] uchar[] iv);

			[CCode (cname = "EVP_DecryptUpdate")]
			public int decrypt_update([CCode (array_length = false)] uchar[] plaintext, out int plaintext_len, uchar[] ciphertext);

			[CCode (cname = "EVP_DecryptFinal_ex")]
			public int decrypt_final ([CCode (array_length = false)] uchar[] plaintext, out int plaintext_len);
		}
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
