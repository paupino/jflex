%%

%unicode 6.2
%public
%class UnicodePropList_Noncharacter_Code_Point_6_2

%type int
%standalone

%include ../../resources/common-unicode-binary-property-java

%%

\p{Noncharacter_Code_Point} { setCurCharPropertyValue(); }
[^] { }

<<EOF>> { printOutput(); return 1; }
