%%

%unicode 5.2
%public
%class UnicodeGraphemeClusterBreak_5_2

%type int
%standalone

%include ../../resources/common-unicode-enumerated-property-java

%%

<<EOF>> { printOutput(); return 1; }
\p{GraphemeClusterBreak:CR} { setCurCharPropertyValue("GraphemeClusterBreak:CR"); }
\p{GraphemeClusterBreak:Control} { setCurCharPropertyValue("GraphemeClusterBreak:Control"); }
\p{GraphemeClusterBreak:Extend} { setCurCharPropertyValue("GraphemeClusterBreak:Extend"); }
\p{GraphemeClusterBreak:L} { setCurCharPropertyValue("GraphemeClusterBreak:L"); }
\p{GraphemeClusterBreak:LF} { setCurCharPropertyValue("GraphemeClusterBreak:LF"); }
\p{GraphemeClusterBreak:LV} { setCurCharPropertyValue("GraphemeClusterBreak:LV"); }
\p{GraphemeClusterBreak:LVT} { setCurCharPropertyValue("GraphemeClusterBreak:LVT"); }
\p{GraphemeClusterBreak:Other} { setCurCharPropertyValue("GraphemeClusterBreak:Other"); }
\p{GraphemeClusterBreak:Prepend} { setCurCharPropertyValue("GraphemeClusterBreak:Prepend"); }
\p{GraphemeClusterBreak:SpacingMark} { setCurCharPropertyValue("GraphemeClusterBreak:SpacingMark"); }
\p{GraphemeClusterBreak:T} { setCurCharPropertyValue("GraphemeClusterBreak:T"); }
\p{GraphemeClusterBreak:V} { setCurCharPropertyValue("GraphemeClusterBreak:V"); }
