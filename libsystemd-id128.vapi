[CCode (lower_case_cprefix = "sd_", cheader_filename = "systemd/sd-id128.h")]
namespace Systemd {
  [SimpleType, CCode (cname = "sd_id128_t", lower_case_cprefix = "sd_id128_", cheader_filename = "systemd/sd-id128.h", default_value = "SD_ID128_NULL")]
  public struct Id128 {
    public uint8 bytes[16];
    public uint64 qwords[2];

    [CCode (cname = "SD_ID128_NULL")]
    public const Systemd.Id128 NULL;

    [CCode (cname = "sd_id128_randomize")]
    public static int random (out Systemd.Id128 ret);
    [CCode (cname = "sd_id128_get_machine")]
    public static int machine (out Systemd.Id128 ret);
    [CCode (cname = "sd_id128_get_boot")]
    public static int boot (out Systemd.Id128 ret);
    public static int from_string (string s, out Systemd.Id128 ret);

    [CCode (cname = "sd_id128_to_string")]
    private string _to_string ([CCode (array_length = false)] owned char[] s = new char[33]);
    [CCode (cname = "_vala_sd_id128_to_string")]
    public string to_string () {
      return this.str;
    }

    public static bool equal (Systemd.Id128 a, Systemd.Id128 b);

    public unowned string str {
      [CCode (cname = "SD_ID128_CONST_STR")]
      get;
    }
  }
}
