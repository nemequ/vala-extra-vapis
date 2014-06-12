/* libzmq.vala
 *
 * Copyright (C) 2011  Lewis Gunsch <lewis@gunsch.ca>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.

 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.

 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301  USA

 *
 * Author:
 *      Lewis Gunsch <lewis@gunsch.ca>
 */

[CCode (lower_case_cprefix = "zmq_", cheader_filename = "zmq.h")]
namespace ZMQ {
	[Compact]
	[CCode (cprefix = "zmq_", cname = "void", free_function = "zmq_term")]
	public class Context {
		[CCode (cname = "zmq_init")]
		public Context (int io_threads);
	}

	[CCode (cprefix = "ZMQ_")]
	namespace VERSION {
		public const int MAJOR;
		public const int MINOR;
		public const int PATCH;

		[CCode (cname = "ZMQ_VERSION")]
		public const int VERSION;
	}

	public static void version (out int major, out int minor, out int patch);

	/* ZMQ error numbers, in addition to POSIX error numbers. */
	[CCode (cname = "EFSM")]
	public const int EFSM;
	[CCode (cname = "ENOCOMPATPROTO")]
	public const int ENOCOMPATPROTO;
	[CCode (cname = "ETERM")]
	public const int ETERM;
	[CCode (cname = "EMTHREAD")]
	public const int EMTHREAD;

	public int errno ();
	public unowned string strerror (int errnum);

	[CCode (cname = "ZMQ_MAX_VSM_SIZE")]
	public const int MAX_VSM_SIZE;
	[CCode (cname = "ZMQ_DELIMITER")]
	public const int DELIMITER;
	[CCode (cname = "ZMQ_VSM")]
	public const int VSM;

	[CCode (cname = "zmq_free_fn", type = "void (*)(void *, void *)")]
	public delegate void free_fn (void *data);

	[CCode (cprefix = "zmq_msg_", cname = "zmq_msg_t", destroy_function = "zmq_msg_close", copy_function = "NO_IMPLICIT_COPY")]
	public struct Msg {
		public const uchar MORE;
		public const uchar SHARED;
		[CCode (cname = "zmq_msg_init")]
		public Msg ();
		[CCode (cname = "zmq_msg_init_size")]
		public Msg.with_size (size_t size);
		[CCode (cname = "zmq_msg_init_data")]
		public Msg.with_data (owned uint8[] data, free_fn? ffn = null);
		[CCode (cname = "zmq_msg_copy", instance_pos = -1)]
		private int _copy (ref Msg dest);
		[CCode (cname = "zmq_msg_copy_wrapper")]
		public Msg copy () {
			Msg msg = Msg ();
			this._copy (ref msg);
			return msg;
		}
		public Msg clone () {
			unowned uint8[] data = (uint8[]) GLib.Memory.dup((void*) this._data (), (uint) this.size ());
			data.length = (int) this.size ();
			Msg copy = Msg.with_data (data);
			return copy;
		}
		[CCode (cname = "zmq_msg_data")]
		private uint8 *_data ();
		public size_t size ();
		public uint8[] data {
			get {
				unowned uint8[] data = (uint8[]) this._data ();
				data.length = (int) this.size ();
				return data;
			}
		}
		[CCode (instance_pos = -1)]
		public int move (ref Msg dest);
	}

	[CCode (cname = "int", cprefix = "ZMQ_")]
	public enum SocketType {
		PAIR,
		PUB,
		SUB,
		REQ,
		REP,
		DEALER,
		ROUTER,
		PULL,
		PUSH,
		XPUB,
		XSUB
	}

	[CCode (cname = "int", cprefix = "ZMQ_")]
	public enum SocketOption {
		HWM,
		SWAP,
		AFFINITY,
		IDENTITY,
		SUBSCRIBE,
		UNSUBSCRIBE,
		RATE,
		RECOVERY_IVL,
		MCAST_LOOP,
		SNDBUF,
		RCVBUF,
		RCVMORE,
		FD,
		EVENTS,
		TYPE,
		LINGER,
		RECONNECT_IVL,
		BACKLOG,
		RECOVERY_IVL_MSEC,
		RECONNECT_IVL_MAX
	}

	[CCode (cname = "int", cprefix = "ZMQ_")]
	public enum SendRecvOption {
		NOBLOCK,
		SNDMORE
	}

	[Compact]
	[CCode (cprefix = "zmq_", cname = "void", free_function = "zmq_close")]
	public class Socket {
		[CCode (cname = "zmq_socket")]
		public static Socket? create(Context context, SocketType type);
		[CCode (simple_generics = true)]
		public int setsockopt < T > (SocketOption option, T optval, size_t optvallen);
		[CCode (simple_generics = true)]
		public int getsockopt < T > (SocketOption option, T optval, size_t optvallen);
		public int bind (string addr);
		public int connect (string addr);
		public int send (ref Msg msg, SendRecvOption flags = 0);
		public int recv (ref Msg msg, SendRecvOption flags = 0);
	}

	namespace POLL {
		[CCode (cname = "ZMQ_POLLIN")]
		public const short IN;
		[CCode (cname = "ZMQ_POLLOUT")]
		public const short OUT;
		[CCode (cname = "ZMQ_POLLERR")]
		public const short ERR;

		[CCode (cname = "zmq_pollitem_t")]
		public struct PollItem {
			Socket *socket;
			int fd;
			short events;
			short revents;
		}

		[CCode (cname = "zmq_poll")]
		public int poll (PollItem[] items, long timeout);
	}

	[CCode (cname = "int", cprefix = "ZMQ_")]
	public enum Device {
		STREAMER,
		FORWARDER,
		QUEUE;
		[CCode (cname = "zmq_device")]
		public int device (Socket insocket, Socket outsocket);
	}
}