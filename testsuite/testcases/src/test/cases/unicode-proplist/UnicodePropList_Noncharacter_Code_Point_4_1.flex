%%

%unicode 4.1
%public
%class UnicodePropList_Noncharacter_Code_Point_4_1

%type int
%standalone

%include src/test/resources/common-unicode-binary-property-java

%%

\p{Noncharacter_Code_Point} { setCurCharBlock(); }
[^] { }

<<EOF>> { printOutput(); return 1; }
