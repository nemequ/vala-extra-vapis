/* matheval Vala Bindings
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

[CCode (cprefix = "", lower_case_cprefix = "", cheader_filename = "matheval.h")]
namespace matheval
{
    [Compact]
    [CCode (cname = "void", free_function = "evaluator_destroy")]
    public class Evaluator
    {
        public static Evaluator create (string s);
        
        /*
         * FIXME a bit hackish, as names.length == values.length 
         * is not forced.
         */
        public double evaluate (
            [CCode (array_length_pos = 0)] string[] names, 
            [CCode (array_length = false)] double[] values);
        
        public unowned string get_string ();
        
        public void get_variables (
            [CCode (array_length_pos = 1)] out unowned  string[] names);
        
        public Evaluator derivative (string name);
        
        public double evaluate_x (double x);
        public double evaluate_x_y (double x, double y);
        public double evaluate_x_y_z (double x, double y, double z);
        
        public Evaluator derivative_x ();
        public Evaluator derivative_y ();
        public Evaluator derivative_z ();
    }
}
