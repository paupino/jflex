%%

%unicode 3.2
%public
%class UnicodePropList_Ideographic_3_2

%type int
%standalone

%include src/test/resources/common-unicode-binary-property-java

%%

\p{Ideographic} { setCurCharBlock(); }
[^] { }

<<EOF>> { printOutput(); return 1; }
