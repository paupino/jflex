%%

%unicode 4.1
%public
%class UnicodeWhiteSpace2_4_1

%type int
%standalone

%include ../../resources/common-unicode-enumerated-property-java

%%

<<EOF>> { printOutput(); return 1; }
\s { setCurCharPropertyValue("Whitespace"); }
[^\s] { setCurCharPropertyValue("Not-Whitespace"); }
