%%

%unicode 4.1
%public
%class UnicodeCompatibilityProperties_xdigit_4_1

%type int
%standalone

%include src/test/resources/common-unicode-binary-property-java

%%

\p{xdigit} { setCurCharPropertyValue(); }
[^] { }

<<EOF>> { printOutput(); return 1; }
