%%

%unicode 5.1
%public
%class UnicodePropList_Ideographic_5_1

%type int
%standalone

%include src/test/resources/common-unicode-binary-property-java

%%

\p{Ideographic} { setCurCharPropertyValue(); }
[^] { }

<<EOF>> { printOutput(); return 1; }
