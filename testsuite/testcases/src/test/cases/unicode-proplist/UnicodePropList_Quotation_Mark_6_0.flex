%%

%unicode 6.0
%public
%class UnicodePropList_Quotation_Mark_6_0

%type int
%standalone

%include src/test/resources/common-unicode-binary-property-java

%%

\p{Quotation_Mark} { setCurCharPropertyValue(); }
[^] { }

<<EOF>> { printOutput(); return 1; }
