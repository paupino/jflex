%%

%unicode 4.0
%public
%class UnicodePropList_Soft_Dotted_4_0

%type int
%standalone

%include src/test/resources/common-unicode-binary-property-java

%%

\p{Soft_Dotted} { setCurCharBlock(); }
[^] { }

<<EOF>> { printOutput(); return 1; }
