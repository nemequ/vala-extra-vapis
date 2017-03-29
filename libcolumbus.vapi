/* libcolumbus Vala Bindings
 * Copyright 2016 Daniel 'grindhold' Brendle <grindhold@skarphed.org>
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

[CCode (lower_case_cprefix = "col_", cheader_filename = "columbus1/columbus.h")]
namespace Columbus {
    [Compact, CCode (cname = "ColWord", free_function = "col_word_delete")]
    /**
     * Used to label fields in {@link Columbus.Document}s
     */
    public class Word {
        /**
         * Creates a new Word. Supply the name as string parameter.
         */
        public Word (string utf8_word);

        /**
         * Returns the size of the given word
         */
        public size_t length ();

        /**
         * Reads the stored string into the supplied buffer
         */
        public void as_utf8 (uint8[] buffer);
    }

    [Compact, CCode (cname = "ColDocument", free_function = "col_document_delete")]
    /**
     * A document is a collection of one or more text-fields, labelled
     * with one {@link Columbus.Word} each.
     */
    public class Document {
        /**
         * Creates a Document with the given (unique) id.
         */
        public Document (int64 id);

        /**
         * Returns this document's id
         */
        public int64 get_id ();

        /**
         * Assings some text to this document and labels it with
         * the given field_name
         */
        public void add_text (Word field_name, string text_as_utf8);
    }

    [Compact, CCode (cname = "ColMatcher", free_function = "col_matcher_delete")]
    /**
     * The matcher class let's you execute queries against indexed
     * data.
     */
    public class Matcher {
        /**
         * Creates a new Matcher
         */
        public Matcher ();

        /**
         * Indexes the supplied Corpus
         */
        public void index (Corpus c);

        /**
         * Executes a query against the index data with
         * the search term supplied as the first parameter
         * Returns a MatchResults object.
         */
        public MatchResults match (string query_as_utf8);

        /**
         * Returns the matcher's {@link ErrorValues} object
         */
        public ErrorValues get_error_values ();

        /**
         * Returns the matcher's {@link IndexWeights} object
         */
        public IndexWeights get_index_weights ();
    }

    [Compact, CCode (cname = "ColMatchResults", free_function = "col_match_results_delete")]
    /**
     * Represents the hits that occured when a query against an index
     * has been executed. Each potential matchresult is enumerated
     * from 0 to n.
     */
    public class MatchResults {
        /**
         * Creates a new MatchResults object
         */
        public MatchResults ();

        /**
         * Returns the size of the MatchResults. Use it to iterate
         * over the searchresults together with the methods {@link MatchResults.get_id}
         * and {@link MatchResults.get_relevancy}
         */
        public size_t size ();

        /**
         * Returns the id of the Document related to match with the
         * number i.
         */
        public int64 get_id (size_t i);

        /**
         * Returns the calculated relevancy of the match with number i.
         * HERE BE DRAGONS: the c-api is broken here. the bug is known
         * details at: [[https://bugs.launchpad.net/libcolumbus/+bug/1622424]]
         */
        public double get_relevancy (size_t i);
    }

    [Compact, CCode (cname = "ColCorpus", free_function = "col_corpus_delete")]
    /**
     * A corpus is a collection of documents that are to be indexed together
     */
    public class Corpus {
        /**
         * Creates a new Corpus
         */
        public Corpus ();

        /**
         * Adds the given document to the Corpus in order to make
         * it indexable
         */
        public void add_document (Document d);
    }

    /*
     * These objects are implicitly created inside Columbus.Matcher classes
     * and apparently get destroyed along them. The C-API of libcolumbus does
     * not supply any unref/delete/destructor function, so I assume it gets
     * freed automatically when the corresponding matcher is being deleted.
     */
    [Compact, CCode(cname = "ColIndexWeights", free_function = "")]
    /**
     * Used to manipulate the weight of the fields of documents.
     *
     * Useful if you e.g. search a collection of address records phone numbers,
     * you can make the phone-number field more relevant than the postal code
     * so you get more useful output even if the postal code would match the
     * phone number the user searched for.
     * You cannot access this class directly. Access it though
     * {@link Columbus.Matcher.get_index_weights()}
     */
    public class IndexWeights {
        /**
         * Set the weight of a specific word (name of a field in a) {@link Columbus.Document}
         */
        public void set_weight (Word field, double new_weight);

        /**
         * Returns the current weight of the given field.
         */
        public double get_weight (Word field);
    }

    [SimpleType, CCode(cname = "ColErrorValues")]
    /**
     * This is your interface to adjust the error-checking-algorithms of
     * a {@link Columbus.Matcher}.
     */
    public struct ErrorValues {
        /**
         * Tells the matcher to take accent-errors and keyboard-errors
         * into account.
         *
         * An accent error is a non matching accent on a letter. E.g. when
         * someone searched for "pâte" but actually meant to find "pâté" (which
         * is pretty delicious french food btw)
         * A keyboard error is, when some wanted to type a "J" and instead typed
         * a "K". Those two are directly beneath each other on your standard
         * QWERTY/QWERTZ keyboard.
         */
        public void add_standard_errors ();

        /**
         * Attempt to scan for substrings instead of full-word matching
         */
        public void set_substring_mode ();
    }
}
