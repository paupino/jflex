%%

%unicode 3.1
%public
%class UnicodePropList_Other_Alphabetic_3_1

%type int
%standalone

%include ../../resources/common-unicode-binary-property-java

%%

\p{Other_Alphabetic} { setCurCharPropertyValue(); }
[^] { }

<<EOF>> { printOutput(); return 1; }
