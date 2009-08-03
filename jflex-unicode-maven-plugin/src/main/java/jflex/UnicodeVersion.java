/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 * JFlex Unicode plugin                                                    *
 * Copyright (c) 2008 Steve Rowe <steve_rowe@users.sf.net>                 *
 *                                                                         *
 *                                                                         *
 * This program is free software; you can redistribute it and/or modify    *
 * it under the terms of the GNU General Public License. See the file      *
 * COPYRIGHT for more information.                                         *
 *                                                                         *
 * This program is distributed in the hope that it will be useful,         *
 * but WITHOUT ANY WARRANTY; without even the implied warranty of          *
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the           *
 * GNU General Public License for more details.                            *
 *                                                                         *
 * You should have received a copy of the GNU General Public License along *
 * with this program; if not, write to the Free Software Foundation, Inc., *
 * 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA                 *
 *                                                                         *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

package jflex;

import org.apache.maven.plugin.logging.Log;

import java.io.IOException;
import java.io.File;
import java.io.PrintWriter;
import java.net.URL;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.SortedMap;
import java.util.SortedSet;
import java.util.TreeMap;
import java.util.TreeSet;
import java.util.HashSet;
import java.util.EnumMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;


/**
 * This class is instantiated for each version of Unicode for which data can
 * be found at unicode.org.  This class is responsible for parsing the following
 * Unicode data files:
 * <ul>
 *   <li>UnicodeData(-X.X.X).txt</li>
 *   <li>PropertyAliases(-X.X.X).txt</li>
 *   <li>PropertyValueAliases(-X.X.X).txt</li>
 *   <li>DerivedCoreProperties(-X.X.X).txt</li>
 *   <li>Scripts(-X.X.X).txt</li>
 *   <li>Blocks(-X.X.X).txt</li>
 *   <li>PropList(-X.X.X).txt</li>
 * </ul>
 * and for emitting (into the source file generated by
 * jflex-unicode-maven-plugin: UnicodeProperties.java) the set of Property
 * Values supported by this version of Unicode, as well as the corresponding
 * code point interval sets for each member of the Property Value set.
 */
class UnicodeVersion {

  /** Pattern for the full Unicode version */
  private final Pattern FULL_VERSION_PATTERN
    = Pattern.compile("(\\d+\\.\\d+)\\.\\d+");

  /** Pattern for the full Unicode version from the unicode data URL */
  private final Pattern FULL_VERSION_PATTERN_IN_URL
    = Pattern.compile("UnicodeData-(\\d+\\.\\d+\\.\\d+)\\.txt$");

  /** Pattern used to normalize property value identifiers */
  private static final Pattern WORD_SEP_PATTERN = Pattern.compile("[-_\\s()]");

  /** Normalized General_Category property name */
  private static final String NORMALIZED_GENERAL_CATEGORY 
    = normalize("General_Category"); 

  /** Normalized Script property name */
  private static final String NORMALIZED_SCRIPT = normalize("Script"); 
  
  /**
   * The number of code point ranges to output per line in
   * UnicodeProperties.java.
   */
  private static final int INTERVALS_PER_LINE = 4;

  /**
   * The number of alias/target property value pairs to output per line in
   * UnicodeProperties.java.
   */
  private static final int PROPERTY_VALUE_ALIAS_MAPPINGS_PER_LINE = 2;

  /**
   * The number of property values to output per line in UnicodeProperties.java.
   */
  private static final int PROPERTY_VALUES_PER_LINE = 6;

  /**
   * The number of caseless match partitions to output per line in
   * UnicodeProperties.java.
   */
  private static final int CASELESS_MATCH_PARTITIONS_PER_LINE = 3;

  /** The property values that represent surrogates [U+D800-U+DFFF] */
  private static final Pattern SURROGATE_PATTERN
    = Pattern.compile("^cs$|surrogate", Pattern.CASE_INSENSITIVE);
  
  /** Unicode version X.X.X */
  String majorMinorUpdateVersion;

  /** Unicode version X.X */
  String majorMinorVersion;

  /** The greatest code point listed in UnicodeData(-X.X.X).txt */
  int maximumCodePoint;

  /**
   * Maps Unicode property values to the associated set of
   * code point ranges.
   */
  SortedMap<String,List<NamedRange>> propertyValueIntervals
    = new TreeMap<String,List<NamedRange>>();

  /** Stores encountered enumerated property names and values */
  Map<String,Set<String>> usedEnumeratedProperties 
    = new HashMap<String,Set<String>>();

  /** Stores encountered binary property names */
  Set<String> usedBinaryProperties = new HashSet<String>();
  
  /** Stores all defined property name aliases */
  Map<String,Set<String>> allPropertyAliases = new HashMap<String,Set<String>>();
  
  /** Stores all defined property value aliases */
  Map<String,Map<String,Set<String>>> allPropertyValueAliases 
    = new HashMap<String,Map<String,Set<String>>>();
  
  /** Maps property aliases to their corresponding canonical property names */
  Map<String,String> propertyAlias2CanonicalName = new HashMap<String,String>();
  
  /** Maps property value aliases to their corresponding canonical property values */
  Map<String,Map<String,String>> propertyValueAlias2CanonicalValue 
    = new HashMap<String,Map<String,String>>();

  /**
   * A set of code point space partitions, each containing at least two
   * caselessly equivalent code points.
   */
  Map<Integer,SortedSet<Integer>> caselessMatchPartitions
    = new HashMap<Integer,SortedSet<Integer>>();

  /** The maximum size of the partitions in {@link #caselessMatchPartitions}. */
  int caselessMatchPartitionSize = 0;
  
  private EnumMap<DataFileType,URL> dataFiles;

  /**
   * Instantiates a container for versioned Unicode data.
   *
   * @param version The Unicode version, either in form "X.X.X" or "X.X".
   * @param dataFiles Set of unicode data file types and corresponding URLs
   *  to be fetched and parsed.
   */
  UnicodeVersion(String version, EnumMap<DataFileType,URL> dataFiles) {
    this.dataFiles = dataFiles;
    setVersions(version, dataFiles.get(DataFileType.UNICODE_DATA));
  }

  /**
   * Fetches and parses the data files defined for this Unicode version.
   * 
   * @param log Where to put info about which files have been fetched and parsed
   * @throws IOException If there is a problem fetching or parsing
   *  any of this version's data files.
   */
  public void fetchAndParseDataFiles(Log log) throws IOException {
    // Use the enum ordering to process in the correct order 
    for (EnumMap.Entry<DataFileType,URL> entry : dataFiles.entrySet()) {
      DataFileType fileType = entry.getKey();
      URL url = entry.getValue();
      log.info("\t\tFetching/parsing: " + url.getPath());
      fileType.scan(url, this);
      log.info("\t\tCompleted: " + url.getPath());
    }
  }

  /**
   * Fills in majorMinorVersion and majorMinorUpdateVersion based on the passed
   * in version string.  Also fills in isArchaicPropListFormat, based on the
   * majorMinorVersion.
   *
   * @param version The Unicode version, in form "X.X.X" or "X.X".
   * @param unicodeDataURL The URL at which UnicodeData(-X.X.X).txt is located.
   */
  private void setVersions(String version, URL unicodeDataURL) {
    Matcher matcher = FULL_VERSION_PATTERN.matcher(version);
    if (matcher.matches()) {
      majorMinorUpdateVersion = matcher.group(0);
      majorMinorVersion = matcher.group(1);
    } else {
      majorMinorVersion = version;
      matcher = FULL_VERSION_PATTERN_IN_URL.matcher(unicodeDataURL.toString());
      if (matcher.find()) {
        majorMinorUpdateVersion = matcher.group(1);
      }
    }
  }

  public void emitToDir(File outputDir) throws IOException {
    PrintWriter writer = new PrintWriter
      (new File(outputDir, "Unicode" + getVersionSuffix() + ".java"), "UTF-8");
    writer.append("package jflex.unicode.data;\n\n");
    writer.append("public class Unicode").append(getVersionSuffix()).append(" {\n");
    emitMaximumCodePoint(writer);
    emitPropertyValuesArray(writer);
    emitIntervalsArray(writer);
    emitPropertyValueAliasesArray(writer);
    emitCaselessMatchPartitions(writer);
    writer.append("}\n");
    writer.flush();
    writer.close();
  }

  /**
   * Grows the partition containing the given codePoint and its caseless
   * equivalents, if any, to include all of them.
   *
   * @param codePoint The code point to include in a caselessly equivalent
   *  partition
   * @param uppercaseMapping A hex String representation of the uppercase
   *  mapping of codePoint, or null if there isn't one
   * @param lowercaseMapping A hex String representation of the lowercase
   *  mapping of codePoint, or null if there isn't one
   * @param titlecaseMapping A hex String representation of the titlecase
   *  mapping of codePoint, or null if there isn't one
   */
  void addCaselessMatches(int codePoint, String uppercaseMapping,
                                  String lowercaseMapping,
                                  String titlecaseMapping) {
    if ((null != uppercaseMapping && uppercaseMapping.length() > 0)
        || (null != lowercaseMapping && lowercaseMapping.length() > 0)
        || (null != titlecaseMapping && titlecaseMapping.length() > 0)) {

      Integer upper = null;
      if (null != uppercaseMapping && uppercaseMapping.length() > 0)
        upper = Integer.valueOf(uppercaseMapping, 16);
      else
        uppercaseMapping = null;

      Integer lower = null;
      if (null != lowercaseMapping && lowercaseMapping.length() > 0)
        lower = Integer.valueOf(lowercaseMapping, 16);
      else
        lowercaseMapping = null;

      Integer title = null;
      if (null != titlecaseMapping && titlecaseMapping.length() > 0)
        title = Integer.valueOf(titlecaseMapping, 16);
      else
        titlecaseMapping = null;

      SortedSet<Integer> partition = caselessMatchPartitions.get(codePoint);
      if (null == partition) {
        if (null != uppercaseMapping)
          partition = caselessMatchPartitions.get(upper);
        if (null == partition && null != lowercaseMapping)
          partition = caselessMatchPartitions.get(lower);
        if (null == partition && null != titlecaseMapping)
          partition = caselessMatchPartitions.get(title);
        if (null == partition) {
          partition = new TreeSet<Integer>();
        }
      }
      partition.add(codePoint);
      caselessMatchPartitions.put(codePoint, partition);
      
      if (null != uppercaseMapping) {
        partition.add(upper);
        caselessMatchPartitions.put(upper, partition);
      }
      if (null != lowercaseMapping) {
        partition.add(lower);
        caselessMatchPartitions.put(lower, partition);
      }
      if (null != titlecaseMapping) {
        partition.add(title);
        caselessMatchPartitions.put(title, partition);
      }

      if (partition.size() > caselessMatchPartitionSize) {
        caselessMatchPartitionSize = partition.size();
      }
    }
  }

  /**
   * Given a binary property name, and starting and ending code points, 
   * adds the interval to the {@link #propertyValueIntervals} map.
   *
   * @param propName The property name, e.g. "Assigned".
   * @param startCodePoint The first code point in the interval.
   * @param endCodePoint The last code point in the interval.
   */
  void addInterval(String propName, int startCodePoint, int endCodePoint) {
    propName = getCanonicalPropertyName(normalize(propName));
    if ( ! SURROGATE_PATTERN.matcher(propName).find()) {
      if (startCodePoint == 0xD800) {
        if (endCodePoint == 0xDFFF) {
          // Skip [U+D800-U+DFFF] for Bidi:Left-to-Right property for Unicode 2.1
          // Do nothing here
          return;
        } else if (endCodePoint > 0xDFFF) {
          // Skip [U+D800-U+DFFF] for Bidi:Left-to-Right property for Unicode
          // 3.0, but include the code points after this range.
          startCodePoint = 0xE000;
        }
      }
      List<NamedRange> intervals = propertyValueIntervals.get(propName);
      if (null == intervals) {
        intervals = new ArrayList<NamedRange>();
        propertyValueIntervals.put(propName, intervals);
      }
      // UnicodeData-1.1.5.txt does not list the end point for the Unified Han
      // range (starting point is listed as U+4E00).  This is U+9FFF according
      // to <http://unicode.org/Public/TEXT/OLDAPIX/CHANGES.TXT>:
      //
      //    U+4E00 ^ U+9FFF		20,992	I-ZONE Ideographs
      //
      // U+4E00 is listed in UnicodeData-1.1.5.txt as having the "Lo" property
      // value, as are the previous code points, so to include
      // [ U+4E00 - U+9FFF ], this interval should be extended to U+9FFF.
      if (endCodePoint == 0x4E00 && majorMinorVersion.equals("1.1")) {
        endCodePoint = 0x9FFF;
      }
      intervals.add(new NamedRange(startCodePoint, endCodePoint));
      
      usedBinaryProperties.add(propName);
    }
  }

  /**
   * Given an enumerated property name and value, and starting and ending code 
   * points, adds the interval to the {@link #propertyValueIntervals} map.
   *
   * @param propName The property name, e.g. "General_Category".
   * @param propValue The property value, e.g. "Lu"
   * @param startCodePoint The first code point in the interval.
   * @param endCodePoint The last code point in the interval.
   */
  void addInterval(String propName, String propValue, 
                   int startCodePoint, int endCodePoint) {
    propName = getCanonicalPropertyName(normalize(propName));
    propValue = getCanonicalPropertyValue(propName, normalize(propValue));
    
    // Skip surrogate properties [U+D800-U+DFFF], e.g. \p{Cs} - can't be
    // represented in valid UTF-16 encoded strings
    if ( ! SURROGATE_PATTERN.matcher(propValue).find()) {
      if (startCodePoint == 0xD800) {
        if (endCodePoint == 0xDFFF) {
          // Skip [U+D800-U+DFFF] for Bidi:Left-to-Right property for Unicode 2.1
          // Do nothing here
          return;
        } else if (endCodePoint > 0xDFFF) {
          // Skip [U+D800-U+DFFF] for Bidi:Left-to-Right property for Unicode
          // 3.0, but include the code points after this range.
          startCodePoint = 0xE000;
        }
      }

      // Unicode 2.0 has an error in Blocks-1.txt: two ranges overlap.
      // Since the single char in the second range (U+FEFF) is not an
      // Arabic character, but rather the zero-width no-break space char,
      // the FE70..FEFF block should be shortened to exclude this char;
      // this error is corrected in all following Unicode versions of
      // Blocks(-X|-X.X.X.).txt.
      //
      //   FE70; FEFF; Arabic Presentation Forms-B
      //   ...
      //   FEFF; FEFF; Specials
      if (startCodePoint == 0xFE70 && endCodePoint == 0xFEFF
          && majorMinorVersion.equals("2.0")) {
        endCodePoint = 0xFEFE;
      }
      String canonicalValue = propName + '=' + propValue;
      if (propName.equals(NORMALIZED_GENERAL_CATEGORY)
          || propName.equals(NORMALIZED_SCRIPT)) { 
        canonicalValue = propValue;
      }
      List<NamedRange> intervals = propertyValueIntervals.get(canonicalValue);
      if (null == intervals) {
        intervals = new ArrayList<NamedRange>();
        propertyValueIntervals.put(canonicalValue, intervals);
      }
      // UnicodeData-1.1.5.txt does not list the end point for the Unified Han
      // range (starting point is listed as U+4E00).  This is U+9FFF according
      // to <http://unicode.org/Public/TEXT/OLDAPIX/CHANGES.TXT>:
      //
      //    U+4E00 ^ U+9FFF		20,992	I-ZONE Ideographs
      //
      // U+4E00 is listed in UnicodeData-1.1.5.txt as having the "Lo" property
      // value, as are the previous code points, so to include
      // [ U+4E00 - U+9FFF ], this interval should be extended to U+9FFF.
      if (endCodePoint == 0x4E00 && majorMinorVersion.equals("1.1")) {
        endCodePoint = 0x9FFF;
      }
      intervals.add(new NamedRange(startCodePoint, endCodePoint));
      
      Set<String> usedValues = usedEnumeratedProperties.get(propName);
      if (null == usedValues) {
        usedValues = new HashSet<String>();
        usedEnumeratedProperties.put(propName, usedValues);
      }
      usedValues.add(propValue);
      
      // Initial letters of two-letter General Category property values
      // should be put on the used property values list
      if (propName.equals(NORMALIZED_GENERAL_CATEGORY) 
          && propValue.length() == 2) {
        String firstLetter = propValue.substring(0, 1);
        usedValues.add(firstLetter);
      }
    }
  }


  /**
   * Emits an int declaration and definition for the maximum code point listed
   * for this version in UnicodeData(-X.X.X).txt.
   *
   * @param writer Where to emit the maximum code point.
   */
  void emitMaximumCodePoint(PrintWriter writer) {
    writer.append("  public static final int maximumCodePoint")
      .append(" = 0x").append(Integer.toString(maximumCodePoint, 16))
      .append(";\n");
  }

  /**
   * Emits an array declaration and definition for the set of property values
   * supported by this version of Unicode.
   *
   * @param writer Where to emit the property values array.
   */
  void emitPropertyValuesArray(PrintWriter writer) {
    writer.append("  public static final String[] propertyValues")
      .append("\n    = { ");
    int item = 0;
    for (String propValue : propertyValueIntervals.keySet()) {
      if (++item == PROPERTY_VALUES_PER_LINE) {
        writer.append(",\n        ");
        item = 1;
      } else if (item > 1) {
        writer.append(", ");
      }
      writer.append("\"").append(propValue).append("\"");
    }
    writer.append(" };\n");
  }

  /**
   * Emits an array declaration and definition for the set of code point ranges
   * in this version of Unicode, corresponding to and in the same order as the
   * array of property values emitted in
   * {@link #emitPropertyValuesArray(java.io.PrintWriter)}.
   * <p/>
   * Note that String form is required for the amount of data associated with
   * the existing Unicode versions - when coded as static two-dimensional arrays
   * of int, the Java byte compiler complains that "code too large".  This is
   * apparently due to size limits in the specification for Java .class format.
   *
   * @param writer Where to emit the intervals array
   */
  void emitIntervalsArray(PrintWriter writer) {
    writer.append("  public static final String[] intervals").append(" = {\n");

    boolean isFirst = true;
    for (SortedMap.Entry<String,List<NamedRange>> entry
        : propertyValueIntervals.entrySet()) {
      String propertyValue = entry.getKey();
      List<NamedRange> intervals = entry.getValue();
      if (isFirst) {
        isFirst = false;
      } else {
        writer.append(",\n");
      }
      writer.append("    // Unicode ").append(majorMinorVersion)
        .append(" property value: {").append(propertyValue)
        .append("}\n");
      int count = 0;
      boolean isFirstIntervalLine = true;
      for (NamedRange interval : intervals) {
        if (++count > INTERVALS_PER_LINE) {
          writer.append("\n");
          count = 1;
        }
        if (count == 1) {
          writer.append(isFirstIntervalLine ? "        \"" : "      + \"");
        } else {
          writer.append("+\"");
        }
        isFirstIntervalLine = false;
        emitEscapedUTF16Char(writer, interval.start);
        emitEscapedUTF16Char(writer, interval.end);
        writer.append("\"");
      }
    }
    writer.append("  };\n");
  }

  /**
   * Called by emitPropertyValueAliasesArray() to populate a map of
   * all possible aliases for the encountered properties and their values. 
   * 
   * @return a sorted map of all possible aliases for used properties & values
   */
  private SortedMap<String,String> getUsedPropertyValueAliases() {
    SortedMap<String,String> usedPropertyValueAliases
      = new TreeMap<String,String>();
    for (String binaryProperty : usedBinaryProperties) {
      for (String nameAlias : getPropertyAliases(binaryProperty)) {
        if ( ! nameAlias.equals(binaryProperty)) {
          usedPropertyValueAliases.put(nameAlias, binaryProperty);
        }
      }
    }
    Set<String> genCatProps 
      = usedEnumeratedProperties.get(NORMALIZED_GENERAL_CATEGORY); 
    if (null != genCatProps) {
      genCatProps.add("lc");
    }
    for (Map.Entry<String,Set<String>> entry : usedEnumeratedProperties.entrySet()) {
      String propName = entry.getKey();
      Set<String> propValues = entry.getValue();
      for (String propValue : propValues) {
        String canonicalValue = propName + '=' + propValue;
        
        // Add value-only aliases for General Category and Script properties.
        if (propName.equals(NORMALIZED_SCRIPT)
            || propName.equals(NORMALIZED_GENERAL_CATEGORY)) {
          canonicalValue = propValue;
          for (String valueAlias : getPropertyValueAliases(propName, propValue)) {
            if ( ! valueAlias.equals(propValue)) {
              usedPropertyValueAliases.put(valueAlias, propValue);
            }
          }
        }
        for (String nameAlias : getPropertyAliases(propName)) {
          for (String valueAlias : getPropertyValueAliases(propName, propValue)) {
            // Both property names and values have self-aliases; when generating
            // all possible alias combinations, exclude the one that is the same
            // as the full property name + full property value, unless the
            // property is General Category or Script.
            if (propName.equals(NORMALIZED_SCRIPT)
                || propName.equals(NORMALIZED_GENERAL_CATEGORY)
                || ! (nameAlias.equals(propName) && valueAlias.equals(propValue))) {
              String alias = nameAlias + '=' + valueAlias;
              usedPropertyValueAliases.put(alias, canonicalValue);
            }
          }
        }
      }
    }
    return usedPropertyValueAliases;
  }

  /**
   * Emits an array declaration and definition of alternating key/value mappings
   * from property value aliases to target property values.
   *
   * @param writer Where to emit the intervals array
   */
  void emitPropertyValueAliasesArray(PrintWriter writer) {
    writer.append("  public static final String[] propertyValueAliases")
      .append(" = {\n        ");

    int count = 0;
    boolean isFirstLine = true;
    for (SortedMap.Entry<String,String> entry 
         : getUsedPropertyValueAliases().entrySet()) {
      if (++count > PROPERTY_VALUE_ALIAS_MAPPINGS_PER_LINE) {
        writer.append(",\n        ");
        count = 1;
      } else if ( ! isFirstLine) {
        writer.append(",   ");
      } else {
        isFirstLine = false;
      }
      String alias = entry.getKey();
      String propertyValue = entry.getValue();
      writer.append("\"").append(alias).append("\", \"").append(propertyValue)
        .append("\"");
    }
    writer.append("\n  };\n");
  }

  /**
   * Emits a constant assigned the size of each partition record (the maximum
   * partition size) and a string representing a sequence of fixed-length
   * partition records.  For partitions smaller than the maximum size, the
   * unused fields are populated with \u0000.
   *
   * @param writer Where to emit the caseless match partitions
   */
  void emitCaselessMatchPartitions(PrintWriter writer) {
    writer.append("  public static final int caselessMatchPartitionSize")
      .append(" = ").append(Integer.toString(caselessMatchPartitionSize))
      .append(";\n");
    writer.append("  public static final String caselessMatchPartitions")
      .append(" =\n");

    // Putting all of the partitions into a set ensures there are no duplicates
    SortedMap<Integer,SortedSet<Integer>> partitions
      = new TreeMap<Integer,SortedSet<Integer>>();
    for (SortedSet<Integer> partition: caselessMatchPartitions.values()) {
      partitions.put(partition.first(), partition);
    }

    int count = 0;
    boolean isFirstPartitionLine = true;
    for (SortedSet<Integer> partition : partitions.values()) {
      if (++count > CASELESS_MATCH_PARTITIONS_PER_LINE) {
        writer.append("\n");
        count = 1;
      }

      if (count == 1)
        writer.append(isFirstPartitionLine ? "        \"" : "      + \"");
      else
        writer.append("+\"");

      isFirstPartitionLine = false;

      for (Integer c : partition)
        emitEscapedUTF16Char(writer, c);

      // Add \u0000 placeholders to fill out the fixed record size
      for (int i = 0 ; i < caselessMatchPartitionSize - partition.size() ; ++i)
        emitEscapedUTF16Char(writer, 0);

      writer.append("\"");
    }
    writer.append(";\n");
  }

  /**
   * Emits an escaped character:
   * <ul>
   *   <li>in form "\\uXXXX", where XXXX is the hexadecimal form of the code
   *       point, if the given point is in the Basic Multilingual Plane (BMP);
   *       or</li>
   *   <li>in form "\\uXXXX\\uYYYY", where XXXX and YYYY are the high and low
   *       surrogates, respectively, representing the given point in UTF-16
   *       form, if the given code point is above the BMP.</li>
   * </ul>
   *
   * @param writer Where to emit the escaped character.
   * @param codePoint The code point for which to emit an escaped character.
   */
  private void emitEscapedUTF16Char(PrintWriter writer, int codePoint) {
    if (codePoint <= 0xFFFF) {
      emitEscapedBMPChar(writer, codePoint);
    } else { // codePoint > 0xFFFF - above the BMP
      if (codePoint < 0x110000) {
        for (char surrogate : Character.toChars(codePoint))
          emitEscapedBMPChar(writer, (int)surrogate);
      } else {
        writer.append("<").append(Integer.toString(codePoint, 16)).append(">");
      }
    }
  }

  /**
   * Emits an escaped character in the form "\\uXXXX", where XXXX is the
   * hexadecimal form of the given code point, which must be in the Basic
   * Multilingual Plane (BMP).  Called from 
   * {@link #emitEscapedUTF16Char(PrintWriter,int)}
   *
   * @param writer Where to emit the escaped character.
   * @param codePoint The code point for which to emit an escaped character.
   */
  private void emitEscapedBMPChar(PrintWriter writer, int codePoint) {
    switch(codePoint) {
      // Special treatment for the quotation mark (U+0022).  "\u0022" triggers
      // a syntax error when it is included in a literal string, because it is 
      // interpreted as "[...]"[...]" (literally), and leads the compiler to
      // think that the enclosing quotation marks are unbalanced.
      case 0x22: writer.append("\\\"");  break;
      case  0x0: writer.append("\\000"); break;
      case  0x9: writer.append("\\t");   break;
      case  0xA: writer.append("\\n");   break;
      case  0xC: writer.append("\\f");   break;
      case  0xD: writer.append("\\r");   break;
      case 0x5C: writer.append("\\\\");  break;
        default: writer.append(String.format("\\u%04x", codePoint));
    }
  }

  /**
   * Returns an identifier suffix based on the Unicode major.minor version,
   * substituting an underscore for the period, and with a leading underscore,
   * for use in naming versioned Unicode data in the generated
   * UnicodeProperties.java.
   *
   * @return "_X_Y", where X = major version, and Y = minor version.
   */
  String getVersionSuffix() {
    return "_" + majorMinorVersion.replace(".", "_");
  }

  /**
   * Transforms mixed case identifiers containing spaces, hyphens, and/or
   * underscores by downcasing and removing all spaces, hyphens, underscores,
   * and parentheses; also, converts property name/value separator ':' to '='.
   *
   * @param identifier The identifier to transform
   * @return The transformed identifier
   */
  static String normalize(String identifier) {
    if (null == identifier)
      return identifier;
    String normalized
      = WORD_SEP_PATTERN.matcher(identifier.toLowerCase()).replaceAll("");
    return normalized.replace(':', '=');
  }

  /**
   * Called from {@link #getUsedPropertyValueAliases()} to get a set of aliases
   * for the given property name.  If none exists, an empty set is returned.
   * 
   * @param propertyName The property name for which to lookup aliases.
   * @return the aliases for the given property name; if none exists, an empty
   *  set is returned.
   */
  Set<String> getPropertyAliases(String propertyName) {
    Set<String> aliases = allPropertyAliases.get(propertyName);
    if (null == aliases) {
      aliases = Collections.emptySet();
    }
    return aliases;
  }


  /**
   * Called from {@link #getUsedPropertyValueAliases()} to get a set of aliases
   * for the given property name and value.  If none exists, an empty set is
   * returned.
   * 
   * @param propertyName The property name to use when looking up aliases for
   *  the given property value
   * @param propertyValue The property value for which to lookup aliases.
   * @return the aliases for the given property name and value; if none exists,
   *  an empty set is returned.
   */
  Set<String> getPropertyValueAliases(String propertyName, String propertyValue) {
    Set<String> aliases = null;
    Map<String,Set<String>> values = allPropertyValueAliases.get(propertyName);
    if (null != values) {
      aliases = values.get(propertyValue); 
    }
    if (null == aliases) {
      aliases = Collections.emptySet();
    }
    return aliases;
  }

  /**
   * For the given property name or alias, returns the canonical property name.
   * If none has been encountered, then the given propertyAlias is returned.
   * 
   * @param propertyAlias The property name or alias for which to lookup the
   *  canonical property name.
   * @return the canonical property name for the given property name or alias.
   *  If none has been encountered, then the given propertyAlias is returned.
   */
  String getCanonicalPropertyName(String propertyAlias) {
    String canonicalName = null;
    propertyAlias = normalize(propertyAlias);
    if (null != propertyAlias2CanonicalName) {
      canonicalName = propertyAlias2CanonicalName.get(propertyAlias);
    }
    return null == canonicalName ? propertyAlias : canonicalName;
  }

  /**
   * For the given property name and property value (or property value alias),
   * returns the canonical property value.  If none has been encountered, then
   * the given propertyValueAlias is returned.
   * 
   * @param propertyName The property name to use when looking up a property value
   * @param propertyValueAlias The property value (alias) for which to look up
   *  the canonical property value.
   * @return the canonical property value for the given property name and 
   *  property value (alias); if none is found, the given propertyValueAlias is 
   *  returned.
   */
  String getCanonicalPropertyValue(String propertyName, 
                                   String propertyValueAlias) {
    String canonicalValue = null;
    if (null != propertyValueAlias2CanonicalValue) {
      Map<String,String> valueAliases 
        = propertyValueAlias2CanonicalValue.get(propertyName);
      if (null != valueAliases) {
        canonicalValue = valueAliases.get(propertyValueAlias);
      }
    }
    return null == canonicalValue ? propertyValueAlias : canonicalValue;
  }

  /**
   * Called from PropertyValueAliasesScanner to populate the property values
   * and property value aliases for a property.
   * 
   * @param propertyAlias The alias for a property name (or the property itself)
   * @param propertyValue The property value for which to set the aliases 
   * @param propertyValueAliases The aliases to set for the given propertyValue
   */
  void addPropertyValueAliases
    (String propertyAlias, String propertyValue, Set<String> propertyValueAliases) {
    String propertyName = getCanonicalPropertyName(propertyAlias);
    propertyValue = normalize(propertyValue);
    
    propertyValueAliases.add(propertyValue);
    Map<String,Set<String>> propertyValue2Aliases 
      = allPropertyValueAliases.get(propertyName);
    if (null == propertyValue2Aliases) {
      propertyValue2Aliases = new HashMap<String,Set<String>>();
      allPropertyValueAliases.put(propertyName, propertyValue2Aliases);
    }
    propertyValue2Aliases.put(propertyValue, propertyValueAliases);
    
    Map<String,String> aliasMap 
      = propertyValueAlias2CanonicalValue.get(propertyName);
    if (null == aliasMap) {
      aliasMap = new HashMap<String,String>();
      propertyValueAlias2CanonicalValue.put(propertyName, aliasMap);
    }
    for (String propertyValueAlias : propertyValueAliases) {
      propertyValueAlias = normalize(propertyValueAlias);
      aliasMap.put(propertyValueAlias, propertyValue);
    }
  }
  
  /**
   * Sets the maximum code point for this Unicode version.
   * @param maximumCodePoint The new maximum code point for this Unicode version
   */
  void setMaximumCodePoint(int maximumCodePoint) {
    this.maximumCodePoint = maximumCodePoint;
  }

  /**
   * Returns the maximum code point for this Unicode version.
   * @return the maximum code point for this Unicode version.
   */
  public int getMaximumCodePoint() {
    return maximumCodePoint;
  }
}
