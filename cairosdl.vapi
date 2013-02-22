/* 
  Copyright (C) 2012 Davorin Šego

  Permission is hereby granted, free of charge, to any person obtaining a copy of
  this software and associated documentation files (the "Software"), to deal in
  the Software without restriction, including without limitation the rights to
  use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
  of the Software, and to permit persons to whom the Software is furnished to do
  so, subject to the following conditions:

  The above copyright notice and this permission notice shall be included in all
  copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
  SOFTWARE.
*/

[CCode (cprefix = "cairosdl_", lower_case_cprefix = "cairosdl_", cheader_filename = "cairosdl.h")]
namespace CairoSDL {

  public Cairo.Surface surface_create(SDL.Surface sdl_surface);
  public SDL.Surface surface_get_target(Cairo.Surface cairo_surface);
  public void surface_flush_rects(Cairo.Surface surface, int num_rects, SDL.Rect[] rects);
  public void surface_flush_rect(Cairo.Surface surface, int x, int y, int width, int height);
  public void surface_flush(Cairo.Surface surface);
  public void surface_mark_dirty_rects(Cairo.Surface surface, int num_rects, SDL.Rect[] rects);
  public void cairosdl_surface_mark_dirty_rect(Cairo.Surface surface, int x, int y, int width, int height);
  public void surface_mark_dirty (Cairo.Surface surface);
  public Cairo.Context create(SDL.Surface sdl_surface);
  public SDL.Surface get_target(Cairo.Context context);
  public void destroy(Cairo.Context context);

}