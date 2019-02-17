namespace PortAudioTest {
	class Main {
		private PortAudio.Stream stream;
		private double lphase = 0;
		private double rphase = 0.3;

		public Main() {
			
			var apiIndex = PortAudio.host_api_type_id_to_host_api(PortAudio.HostApiTypeId.JACK);
			unowned PortAudio.HostApiInfo api = PortAudio.HostApiInfo.get(apiIndex);
			unowned PortAudio.DeviceInfo device = PortAudio.DeviceInfo.get(api.default_output_device);
			var outputParams = PortAudio.Stream.Parameters() {
				device = api.default_output_device,
				channel_count = 2,
				sample_format = PortAudio.FLOAT_32,
				suggested_latency = device.default_low_output_latency
			};
			var inputParams = PortAudio.Stream.Parameters();
			PortAudio.Stream.open(out stream, null, &outputParams, 44100, 512, PortAudio.Stream.NO_FLAG, callback);
			stream.start();
		}

		public int callback(void* input, void* output,
												ulong frame_count,
											PortAudio.Stream.CallbackTimeInfo time_info,
											PortAudio.Stream.CallbackFlags status_flags) {
			float* outf = (float*)output;
			for(ulong i=0; i<frame_count; i++)
			{
				*outf++ = Math.sin(lphase);
				*outf++ = Math.sin(rphase);
				lphase += 2*Math.PI*220.0/44100.0;
				rphase += 2*Math.PI*220.0/44100.0;
			}
			return PortAudio.Stream.CallbackResult.CONTINUE;
		}

		public static void main() {
			PortAudio.initialize();
			{
				var main = new Main();
				stdin.read_line();
			}
			PortAudio.terminate();
		}
	}
}